import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';
import 'package:finplan/feature/finance/domain/usecase/plan_usecase.dart';
import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'package:finplan/feature/operation/domain/usecase/operation_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../operation/ui/bloc/operation_filter_cubit/operation_filter_cubit.dart';

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
  ) : super(const FinancePlanState(asyncSnapshot: AsyncSnapshot.nothing()));

  void setMonth(int index) {
    emit(state.copyWith(
      asyncSnapshot: const AsyncSnapshot.waiting(),
      selectMonth: index,
    ));
    getPlan();
  }

  void setYear(int index) {
    emit(state.copyWith(
      asyncSnapshot: const AsyncSnapshot.waiting(),
      selectYear: index,
    ));
    getPlan();
  }

  Future<void> calcParams(List<PlanEntity> planList) async {
    emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));
    try {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd");

      //сортировка по месяцу и году
      final List<PlanEntity> planListFiltered = planList
          .where((element) =>
              dateFormat.parse(element.date).month == state.selectMonth &&
              dateFormat.parse(element.date).year == state.selectYear)
          .toList();

      //получение операции и сортировка по месяцу и году
      final operationList = (await operationUseCase.getOperation())
          .where((element) =>
              dateFormat.parse(element.date).month == state.selectMonth &&
              dateFormat.parse(element.date).year == state.selectYear)
          .toList();

      //получение всех категорий
      Set<String> categories = {};
      for (var element in operationList) {
        categories.add(element.category);
      }

      //сортировка статистики
      final List<PlanEntity> statListFiltered = [];
      for (var category in categories) {
        int sumExpense = 0;
        int sumIncome = 0;
        int planValueExpense = 0;
        int planValueIncome = 0;

        for (var operation in operationList) {
          if (category == operation.category &&
              operation.type == TypeOperation.expense) {
            sumExpense += operation.sum;
          }
          if (category == operation.category &&
              operation.type == TypeOperation.income) {
            sumIncome += operation.sum;
          }
          for (var plan in planListFiltered) {
            if (plan.category == category && plan.type == PlanType.expense) {
              planValueExpense = plan.sum;
            }
            if (plan.category == category && plan.type == PlanType.income) {
              planValueIncome = plan.sum;
            }
          }
        }

        if (sumExpense != 0) {
          statListFiltered.add(PlanEntity(
            id: 1,
            date: '',
            type: PlanType.expense,
            category: category,
            sum: planValueExpense,
            fact: sumExpense,
          ));
        }

        if (sumIncome != 0) {
          statListFiltered.add(PlanEntity(
            id: 1,
            date: '',
            type: PlanType.income,
            category: category,
            sum: planValueIncome,
            fact: sumIncome,
          ));
        }
      }

      //расчет факта
      final List<PlanEntity> planListFilteredCalc = [];
      for (var planElement in planListFiltered) {
        int sumFact = 0;
        for (var operation in operationList) {
          if (planElement.category == operation.category) {
            sumFact += operation.sum;
          }
        }
        planListFilteredCalc.add(planElement.copyWith(fact: sumFact));
      }

      List<PlanEntity> listExpense = [];
      List<PlanEntity> listIncome = [];
      List<PlanEntity> listTarget = [];
      List<PlanEntity> listSince = [];
      List<PlanEntity> listHabit = [];

      for (var element in planListFilteredCalc) {
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
      }

      emit(state.copyWith(
          statList: statListFiltered,
          planList: planListFilteredCalc,
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
