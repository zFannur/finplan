import 'dart:async';

import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'package:finplan/feature/operation/ui/bloc/operation_cubit/operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

part 'operation_filter_state.dart';

part 'operation_filter_cubit.freezed.dart';

part 'operation_filter_cubit.g.dart';

class OperationFilterCubit extends HydratedCubit<OperationFilterState> {
  final OperationCubit operationCubit;
  late final StreamSubscription operationSubscription;
  late List<OperationEntity> operationList;

  OperationFilterCubit(this.operationCubit)
      : super(
          const OperationFilterState(asyncSnapshot: AsyncSnapshot.nothing()),
        ) {
    operationCubit.getOperation();
    operationSubscription = operationCubit.stream.listen((event) {
      event.mapOrNull(
        loaded: (value) => operationCubit.state.whenOrNull(
          loaded: (list) {
            operationList = list;
            filterOperationByDay();
          },
        ),
      );
    });
  }

  void filterOperationByDay() async {
    try {
      emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));

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

      for (int s = 0; s < setDate.length; s++) {
        listDay = [];
        mapByDay[setDate.elementAt(s)] = [];
        for (int i = 0; i < operationList.length; i++) {
          if (dateFormat.parse(operationList[i].date) == setDate.elementAt(s)) {
            listDay.add(operationList[i]);
          }
        }
        mapByDay[setDate.elementAt(s)] = listDay;
      }

      emit(state.copyWith(
          mapByDay: mapByDay,
          asyncSnapshot: const AsyncSnapshot.withData(
            ConnectionState.done,
            "Успешно",
          )));
    } catch (error) {
      addError(error);
    }
  }

  void filterOperationByMonth(int month, int year) async {
    try {
      emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));

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

      for (int s = 0; s < setDate.length; s++) {
        listDay = [];
        mapByDay[setDate.elementAt(s)] = [];
        for (int i = 0; i < operationList.length; i++) {
          if (dateFormat.parse(operationList[i].date) == setDate.elementAt(s)) {
            listDay.add(operationList[i]);
          }
        }
        mapByDay[setDate.elementAt(s)] = listDay;
      }

      emit(state.copyWith(
          mapByMonth: mapByDay,
          asyncSnapshot: const AsyncSnapshot.withData(
            ConnectionState.done,
            "Успешно",
          )));
    } catch (error) {
      addError(error);
    }
  }

  void filterOperationSearch(String query) {
    try {
      emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));

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

      for (int s = 0; s < setDate.length; s++) {
        listDay = [];
        mapByDay[setDate.elementAt(s)] = [];
        for (int i = 0; i < searchList.length; i++) {
          if (dateFormat.parse(searchList[i].date) == setDate.elementAt(s)) {
            listDay.add(searchList[i]);
          }
        }
        mapByDay[setDate.elementAt(s)] = listDay;
      }

      emit(state.copyWith(
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
  Future<void> close() {
    operationSubscription.cancel();
    return super.close();
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
