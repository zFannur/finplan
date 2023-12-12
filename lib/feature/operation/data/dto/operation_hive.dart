import 'package:hive/hive.dart';
import '../../../../app/const/app_local_data_keys.dart';

part 'operation_hive.g.dart';

@HiveType(typeId: LocalDataConst.operationTypeId)
class OperationHive {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final int sum;
  @HiveField(5)
  final String underCategory;
  @HiveField(6)
  final String note;

  OperationHive({
    required this.note,
    required this.id,
    required this.date,
    required this.type,
    required this.category,
    required this.sum,
    required this.underCategory,
  });
}
