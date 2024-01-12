import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'fruit.g.dart';

@HiveType(typeId: 5)
enum FruitType {
  @HiveField(0)
  apple,

  @HiveField(1)
  banana,

  @HiveField(2)
  orange,
}

@HiveType(typeId: 6)
class Fruit {
  @HiveField(0)
  final FruitType fruitType;

  @HiveField(1)
  final int quantity;

  Fruit({
    required this.fruitType,
    required this.quantity,
  });

  Fruit copyWith({FruitType? fruitType, int? quantity}) {
    return Fruit(
      fruitType: fruitType ?? this.fruitType,
      quantity: quantity ?? this.quantity,
    );
  }
}

extension FruitTypeExtenion on FruitType {
  /// Get the image asset of the fruit according to [FruitType]
  /// Optionally, [isDragged] determines if the opacity should be halved
  Image getAsset({bool isDragged = false}) {
    String assetPath;

    switch (this) {
      case FruitType.apple:
        assetPath = 'assets/images/apple.png';
        break;

      case FruitType.banana:
        assetPath = 'assets/images/banana.png';
        break;

      case FruitType.orange:
        assetPath = 'assets/images/orange.png';
        break;
    }

    return Image.asset(
      assetPath,
      width: 48,
      height: 48,
      opacity: isDragged ? const AlwaysStoppedAnimation(0.5) : null,
    );
  }
}
