import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_example/features/domain/entities/draggable_fruit.dart';
import 'package:technical_test_example/features/presentation/widgets/fruit/draggable_fruit_list.dart';

import '../../../domain/entities/fruit.dart';
import '../../bloc/fruit_bloc.dart';

class BasketItem extends StatelessWidget {
  final List<Fruit> fruits;
  final int basketIndex;

  const BasketItem(
      {super.key, required this.fruits, required this.basketIndex});

  @override
  Widget build(BuildContext context) {
    return DragTarget<DraggableFruit>(
      onAccept: (draggableFruit) {
        context.read<FruitBloc>().add(
              MoveEvent(
                sourceIndex: draggableFruit.sourceIndex,
                destinationIndex: basketIndex,
                fruitType: draggableFruit.fruitType,
                toBasket: true,
                fromBasket: draggableFruit.fromBasket,
              ),
            );
      },
      builder: (BuildContext context, List<DraggableFruit?> candidateData,
          List<dynamic> rejectedData) {
        return Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/basket.png',
                  width: 32,
                  height: 32,
                ),
                DraggableFruitList(
                  fruits: fruits,
                  index: basketIndex,
                  fromBasket: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
