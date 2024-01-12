import 'package:flutter/cupertino.dart';

import '../../../domain/entities/fruit.dart';
import 'draggable_fruit_item.dart';

class DraggableFruitList extends StatelessWidget {
  final List<Fruit> fruits;
  final int index;
  final bool fromBasket;

  const DraggableFruitList(
      {super.key,
      required this.fruits,
      required this.index,
      this.fromBasket = false});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (int i = 0; i < fruits.length; i++)
          for (int j = 0; j < fruits[i].quantity; j++)
            DraggableFruitItem(
              fruitType: fruits[i].fruitType,
              sourceIndex: index,
              fromBasket: fromBasket,
            ),
      ],
    );
  }
}
