import 'package:flutter/material.dart';
import 'package:technical_test_example/features/presentation/widgets/basket/basket_item.dart';

import '../../../domain/entities/basket.dart';

class BasketList extends StatelessWidget {
  final List<Basket> baskets;

  const BasketList({super.key, required this.baskets});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: baskets.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BasketItem(
              basketIndex: index,
              fruits: baskets[index].fruits,
            ),
          );
        },
      ),
    );
  }
}
