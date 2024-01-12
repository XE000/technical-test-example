import 'package:hive/hive.dart';
import 'package:technical_test_example/features/domain/entities/fruit_container.dart';

import 'fruit.dart';

part 'tray.g.dart';

@HiveType(typeId: 4)
class Tray extends FruitContainer {
  Tray({super.fruits = const []});

  @override
  Tray copyWith({List<Fruit>? fruits}) {
    return Tray(fruits: fruits ?? this.fruits);
  }
}
