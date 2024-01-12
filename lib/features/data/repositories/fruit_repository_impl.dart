import 'package:fpdart/fpdart.dart';
import 'package:technical_test_example/core/errors/exceptions.dart';
import 'package:technical_test_example/core/errors/failures.dart';
import 'package:technical_test_example/features/data/datasources/fruit_local_data_source.dart';
import 'package:technical_test_example/features/data/models/fruit_data.dart';
import 'package:technical_test_example/features/domain/repositories/fruit_repository.dart';

class FruitRepositoryImpl extends FruitRepository {
  final FruitLocalDataSource localDataSource;

  FruitRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, FruitData>> loadPersistentData() async {
    try {
      return Right(await localDataSource.loadPersistentData());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> saveData(FruitData fruitData) async {
    await localDataSource.savePersistentData(fruitData);
  }
}
