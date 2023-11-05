// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OperationEntityImpl _$$OperationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$OperationEntityImpl(
      id: json['id'] as int,
      date: json['date'] as String,
      type: $enumDecode(_$TypeOperationEnumMap, json['type']),
      category: json['category'] as String,
      sum: json['sum'] as int,
      underCategory: json['underCategory'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$$OperationEntityImplToJson(
        _$OperationEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'type': _$TypeOperationEnumMap[instance.type]!,
      'category': instance.category,
      'sum': instance.sum,
      'underCategory': instance.underCategory,
      'note': instance.note,
    };

const _$TypeOperationEnumMap = {
  TypeOperation.expense: 'expense',
  TypeOperation.income: 'income',
};
