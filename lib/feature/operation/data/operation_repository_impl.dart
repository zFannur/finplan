import 'package:injectable/injectable.dart';

import '../domain/entities/operation_entity/operation_entity.dart';
import '../domain/operation_repository.dart';
import 'converter.dart';
import 'data_source/local_data_source.dart';

@Injectable(as: OperationRepository)
@prod
@dev
class OperationRepositoryImpl implements OperationRepository {
  final LocalDataSource _localDataSource;

  OperationRepositoryImpl(this._localDataSource);

  @override
  Future<void> addOperation(OperationEntity operation) async {
    _localDataSource.addOperation(ConvertOperation.toOperationHive(operation));
  }

  @override
  Future<void> deleteOperation(OperationEntity operation) async {
    await _localDataSource.deleteOperation(ConvertOperation.toOperationHive(operation));
  }

  @override
  Future<void> editOperation(OperationEntity operation) async{
    await _localDataSource.editOperation(ConvertOperation.toOperationHive(operation));
  }

  @override
  List<OperationEntity> getOperation() {
    final operations = _localDataSource.getOperation();
    return ConvertOperation.toOperation(operations);
  }
}