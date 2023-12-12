import 'package:finplan/feature/experience/domain/entity/habit_entity.dart';

abstract class HabitRepository{
  Future<List<HabitEntity>> getHabits();
  Future<void> deleteHabit(HabitEntity habitEntity);
  Future<void> addHabit(HabitEntity habitEntity);
  Future<void> editHabit(HabitEntity habitEntity);
  Future<void> clearHabit();
}