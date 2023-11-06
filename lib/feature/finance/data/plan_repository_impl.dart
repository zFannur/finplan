import 'package:finplan/feature/finance/data/data_source/plan_local_data_source.dart';
import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';
import 'package:finplan/feature/finance/domain/plan_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: PlanRepository)
@prod
@dev
class PlanRepositoryImpl implements PlanRepository {
  final PlanLocalDataSource _localDataSource;

  PlanRepositoryImpl(this._localDataSource);

  @override
  Future<void> addPlan(PlanEntity plan) async {
    _localDataSource.addPlan(plan);
  }

  @override
  Future<void> deletePlan(PlanEntity plan) async {
    await _localDataSource.deletePlan(plan);
  }

  @override
  Future<void> editPlan(PlanEntity plan) async{
    await _localDataSource.editPlan(plan);
  }

  @override
  Future<List<PlanEntity>> getPlan() {
    return _localDataSource.getPlan();
  }
}