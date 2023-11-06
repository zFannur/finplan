import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';

abstract class PlanRepository {
  Future<List<PlanEntity>> getPlan();
  Future<void> deletePlan(PlanEntity planEntity);
  Future<void> addPlan(PlanEntity planEntity);
  Future<void> editPlan(PlanEntity planEntity);
}