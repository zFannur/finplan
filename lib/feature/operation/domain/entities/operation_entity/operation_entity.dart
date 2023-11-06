import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_entity.freezed.dart';
part 'operation_entity.g.dart';

@freezed
class OperationEntity with _$OperationEntity {
  const factory OperationEntity({
    required int id,
    required String date,
    required TypeOperation type,
    required String category,
    required int sum,
    required String underCategory,
    required String note,
  }) = _OperationEntity;

  factory OperationEntity.fromJson(Map<String, dynamic> json) =>
      _$OperationEntityFromJson(json);
}

enum TypeOperation {expense, income}
