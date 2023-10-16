import 'package:hive/hive.dart';

part 'operation_hive.g.dart';

@HiveType(typeId: 0)
class OperationHive {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final String form;
  @HiveField(4)
  final int sum;
  @HiveField(5)
  final String note;

  OperationHive({
    required this.id,
    required this.date,
    required this.type,
    required this.form,
    required this.sum,
    required this.note,
  });
}
