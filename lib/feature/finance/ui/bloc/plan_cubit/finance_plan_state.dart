part of 'finance_plan_cubit.dart';

@freezed
class FinancePlanState with _$FinancePlanState {
  const factory FinancePlanState({
    @JsonKey(includeToJson: false, includeFromJson: false)
    AsyncSnapshot? asyncSnapshot,
    @Default([])
    List<PlanEntity>? planList,
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
    @Default({1,2,3,4,5,6,7,8,9,10,11,12})
    Set<int> monthSet,
    @Default(1)
    int? selectMonth,
  }) = _FinancePlanState;

  factory FinancePlanState.fromJson(Map<String, dynamic> json) =>
      _$FinancePlanStateFromJson(json);
}
