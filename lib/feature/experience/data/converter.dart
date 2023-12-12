import 'package:finplan/feature/experience/data/dto/habit_hive.dart';
import 'package:finplan/feature/experience/domain/entity/habit_entity.dart';

class ConvertHabit {
  static HabitHive toHabitHive(HabitEntity habit) {
    final habitHive = HabitHive(
      id: habit.id,
      name: habit.name,
      triggers: habit.triggers,
      awards: habit.awards,
      motivation: habit.motivation,
      repeatsDay: habit.repeatsDay,
      duration: habit.duration,
    );
    return habitHive;
  }

  // static List<OperationHive> toOperationHiveList(
  //     List<OperationEntity> operations) {
  //   List<OperationHive> result = [];
  //   for (int i = 0; i < operations.length; i++) {
  //     final operationHive = OperationHive(
  //       id: operations[i].id,
  //       date: operations[i].date,
  //       type: operations[i].type.toHive(),
  //       category: operations[i].category,
  //       sum: operations[i].sum,
  //       underCategory: operations[i].underCategory,
  //       note: operations[i].note,
  //     );
  //     result.add(operationHive);
  //   }
  //   return result;
  // }

  static List<HabitEntity> toHabit(List<HabitHive> habitHiveList) {
    List<HabitEntity> result = [];

    for (int i = 0; i < habitHiveList.length; i++) {
      final operation = HabitEntity(
        id: habitHiveList[i].id,
        name: habitHiveList[i].name,
        triggers: habitHiveList[i].triggers,
        awards: habitHiveList[i].awards,
        motivation: habitHiveList[i].motivation,
        repeatsDay: habitHiveList[i].repeatsDay,
        duration: habitHiveList[i].duration,
      );
      result.add(operation);
    }

    return result;
  }
}
