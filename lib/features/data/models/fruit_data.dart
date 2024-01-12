import 'package:hive/hive.dart';

import '../../domain/entities/basket.dart';
import '../../domain/entities/tray.dart';

part 'fruit_data.g.dart';

@HiveType(typeId: 1)
class FruitData {
  @HiveField(0)
  final List<Tray> trays;

  @HiveField(1)
  final List<Basket> baskets;

  const FruitData({this.trays = const [], this.baskets = const []});

  FruitData copyWith({List<Tray>? trays, List<Basket>? baskets}) {
    return FruitData(
      trays: trays ?? this.trays,
      baskets: baskets ?? this.baskets,
    );
  }
}
