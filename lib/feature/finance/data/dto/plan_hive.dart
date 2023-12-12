import 'package:hive/hive.dart';

import '../../../../app/const/app_local_data_keys.dart';

part 'plan_hive.g.dart';

@HiveType(typeId: LocalDataConst.planTypeId)
class PlanHive {
  @HiveField(0)
  final String type;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final int sum;
  @HiveField(3)
  final int? forecast;
  @HiveField(4)
  final int id;
  @HiveField(5)
  final String date;

  PlanHive({
    required this.id,
    required this.date,
    required this.type,
    required this.category,
    required this.sum,
    required this.forecast,
  });
}
