import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_state.dart';
part 'habit_cubit.freezed.dart';

class HabitCubit extends Cubit<HabitState> {
  HabitCubit() : super(const HabitState.initial());
}
