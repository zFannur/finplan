import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';

abstract class PlanRemoteDataSource {
  Future<void> init();

  List<PlanEntity> getPlan();

  Future<void> deletePlan(PlanEntity plan);

  Future<void> addPlan(PlanEntity plan);

  Future<void> editPlan(PlanEntity plan);

  int getNewId();
}