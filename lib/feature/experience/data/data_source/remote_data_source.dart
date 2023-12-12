import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';

abstract class RemoteDataSource {
  Future<void> init();

  List<OperationEntity> getOperation();

  Future<void> deleteOperation(OperationEntity operation);

  Future<void> addOperation(OperationEntity operation);

  Future<void> editOperation(OperationEntity operation);

  int getNewId();
}