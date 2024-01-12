import 'package:technical_test_example/features/domain/entities/fruit.dart';

class DraggableFruit {
  final FruitType fruitType;

  final int sourceIndex;

  final bool fromBasket;

  DraggableFruit({
    required this.fruitType,
    required this.sourceIndex,
    this.fromBasket = false,
  });
}
