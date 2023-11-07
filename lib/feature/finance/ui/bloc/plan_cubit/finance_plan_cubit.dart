import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';
import 'package:finplan/feature/finance/domain/usecase/plan_usecase.dart';
import 'package:finplan/feature/operation/domain/usecase/operation_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

part 'finance_plan_state.dart';

part 'finance_plan_cubit.freezed.dart';

part 'finance_plan_cubit.g.dart';

class FinancePlanCubit extends HydratedCubit<FinancePlanState> {
  final PlanUseCase planUseCase;
  final OperationUseCase operationUseCase;

  FinancePlanCubit(
    this.planUseCase,
    this.operationUseCase,
  ) : super(const FinancePlanState(asyncSnapshot: AsyncSnapshot.nothing()));

  void setMonth(int index) {
    emit(state.copyWith(
      asyncSnapshot: const AsyncSnapshot.waiting(),
      selectMonth: index,
    ));
    getPlan();
  }

  Future<void> calcParams(List<PlanEntity> planList) async {
    emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));
    try {
      //final operationList = await operationUseCase.getOperation();

      DateFormat dateFormat = DateFormat("yyyy-MM-dd");

      final monthSet = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
      final List<PlanEntity> planListFiltered = planList
          .where((element) =>
              dateFormat.parse(element.date).month == state.selectMonth)
          .toList();

      List<PlanEntity> listExpense = [];
      List<PlanEntity> listIncome = [];
      List<PlanEntity> listTarget = [];
      List<PlanEntity> listSince = [];
      List<PlanEntity> listHabit = [];

      planListFiltered.forEach((element) {
        switch (element.type) {
          case PlanType.expense:
            listExpense.add(element);
          case PlanType.income:
            listIncome.add(element);
          case PlanType.target:
            listTarget.add(element);
          case PlanType.since:
            listSince.add(element);
          case PlanType.habit:
            listHabit.add(element);
        }
      });

      emit(state.copyWith(
          monthSet: monthSet,
          planList: planListFiltered,
          listExpense: listExpense,
          listIncome: listIncome,
          listTargets: listTarget,
          listSince: listSince,
          listHabit: listHabit,
          asyncSnapshot: const AsyncSnapshot.withData(
            ConnectionState.done,
            "Успешно",
          )));
    } catch (error) {
      addError(error);
    }
  }

  void getPlan() async {
    emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));
    try {
      final planList = await planUseCase.getPlan();
      await calcParams(planList);
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> addPlan(PlanEntity planEntity) async {
    try {
      final planList = await planUseCase.addPlan(planEntity);
      calcParams(planList);
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> editPlan(PlanEntity planEntity) async {
    try {
      final planList = await planUseCase.editPlan(planEntity);
      calcParams(planList);
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> deletePlan(PlanEntity planEntity) async {
    try {
      final planList = await planUseCase.deletePlan(planEntity);
      calcParams(planList);
    } catch (error, st) {
      addError(error, st);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(state.copyWith(
        asyncSnapshot: AsyncSnapshot.withError(
      ConnectionState.done,
      error,
    )));
    super.addError(error, stackTrace);
  }

  @override
  FinancePlanState? fromJson(Map<String, dynamic> json) {
    return FinancePlanState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(FinancePlanState state) {
    return state.toJson();
  }
}
