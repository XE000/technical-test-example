import 'package:hive_flutter/hive_flutter.dart';
import 'package:technical_test_example/core/errors/exceptions.dart';
import 'package:technical_test_example/features/data/models/fruit_data.dart';

abstract class FruitLocalDataSource {
  Future<FruitData> loadPersistentData();

  Future<void> savePersistentData(FruitData saveData);
}

class FruitLocalDataSourceImpl extends FruitLocalDataSource {
  final Box box;

  FruitLocalDataSourceImpl(this.box);

  @override
  Future<FruitData> loadPersistentData() {
    final FruitData? data = box.get('data');

    if (data == null) throw CacheException();

    return Future.value(data);
  }

  @override
  Future<void> savePersistentData(FruitData saveData) {
    return box.put('data', saveData);
  }
}
