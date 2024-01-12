import 'package:fpdart/fpdart.dart';
import 'package:technical_test_example/features/data/models/fruit_data.dart';
import 'package:technical_test_example/features/domain/repositories/fruit_repository.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../core/errors/failures.dart';

class LoadDataFromPersistentStorage implements UseCase<FruitData, NoParams> {
  final FruitRepository repository;

  LoadDataFromPersistentStorage(this.repository);

  @override
  Future<Either<Failure, FruitData>> call(NoParams params) async {
    return await repository.loadPersistentData();
  }
}
