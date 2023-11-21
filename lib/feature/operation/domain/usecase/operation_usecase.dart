import 'package:injectable/injectable.dart';

import '../entities/operation_entity/operation_entity.dart';
import '../operation_repository.dart';

abstract class OperationUseCase {
  Future<List<OperationEntity>> getOperation();
  Future<List<OperationEntity>> deleteOperation(OperationEntity operationEntity);
  Future<List<OperationEntity>> addOperation(OperationEntity operationEntity);
  Future<List<OperationEntity>> editOperation(OperationEntity operationEntity);
  Future<void> addDataFromFile(List<OperationEntity> operations);
}

@Injectable(as: OperationUseCase)
@prod
@dev
class OperationUseCaseImpl implements OperationUseCase{
  final OperationRepository operationRepository;
  OperationUseCaseImpl(this.operationRepository);

  @override
  Future<List<OperationEntity>> addOperation(OperationEntity operationEntity) async {
    await operationRepository.addOperation(operationEntity);
    return operationRepository.getOperation();
  }

  @override
  Future<List<OperationEntity>> deleteOperation(OperationEntity operationEntity) async {
    await operationRepository.deleteOperation(operationEntity);
    return operationRepository.getOperation();
  }

  @override
  Future<List<OperationEntity>> editOperation(OperationEntity operationEntity) async {
    await operationRepository.editOperation(operationEntity);
    return operationRepository.getOperation();
  }

  @override
  Future<List<OperationEntity>> getOperation() {
    return operationRepository.getOperation();
  }

  @override
  Future<void> addDataFromFile(List<OperationEntity> operations) {
    return operationRepository.addDataFromFile(operations);
  }

}