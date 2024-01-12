import 'package:hive/hive.dart';

import 'fruit.dart';

part 'fruit_container.g.dart';

@HiveType(typeId: 2)
class FruitContainer {
  @HiveField(0)
  final List<Fruit> fruits;

  FruitContainer({
    this.fruits = const [],
  });

  FruitContainer copyWith({List<Fruit>? fruits}) {
    return FruitContainer(fruits: fruits ?? this.fruits);
  }
}
