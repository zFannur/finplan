import 'package:finplan/app/data/data_source/app_local_data_source.dart';
import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/const/app_local_data_keys.dart';
import '../converter.dart';
import '../dto/plan_hive.dart';

abstract class PlanLocalDataSource {
  Future<List<PlanEntity>> getPlan();

  Future<void> deletePlan(PlanEntity plan);

  Future<void> addPlan(PlanEntity plan);

  Future<void> editPlan(PlanEntity plan);

  int getNewId();
}

@Injectable(as: PlanLocalDataSource)
@prod
@dev
class PlanLocalDataSourceImpl implements PlanLocalDataSource {
  final _dataSource = AppLocalDataSource<PlanHive>(
    key: LocalDataConst.planKey,
    typeId: LocalDataConst.planTypeId,
    adapter: PlanHiveAdapter(),
  );

  PlanLocalDataSourceImpl();

  @override
  Future<void> addPlan(PlanEntity plan) async {
    return _dataSource.add(ConvertPlan.toPlanHive(plan));
  }

  @override
  Future<void> deletePlan(PlanEntity plan) async {
    return _dataSource.delete(
      await getIndex(ConvertPlan.toPlanHive(plan)),
    );
  }

  @override
  Future<void> editPlan(PlanEntity plan) async {
    final PlanHive planHive =
        ConvertPlan.toPlanHive(plan);
    return _dataSource.edit(await getIndex(planHive), planHive);
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
  Future<List<PlanEntity>> getPlan() async {
    final box = await _dataSource.openBox();
    return ConvertPlan.toPlan(box.values.toList());
  }

  Future<int> getIndex(PlanHive plan) async {
    int index = 0;
    final box = await _dataSource.openBox();
    final result = box.values.toList();

    for (; index < result.length; index++) {
      if (plan.id == result[index].id) {
        return index;
      }
    }

    return index + 1;
  }
}
