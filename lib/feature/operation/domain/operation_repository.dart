import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';

abstract class OperationRepository {
  List<OperationEntity> getOperation();
  Future<void> deleteOperation(OperationEntity operationEntity);
  Future<void> addOperation(OperationEntity operationEntity);
  Future<void> editOperation(OperationEntity operationEntity);
}