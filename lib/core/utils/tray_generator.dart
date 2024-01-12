import 'dart:math';

import '../../features/domain/entities/fruit.dart';
import '../../features/domain/entities/tray.dart';

class TrayGenerator {
  /// Generate 10 trays with random states and random quantity of fruits
  /// Random state of 0 is an empty tray,
  /// 1: a tray of apples,
  /// 2: a tray of bananas,
  /// 3: a tray of oranges
  ///
  List<Tray> generate() {
    return List.generate(
      10,
      (index) {
        final Random random = Random();
        final randomState = random.nextInt(4);
        final randomQuantity = random.nextInt(6) + 1;

        return randomState == 0
            ? Tray()
            : Tray(
                fruits: [
                  randomState == 1
                      ? Fruit(
                          fruitType: FruitType.apple,
                          quantity: randomQuantity,
                        )
                      : randomState == 2
                          ? Fruit(
                              fruitType: FruitType.banana,
                              quantity: randomQuantity,
                            )
                          : Fruit(
                              fruitType: FruitType.orange,
                              quantity: randomQuantity,
                            ),
                ],
              );
      },
    );
  }
}
