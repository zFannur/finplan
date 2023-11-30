import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_entity.freezed.dart';
part 'habit_entity.g.dart';

@freezed
class HabitEntity with _$HabitEntity {
  const factory HabitEntity({
    required int id,
    required String name,
    required String why,
    required int repeatsDay,
    required int duration,
    required String category,
  }) = _HabitEntity;

  factory HabitEntity.fromJson(Map<String, dynamic> json) =>
      _$HabitEntityFromJson(json);
}
