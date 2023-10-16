import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'dto/operation_hive.dart';

class ConvertOperation {
  static OperationHive toOperationHive(OperationEntity operation) {
    final operationModel = OperationHive(
      id: operation.id,
      date: operation.date,
      type: operation.type,
      form: operation.form,
      sum: operation.sum,
      note: operation.note,
    );
    return operationModel;
  }

  static List<OperationEntity> toOperation(
      List<OperationHive> operationModelHive) {
    List<OperationEntity> result = [];

    for (int i = 0; i < operationModelHive.length; i++) {
      final operation = OperationEntity(
        id: operationModelHive[i].id,
        date: operationModelHive[i].date,
        type: operationModelHive[i].type,
        form: operationModelHive[i].form,
        sum: operationModelHive[i].sum,
        note: operationModelHive[i].note,
      );
      result.add(operation);
    }

    return result;
  }
}