import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_entity.freezed.dart';
part 'plan_entity.g.dart';

@freezed
class PlanEntity with _$PlanEntity {
  const factory PlanEntity({
    required int id,
    required String name,
    required String category,
    required int sum,
    int? forecast,
  }) = _PlanEntity;

  factory PlanEntity.fromJson(Map<String, dynamic> json) =>
      _$PlanEntityFromJson(json);
}
