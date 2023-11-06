import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';
import 'package:injectable/injectable.dart';

import '../plan_repository.dart';

abstract class PlanUseCase {
  Future<List<PlanEntity>> getPlan();
  Future<List<PlanEntity>> deletePlan(PlanEntity operationEntity);
  Future<List<PlanEntity>> addPlan(PlanEntity operationEntity);
  Future<List<PlanEntity>> editPlan(PlanEntity operationEntity);
}

@Injectable(as: PlanUseCase)
@prod
@dev
class PlanUseCaseImpl implements PlanUseCase{
  final PlanRepository planRepository;
  PlanUseCaseImpl(this.planRepository);

  @override
  Future<List<PlanEntity>> addPlan(PlanEntity planEntity) async {
    await planRepository.addPlan(planEntity);
    return getPlan();
  }

  @override
  Future<List<PlanEntity>> deletePlan(PlanEntity planEntity) async {
    await planRepository.deletePlan(planEntity);
    return getPlan();
  }

  @override
  Future<List<PlanEntity>> editPlan(PlanEntity planEntity) async {
    await planRepository.editPlan(planEntity);
    return getPlan();
  }

  @override
  Future<List<PlanEntity>> getPlan() async {
    return planRepository.getPlan();
  }
}