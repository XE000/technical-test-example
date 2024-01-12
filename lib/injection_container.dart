import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:technical_test_example/core/utils/tray_generator.dart';
import 'package:technical_test_example/features/data/datasources/fruit_local_data_source.dart';
import 'package:technical_test_example/features/data/repositories/fruit_repository_impl.dart';
import 'package:technical_test_example/features/domain/repositories/fruit_repository.dart';
import 'package:technical_test_example/features/domain/usecases/load_data_from_persistent_storage.dart';
import 'package:technical_test_example/features/domain/usecases/save_data_to_persistent_storage.dart';
import 'package:technical_test_example/features/presentation/bloc/fruit_bloc.dart';

final injector = GetIt.I;

Future<void> injectDepedencies() async {
  final hive = await Hive.openBox('fruits_data');
  injector.registerLazySingleton(() => hive);

  injector.registerLazySingleton<FruitLocalDataSource>(
    () => FruitLocalDataSourceImpl(injector()),
  );

  injector.registerLazySingleton<FruitRepository>(
    () => FruitRepositoryImpl(injector()),
  );

  injector.registerLazySingleton(() => TrayGenerator());

  injector
      .registerLazySingleton(() => LoadDataFromPersistentStorage(injector()));

  injector.registerLazySingleton(() => SaveDataToPersistentStorage(injector()));

  injector.registerFactory(
    () => FruitBloc(
      loadDataFromPersistentStorage: injector(),
      saveDataToPersistentStorage: injector(),
      trayGenerator: injector(),
    ),
  );
}
