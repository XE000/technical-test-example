import 'package:flutter/material.dart';
import 'package:technical_test_example/features/domain/entities/draggable_fruit.dart';

import '../../../domain/entities/fruit.dart';

class DraggableFruitItem extends StatelessWidget {
  final FruitType fruitType;
  final int sourceIndex;
  final bool fromBasket;

  const DraggableFruitItem({
    super.key,
    required this.fruitType,
    required this.sourceIndex,
    this.fromBasket = false,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<DraggableFruit>(
      data: DraggableFruit(
        fruitType: fruitType,
        sourceIndex: sourceIndex,
        fromBasket: fromBasket,
      ),
      feedback: fruitType.getAsset(isDragged: true),
      child: fruitType.getAsset(),
    );
  }
}
