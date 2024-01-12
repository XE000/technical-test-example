import 'package:fpdart/fpdart.dart';
import 'package:technical_test_example/core/errors/exceptions.dart';
import 'package:technical_test_example/features/data/models/fruit_data.dart';
import 'package:technical_test_example/features/domain/repositories/fruit_repository.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../core/errors/failures.dart';

class SaveDataToPersistentStorage implements UseCase<void, Params> {
  final FruitRepository repository;

  SaveDataToPersistentStorage(this.repository);

  @override
  Future<Either<Failure, void>> call(Params params) async {
    try {
      await repository.saveData(params.fruitData);
      return const Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}

class Params {
  final FruitData fruitData;

  Params(this.fruitData);
}
