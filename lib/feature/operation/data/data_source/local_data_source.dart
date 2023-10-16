import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../dto/operation_hive.dart';

abstract class LocalDataSource {
  Future<void> init();

  List<OperationHive> getOperation();

  Future<void> deleteOperation(OperationHive operation);

  Future<void> addOperation(OperationHive operation);

  Future<void> editOperation(OperationHive operation);

  int getNewId();
}

@Injectable(as: LocalDataSource)
@prod
@dev
class LocalDataSourceImpl implements LocalDataSource {
  final operationKey = 'operationKey';

  Box<OperationHive> get operationBox {
    return Hive.box<OperationHive>(operationKey);
  }

  @override
  Future<void> init() async {
    final applicationDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive
      ..init(applicationDocumentDir.path)
      ..registerAdapter(OperationHiveAdapter());

    await Hive.openBox<OperationHive>(operationKey);
  }

  @override
  Future<void> addOperation(OperationHive operation) async {
    await operationBox.add(operation);
  }

  @override
  Future<void> deleteOperation(OperationHive operation) async {
    await operationBox.deleteAt(await getIndex(operation));
  }

  @override
  Future<void> editOperation(OperationHive operation) async {
    await operationBox.putAt(await getIndex(operation), operation);
  }

  @override
  int getNewId() {
    int oldValue = 0;
    final result = operationBox.values.toList();

    for (int i = 0; i < result.length; i++) {
      if (oldValue < result[i].id) {
        oldValue = result[i].id;
      }
    }
    return oldValue += 1;
  }

  @override
  List<OperationHive> getOperation() {
    return operationBox.values.toList();
  }

  Future<int> getIndex(OperationHive operationHive) async {
    int index = 0;
    final result = operationBox.values.toList();

    for (; index < result.length; index++) {
      if (operationHive.id == result[index].id) {
        return index;
      }
    }

    return index + 1;
  }
}
