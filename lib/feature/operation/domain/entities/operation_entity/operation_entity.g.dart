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
      type: json['type'] as String,
      form: json['form'] as String,
      sum: json['sum'] as int,
      note: json['note'] as String,
    );

Map<String, dynamic> _$$OperationEntityImplToJson(
        _$OperationEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'type': instance.type,
      'form': instance.form,
      'sum': instance.sum,
      'note': instance.note,
    };
