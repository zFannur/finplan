import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';
import 'package:finplan/feature/finance/domain/usecase/plan_usecase.dart';
import 'package:finplan/feature/operation/domain/usecase/operation_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'finance_plan_state.dart';

part 'finance_plan_cubit.freezed.dart';

part 'finance_plan_cubit.g.dart';

@Singleton()
class FinancePlanCubit extends HydratedCubit<FinancePlanState> {
  final PlanUseCase planUseCase;
  final OperationUseCase operationUseCase;

  FinancePlanCubit(
    this.planUseCase,
    this.operationUseCase,
  ) : super(const FinancePlanState.init());

  void getPlan() async {
    emit(const FinancePlanState.loading());
    try {
      final planList = await planUseCase.getPlan();
      emit(FinancePlanState.loaded(planList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> addPlan(PlanEntity planEntity) async {
    try {
      final planList = await planUseCase.addPlan(planEntity);
      emit(FinancePlanState.loaded(planList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> editPlan(PlanEntity planEntity) async {
    try {
      final planList = await planUseCase.editPlan(planEntity);
      emit(FinancePlanState.loaded(planList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> deletePlan(PlanEntity planEntity) async {
    try {
      final planList = await planUseCase.deletePlan(planEntity);
      emit(FinancePlanState.loaded(planList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(FinancePlanState.error(error));
    super.addError(error, stackTrace);
  }

  @override
  FinancePlanState? fromJson(Map<String, dynamic> json) {
    final state = FinancePlanState.fromJson(json);
    return state.whenOrNull(
      loaded: (planList) => FinancePlanState.loaded(planList),
    );
  }

  @override
  Map<String, dynamic>? toJson(FinancePlanState state) {
    return state
            .whenOrNull(loaded: (planList) => FinancePlanState.loaded(planList))
            ?.toJson() ??
        const FinancePlanState.init().toJson();
  }
}
