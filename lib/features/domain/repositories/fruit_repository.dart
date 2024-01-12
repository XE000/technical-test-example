import 'package:fpdart/fpdart.dart';

import '../../../core/errors/failures.dart';
import '../../data/models/fruit_data.dart';

abstract class FruitRepository {
  Future<Either<Failure, FruitData>> loadPersistentData();
  Future<void> saveData(FruitData fruitData);
}
