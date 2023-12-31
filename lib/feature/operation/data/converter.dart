import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'dto/operation_hive.dart';

class ConvertOperation {
  static OperationHive toOperationHive(OperationEntity operation) {
    final operationModel = OperationHive(
      id: operation.id,
      date: operation.date,
      type: operation.type.toHive(),
      category: operation.category,
      sum: operation.sum,
      underCategory: operation.underCategory,
      note: operation.note,
    );
    return operationModel;
  }

  static List<OperationHive> toOperationHiveList(List<OperationEntity> operations) {
    List<OperationHive> result = [];
    for (int i = 0; i < operations.length; i++) {
      final operationHive = OperationHive(
        id: operations[i].id,
        date: operations[i].date,
        type: operations[i].type.toHive(),
        category: operations[i].category,
        sum: operations[i].sum,
        underCategory: operations[i].underCategory,
        note: operations[i].note,
      );
      result.add(operationHive);
    }
    return result;
  }

  static List<OperationEntity> toOperation(
      List<OperationHive> operationModelHive) {
    List<OperationEntity> result = [];

    for (int i = 0; i < operationModelHive.length; i++) {
      final operation = OperationEntity(
        id: operationModelHive[i].id,
        date: operationModelHive[i].date,
        type: operationModelHive[i].type.toType(),
        category: operationModelHive[i].category,
        sum: operationModelHive[i].sum,
        underCategory: operationModelHive[i].underCategory,
        note: operationModelHive[i].note,
      );
      result.add(operation);
    }

    return result;
  }
}

extension on String {
  TypeOperation toType() {
    if (this == 'expense') {
      return TypeOperation.expense;
    } else {
      return TypeOperation.income;
    }
  }
}

extension on TypeOperation {
  String toHive() {
    if (this == TypeOperation.expense) {
      return 'expense';
    } else {
      return 'income';
    }
  }
}
