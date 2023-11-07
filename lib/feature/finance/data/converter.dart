import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';
import 'dto/plan_hive.dart';

class ConvertPlan {
  static PlanHive toPlanHive(PlanEntity plan) {
    final planModel = PlanHive(
      id: plan.id,
      type: plan.type.toHive(),
      category: plan.category,
      sum: plan.sum,
      forecast: plan.forecast,
      date: plan.date,
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
        type: planModelHive[i].type.toType(),
        category: planModelHive[i].category,
        sum: planModelHive[i].sum,
        date: planModelHive[i].date,
      );
      result.add(plan);
    }

    return result;
  }
}

extension on String {
  PlanType toType() {
    switch (this) {
      case 'expense':
        return PlanType.expense;
      case 'income':
        return PlanType.income;
      case 'target':
        return PlanType.target;
      case 'since':
        return PlanType.since;
      case 'habit':
        return PlanType.habit;
      default:
        throw Exception(['Ошибка преобразования данных']);
    }
  }
}

extension on PlanType {
  String toHive() {
    switch (this) {
      case PlanType.expense:
        return 'expense';
      case PlanType.income:
        return 'income';
      case PlanType.target:
        return 'target';
      case PlanType.since:
        return 'since';
      case PlanType.habit:
        return 'habit';
      default:
        throw Exception(['Ошибка преобразования данных']);
    }
  }
}
