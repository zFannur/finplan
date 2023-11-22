part of 'finance_plan_cubit.dart';

@freezed
class FinancePlanState with _$FinancePlanState {
  const factory FinancePlanState({
    @JsonKey(includeToJson: false, includeFromJson: false)
    AsyncSnapshot? asyncSnapshot,
    @Default([])
    List<PlanEntity>? planList,
    @Default([])
    List<PlanEntity>? statList,
    @Default([])
    List<PlanEntity>? listExpense,
    @Default([])
    List<PlanEntity>? listIncome,
    @Default([])
    List<PlanEntity>? listTargets,
    @Default([])
    List<PlanEntity>? listSince,
    @Default([])
    List<PlanEntity>? listHabit,
    @Default(1)
    int? selectMonth,
    @Default(2023)
    int? selectYear,
  }) = _FinancePlanState;

  factory FinancePlanState.fromJson(Map<String, dynamic> json) =>
      _$FinancePlanStateFromJson(json);
}
