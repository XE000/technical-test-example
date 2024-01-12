import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_example/features/domain/entities/draggable_fruit.dart';
import 'package:technical_test_example/features/presentation/widgets/fruit/draggable_fruit_list.dart';

import '../../../domain/entities/fruit.dart';
import '../../bloc/fruit_bloc.dart';

class TrayItem extends StatelessWidget {
  final List<Fruit> fruits;
  final int trayIndex;

  const TrayItem({super.key, required this.fruits, required this.trayIndex});

  @override
  Widget build(BuildContext context) {
    return DragTarget<DraggableFruit>(
      onAccept: (draggableFruit) {
        context.read<FruitBloc>().add(
              MoveEvent(
                sourceIndex: draggableFruit.sourceIndex,
                destinationIndex: trayIndex,
                fruitType: draggableFruit.fruitType,
                fromBasket: draggableFruit.fromBasket,
              ),
            );
      },
      builder: (BuildContext context, List<DraggableFruit?> candidateData,
          List<dynamic> rejectedData) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DraggableFruitList(
              fruits: fruits,
              index: trayIndex,
            ),
          ),
        );
      },
    );
  }
}
