import 'package:injectable/injectable.dart';

import '../domain/entities/operation_entity/operation_entity.dart';
import '../domain/operation_repository.dart';
import 'data_source/opeartion_local_data_source.dart';

@Injectable(as: OperationRepository)
@prod
@dev
class OperationRepositoryImpl implements OperationRepository {
  final OperationLocalDataSource _localDataSource;

  OperationRepositoryImpl(this._localDataSource);

  @override
  Future<void> addOperation(OperationEntity operation) async {
    _localDataSource.addOperation(operation);
  }

  @override
  Future<void> deleteOperation(OperationEntity operation) async {
    await _localDataSource.deleteOperation(operation);
  }

  @override
  Future<void> editOperation(OperationEntity operation) async{
    await _localDataSource.editOperation(operation);
  }

  @override
  Future<List<OperationEntity>> getOperation() {
    return _localDataSource.getOperation();
  }
}