import 'dart:async';

import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

import '../../../domain/usecase/operation_usecase.dart';

part 'operation_filter_state.dart';

part 'operation_filter_cubit.freezed.dart';

part 'operation_filter_cubit.g.dart';

class OperationFilterCubit extends HydratedCubit<OperationFilterState> {
  final OperationUseCase operationUseCase;

  OperationFilterCubit(this.operationUseCase)
      : super(
          const OperationFilterState(asyncSnapshot: AsyncSnapshot.nothing()),
        );

  Future<void> getOperation() async {
    loadingFilterState();
    try {
      final operationList = await operationUseCase.getOperation();
      emit(state.copyWith(
          asyncSnapshot: const AsyncSnapshot.withData(
            ConnectionState.done,
            "Успешно",
          ),
          operationList: operationList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> addOperation(OperationEntity operationEntity) async {
    try {
      final operationList =
          await operationUseCase.addOperation(operationEntity);
      emit(state.copyWith(operationList: operationList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> editOperation(OperationEntity operationEntity) async {
    try {
      final operationList =
          await operationUseCase.editOperation(operationEntity);
      emit(state.copyWith(operationList: operationList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> deleteOperation(OperationEntity operationEntity) async {
    try {
      final operationList =
          await operationUseCase.deleteOperation(operationEntity);
      emit(state.copyWith(operationList: operationList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  void loadingFilterState() {
    emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));
  }

  Future<void> filterOperationByDay() async {
    try {
      emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));
      await getOperation();
      final operationList = state.operationList ?? [];

      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
      Set<DateTime> setDate = {};

      //get all date
      for (int i = 0; i < operationList.length; i++) {
        setDate.add(dateFormat.parse(operationList[i].date));
      }
      //sort by date
      final list = setDate.toList();
      list.sort((a, b) => b.compareTo(a));
      setDate = list.toSet();

      Map<DateTime, List<OperationEntity>> mapByDay =
          <DateTime, List<OperationEntity>>{};
      List<OperationEntity> listDay = [];
      int sumExpense = 0;
      int sumIncome = 0;

      for (int s = 0; s < setDate.length; s++) {
        listDay = [];
        mapByDay[setDate.elementAt(s)] = [];
        for (int i = 0; i < operationList.length; i++) {
          if (dateFormat.parse(operationList[i].date) == setDate.elementAt(s)) {
            listDay.add(operationList[i]);
            //расчет полной суммы
            if (operationList[i].type == TypeOperation.expense) {
              sumExpense += operationList[i].sum;
            } else {
              sumIncome += operationList[i].sum;
            }
          }
        }
        mapByDay[setDate.elementAt(s)] = listDay;
      }

      emit(state.copyWith(
          sumExpense: sumExpense,
          sumIncome: sumIncome,
          mapByDay: mapByDay,
          asyncSnapshot: const AsyncSnapshot.withData(
            ConnectionState.done,
            "Успешно",
          )));
    } catch (error) {
      addError(error);
    }
  }

  Future<void> filterOperationByMonth(int month, int year) async {
    try {
      emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));

      await getOperation();
      final operationList = state.operationList ?? [];

      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
      Set<DateTime> setDate = {};

      //get all date
      for (int i = 0; i < operationList.length; i++) {
        if (dateFormat.parse(operationList[i].date).month == month &&
            dateFormat.parse(operationList[i].date).year == year) {
          setDate.add(dateFormat.parse(operationList[i].date));
        }
      }
      //sort by date
      final list = setDate.toList();
      list.sort((a, b) => b.compareTo(a));
      setDate = list.toSet();

      Map<DateTime, List<OperationEntity>> mapByDay =
          <DateTime, List<OperationEntity>>{};
      List<OperationEntity> listDay = [];
      int sumExpense = 0;
      int sumIncome = 0;

      for (int s = 0; s < setDate.length; s++) {
        listDay = [];
        mapByDay[setDate.elementAt(s)] = [];
        for (int i = 0; i < operationList.length; i++) {
          if (dateFormat.parse(operationList[i].date) == setDate.elementAt(s)) {
            listDay.add(operationList[i]);

            //расчет полной суммы
            if (operationList[i].type == TypeOperation.expense) {
              sumExpense += operationList[i].sum;
            } else {
              sumIncome += operationList[i].sum;
            }
          }
        }
        mapByDay[setDate.elementAt(s)] = listDay;
      }

      emit(state.copyWith(
          sumExpense: sumExpense,
          sumIncome: sumIncome,
          mapByMonth: mapByDay,
          asyncSnapshot: const AsyncSnapshot.withData(
            ConnectionState.done,
            "Успешно",
          )));
    } catch (error) {
      addError(error);
    }
  }

  Future<void> filterOperationSearch(String query) async {
    try {
      emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));

      await getOperation();
      final operationList = state.operationList ?? [];

      List<OperationEntity> searchList = [];

      if (query.isEmpty) {
        searchList = operationList;
      } else {
        for (int i = 0; i < operationList.length; i++) {
          if (operationList[i]
                  .sum
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              operationList[i]
                  .category
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              operationList[i]
                  .note
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              operationList[i]
                  .underCategory
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase())) {
            searchList.add(operationList[i]);
          }
        }
      }

      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
      Set<DateTime> setDate = {};

      //get all date
      for (int i = 0; i < searchList.length; i++) {
        setDate.add(dateFormat.parse(searchList[i].date));
      }

      //sort by date
      final list = setDate.toList();
      list.sort((a, b) => b.compareTo(a));
      setDate = list.toSet();

      Map<DateTime, List<OperationEntity>> mapByDay =
          <DateTime, List<OperationEntity>>{};
      List<OperationEntity> listDay = [];
      int sumExpense = 0;
      int sumIncome = 0;

      for (int s = 0; s < setDate.length; s++) {
        listDay = [];
        mapByDay[setDate.elementAt(s)] = [];
        for (int i = 0; i < searchList.length; i++) {
          if (dateFormat.parse(searchList[i].date) == setDate.elementAt(s)) {
            listDay.add(searchList[i]);

            //расчет полной суммы
            if (operationList[i].type == TypeOperation.expense) {
              sumExpense += searchList[i].sum;
            } else {
              sumIncome += searchList[i].sum;
            }
          }
        }
        mapByDay[setDate.elementAt(s)] = listDay;
      }

      emit(state.copyWith(
          sumExpense: sumExpense,
          sumIncome: sumIncome,
          mapByDay: mapByDay,
          asyncSnapshot: const AsyncSnapshot.withData(
            ConnectionState.done,
            "Успешно",
          )));
    } catch (error) {
      addError(error);
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
  OperationFilterState? fromJson(Map<String, dynamic> json) {
    return OperationFilterState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(OperationFilterState state) {
    return state.toJson();
  }
}
