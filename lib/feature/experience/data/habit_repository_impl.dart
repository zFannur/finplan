import 'package:finplan/feature/experience/data/data_source/habit_local_data_source.dart';
import 'package:finplan/feature/experience/domain/entity/habit_entity.dart';
import 'package:finplan/feature/experience/domain/habit_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HabitRepository)
@prod
@dev
class HabitRepositoryImpl implements HabitRepository{
  final HabitLocalDataSource _localDataSource;

  HabitRepositoryImpl(this._localDataSource);

  @override
  Future<void> addHabit(HabitEntity habit) {
    return _localDataSource.addHabit(habit);
  }

  @override
  Future<void> deleteHabit(HabitEntity habit) {
    return _localDataSource.deleteHabit(habit);
  }

  @override
  Future<void> editHabit(HabitEntity habit) {
    return _localDataSource.editHabit(habit);
  }

  @override
  Future<List<HabitEntity>> getHabits() {
    return _localDataSource.getHabit();
  }

  @override
  Future<void> clearHabit() {
    return _localDataSource.clearHabit();
  }
}