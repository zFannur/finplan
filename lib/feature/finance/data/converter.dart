import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';
import 'dto/plan_hive.dart';

class ConvertPlan {
  static PlanHive toPlanHive(PlanEntity plan) {
    final planModel = PlanHive(
      id: plan.id,
      name: plan.name,
      category: plan.category,
      sum: plan.sum,
      forecast: plan.forecast,
    );
    return planModel;
  }

  static List<PlanEntity> toPlan(
    List<PlanHive> planModelHive,
  ) {
    List<PlanEntity> result = [];

    for (int i = 0; i < planModelHive.length; i++) {
      final plan = PlanEntity(
        id: planModelHive[i].id,
        name: planModelHive[i].name,
        category: planModelHive[i].category,
        sum: planModelHive[i].sum,
      );
      result.add(plan);
    }

    return result;
  }
}