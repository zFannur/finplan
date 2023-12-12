import 'package:finplan/app/const/app_const.dart';
import 'package:finplan/app/const/app_local_data_keys.dart';
import 'package:hive/hive.dart';

part 'habit_hive.g.dart';

@HiveType(typeId: LocalDataConst.habitTypeId)
class HabitHive {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String triggers;
  @HiveField(3)
  final String awards;
  @HiveField(4)
  final String motivation;
  @HiveField(5)
  final int repeatsDay;
  @HiveField(6)
  final int duration;

  HabitHive({
    required this.id,
    required this.name,
    required this.triggers,
    required this.awards,
    required this.motivation,
    required this.repeatsDay,
    required this.duration,
  });
}
