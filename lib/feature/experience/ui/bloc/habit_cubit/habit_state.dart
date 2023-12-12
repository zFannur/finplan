part of 'habit_cubit.dart';

@freezed
class HabitState with _$HabitState {
  const factory HabitState({
    @JsonKey(includeToJson: false, includeFromJson: false)
    AsyncSnapshot? asyncSnapshot,
    List<HabitEntity>? habitList,
  }) = _HabitState;

  factory HabitState.fromJson(Map<String, dynamic> json) =>
      _$HabitStateFromJson(json);
}
