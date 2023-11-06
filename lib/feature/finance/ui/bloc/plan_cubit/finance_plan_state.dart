part of 'finance_plan_cubit.dart';

@freezed
class FinancePlanState with _$FinancePlanState {
  const factory FinancePlanState.init() = _FinancePlanStateInital;

  const factory FinancePlanState.loaded(
      List<PlanEntity> planList,
      ) = _FinancePlanStateLoaded;

  const factory FinancePlanState.loading() = _FinancePlanStateLoading;

  const factory FinancePlanState.error(dynamic error) = _FinancePlanStateError;

  factory FinancePlanState.fromJson(Map<String, dynamic> json) =>
      _$FinancePlanStateFromJson(json);
}
