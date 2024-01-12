import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:technical_test_example/core/usecases/usecase.dart';
import 'package:technical_test_example/core/utils/tray_generator.dart';
import 'package:technical_test_example/features/data/models/fruit_data.dart';
import 'package:technical_test_example/features/domain/entities/fruit.dart';

import '../../domain/entities/basket.dart';
import '../../domain/entities/tray.dart';
import '../../domain/usecases/load_data_from_persistent_storage.dart';
import '../../domain/usecases/save_data_to_persistent_storage.dart';

part 'fruit_event.dart';
part 'fruit_state.dart';

class FruitBloc extends Bloc<FruitEvent, FruitState> {
  final LoadDataFromPersistentStorage loadDataFromPersistentStorage;
  final SaveDataToPersistentStorage saveDataToPersistentStorage;
  final TrayGenerator trayGenerator;

  // Set the initial state of the bloc using [TrayGenerator.generate] to
  // randomly generate data for trays, and create 3 empty baskets
  FruitBloc(
      {required this.loadDataFromPersistentStorage,
      required this.saveDataToPersistentStorage,
      required this.trayGenerator})
      : super(const FruitState(trays: [], baskets: [])) {
    _initState();
    on<MoveEvent>(onMove);
  }

  /// Loads the initial state from persistent storage. If [CacheFailure] was
  /// received, then new data will be generated automatically.
  void _initState() async {
    (await loadDataFromPersistentStorage.call(NoParams())).fold(
      (l) => emit(
        FruitState(
          trays: trayGenerator.generate(),
          baskets: List.generate(3, (index) => Basket()),
        ),
      ),
      (r) => emit(FruitState(trays: r.trays, baskets: r.baskets)),
    );
  }

  void onMove(MoveEvent event, Emitter emit) {
    // Cancel operation if user is dragging and dropping in the same place
    if (event.sourceIndex == event.destinationIndex) return;

    // Declare lists from event
    final List<Tray> trays = List.from(state.trays);
    final List<Basket> baskets = List.from(state.baskets);

    // Declare indexes from source and destination
    final int sourceIndex = event.sourceIndex;
    final int destinationIndex = event.destinationIndex;

    // Declare source/destination trays or baskets,
    // depending on [event.fromBasket] or [event.toBasket] arguments
    Tray? sourceTray;
    Tray? destinationTray;
    Basket? sourceBasket;
    Basket? destinationBasket;

    if (event.fromBasket) {
      sourceBasket = baskets[sourceIndex];
    } else {
      sourceTray = trays[sourceIndex];
    }

    if (event.toBasket) {
      destinationBasket = baskets[destinationIndex];
    } else {
      destinationTray = trays[destinationIndex];
    }

    // Declare the list of fruits from source and destination
    final List<Fruit> sourceFruits =
        List.from(event.fromBasket ? sourceBasket!.fruits : sourceTray!.fruits);
    final List<Fruit> destinationFruits = List.from(
        event.toBasket ? destinationBasket!.fruits : destinationTray!.fruits);

    // Declare the index of the fruit in the source and destination lists
    final int sourceFruitIndex = sourceFruits
        .indexWhere((element) => element.fruitType == event.fruitType);
    final int destinationFruitIndex = destinationFruits
        .indexWhere((element) => element.fruitType == event.fruitType);

    // Declare the source fruit
    final Fruit sourceFruit = sourceFruits[sourceFruitIndex];

    // Declare the destination fruit IF the destination fruit index was found,
    // otherwise, we will just add a new copy of the source fruit with the
    // quantity of 1 in the destination fruits list.
    if (destinationFruitIndex == -1) {
      destinationFruits.add(sourceFruit.copyWith(quantity: 1));
    } else {
      final Fruit destinationFruit = destinationFruits[destinationFruitIndex];
      destinationFruits[destinationFruitIndex] =
          destinationFruit.copyWith(quantity: destinationFruit.quantity + 1);
    }

    // Remove the fruit entirely if the quantity is already 1,
    // otherwise, just subtract 1 from the quantity and replace the
    // [sourceFruit] object using the [sourceFruitIndex] with a new copy in
    // the [sourceFruits] list.
    if (sourceFruit.quantity <= 1) {
      sourceFruits.removeAt(sourceFruitIndex);
    } else {
      sourceFruits[sourceFruitIndex] =
          sourceFruit.copyWith(quantity: sourceFruit.quantity - 1);
    }

    // Create a copy of [sourceBasket] or [sourceTray] and replace the fruits
    // list with the newly modified [sourceFruits] list and replace the
    // existing [sourceBasket] or [sourceTray] with the new copy to
    // either basket or tray using the [sourceIndex].
    if (event.fromBasket) {
      baskets[sourceIndex] = sourceBasket!.copyWith(fruits: sourceFruits);
    } else {
      trays[sourceIndex] = sourceTray!.copyWith(fruits: sourceFruits);
    }

    // We do the same as above for the destination items, but looking at the
    // [event.toBasket] argument instead.
    if (event.toBasket) {
      baskets[destinationIndex] =
          destinationBasket!.copyWith(fruits: destinationFruits);
    } else {
      trays[destinationIndex] =
          destinationTray!.copyWith(fruits: destinationFruits);
    }

    saveDataToPersistentStorage.call(
      Params(
        FruitData(trays: trays, baskets: baskets),
      ),
    );

    // Emit the new state to rebuild UI
    emit(
      FruitState(
        trays: trays,
        baskets: baskets,
      ),
    );
  }
}
