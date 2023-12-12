import 'package:finplan/feature/experience/domain/entity/habit_entity.dart';
import 'package:finplan/feature/experience/domain/habit_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'habit_state.dart';

part 'habit_cubit.g.dart';

part 'habit_cubit.freezed.dart';

class HabitCubit extends HydratedCubit<HabitState> {
  final HabitRepository habitRepository;

  HabitCubit(this.habitRepository)
      : super(const HabitState(asyncSnapshot: AsyncSnapshot.nothing()));

  void getHabit() async {
    emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));
    try {
      final habitList = await habitRepository.getHabits();
      emit(state.copyWith(
          habitList: habitList,
          asyncSnapshot: const AsyncSnapshot.withData(
            ConnectionState.done,
            "Успешно",
          )));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> addHabit(HabitEntity habit) async {
    try {
      await habitRepository.addHabit(habit);
      getHabit();
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> editHabit(HabitEntity habit) async {
    try {
      await habitRepository.editHabit(habit);
      getHabit();
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> deleteHabit(HabitEntity habit) async {
    try {
      await habitRepository.deleteHabit(habit);
      getHabit();
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> clearHabit() async {
    try {
      await habitRepository.clearHabit();
      emit(state.copyWith(
          asyncSnapshot: const AsyncSnapshot.withData(
        ConnectionState.done,
        "Успешно",
      )));
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
  HabitState? fromJson(Map<String, dynamic> json) {
    return HabitState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(HabitState state) {
    return state.toJson();
  }
}
