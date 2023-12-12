import 'package:finplan/app/data/data_source/app_local_data_source.dart';
import 'package:finplan/feature/experience/data/converter.dart';
import 'package:finplan/feature/experience/data/dto/habit_hive.dart';
import 'package:finplan/feature/experience/domain/entity/habit_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/const/app_local_data_keys.dart';

abstract class HabitLocalDataSource {
  Future<List<HabitEntity>> getHabit();

  Future<void> deleteHabit(HabitEntity habit);

  Future<void> addHabit(HabitEntity habit);

  Future<void> editHabit(HabitEntity habit);

  Future<void> clearHabit();

  int getNewId();
}

@Injectable(as: HabitLocalDataSource)
@prod
@dev
class HabitLocalDataSourceImpl implements HabitLocalDataSource {
  final _dataSource = AppLocalDataSource<HabitHive>(
    key: LocalDataConst.habitKey,
    typeId: LocalDataConst.habitTypeId,
    adapter: HabitHiveAdapter(),
  );

  //HabitLocalDataSourceImpl();

  @override
  Future<void> addHabit(HabitEntity habit) async {
    return _dataSource.add(ConvertHabit.toHabitHive(habit));
  }

  @override
  Future<void> deleteHabit(HabitEntity habit) async {
    return _dataSource.delete(
      await getIndex(ConvertHabit.toHabitHive(habit)),
    );
  }

  @override
  Future<void> editHabit(HabitEntity habit) async {
    final HabitHive habitHive =
    ConvertHabit.toHabitHive(habit);
    return _dataSource.edit(await getIndex(habitHive), habitHive);
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
  Future<List<HabitEntity>> getHabit() async {
    final box = await _dataSource.openBox();
    return ConvertHabit.toHabit(box.values.toList().reversed.toList());
  }

  Future<int> getIndex(HabitHive habitHive) async {
    int index = 0;
    final box = await _dataSource.openBox();
    final result = box.values.toList();

    for (; index < result.length; index++) {
      if (habitHive.id == result[index].id) {
        return index;
      }
    }

    return index + 1;
  }

  @override
  Future<void> clearHabit() async {
    final box = await _dataSource.openBox();
    return _dataSource.clear(box);
  }

  // @override
  // Future<void> addListOperations(List<OperationEntity> operations) async {
  //   await _dataSource.openBox();
  //   return _dataSource.addList(ConvertOperation.toOperationHiveList(operations));
  // }
}
