import 'package:hive/hive.dart';
import 'package:technical_test_example/features/domain/entities/fruit_container.dart';

import 'fruit.dart';

part 'basket.g.dart';

@HiveType(typeId: 3)
class Basket extends FruitContainer {
  Basket({super.fruits = const []});

  @override
  Basket copyWith({List<Fruit>? fruits}) {
    return Basket(fruits: fruits ?? this.fruits);
  }
}
