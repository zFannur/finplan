import 'package:finplan/app/data/data_source/app_local_data_source.dart';
import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/const/app_local_data_keys.dart';
import '../converter.dart';
import '../dto/operation_hive.dart';

abstract class OperationLocalDataSource {
  Future<List<OperationEntity>> getOperation();

  Future<void> deleteOperation(OperationEntity operation);

  Future<void> addOperation(OperationEntity operation);

  Future<void> editOperation(OperationEntity operation);

  int getNewId();
}

@Injectable(as: OperationLocalDataSource)
@prod
@dev
class AOperationLocalDataSourceImpl implements OperationLocalDataSource {
  final _dataSource = AppLocalDataSource<OperationHive>(
    key: LocalDataConst.operationKey,
    typeId: LocalDataConst.operationTypeId,
    adapter: OperationHiveAdapter(),
  );

  AOperationLocalDataSourceImpl();

  @override
  Future<void> addOperation(OperationEntity operation) async {
    return _dataSource.add(ConvertOperation.toOperationHive(operation));
  }

  @override
  Future<void> deleteOperation(OperationEntity operation) async {
    return _dataSource.delete(
      await getIndex(ConvertOperation.toOperationHive(operation)),
    );
  }

  @override
  Future<void> editOperation(OperationEntity operation) async {
    final OperationHive operationHive =
        ConvertOperation.toOperationHive(operation);
    return _dataSource.edit(await getIndex(operationHive), operationHive);
  }

  @override
  int getNewId() {
    int oldValue = 0;
    final box = _dataSource.getBox();
    if (box != null) {
      final result = box.values.toList();

      for (int i = 0; i < result.length; i++) {
        if (oldValue < result[i].id) {
          oldValue = result[i].id;
        }
      }
      return oldValue += 1;
    } else {
      throw "Бокс закрыт, id не получен";
    }
  }

  @override
  Future<List<OperationEntity>> getOperation() async {
    final box = await _dataSource.openBox();
    return ConvertOperation.toOperation(box.values.toList().reversed.toList());
  }

  Future<int> getIndex(OperationHive operationHive) async {
    int index = 0;
    final box = await _dataSource.openBox();
    final result = box.values.toList();

    for (; index < result.length; index++) {
      if (operationHive.id == result[index].id) {
        return index;
      }
    }

    return index + 1;
  }
}
