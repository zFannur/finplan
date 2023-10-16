// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OperationStateInitalImpl _$$OperationStateInitalImplFromJson(
        Map<String, dynamic> json) =>
    _$OperationStateInitalImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OperationStateInitalImplToJson(
        _$OperationStateInitalImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$OperationStateLoadedImpl _$$OperationStateLoadedImplFromJson(
        Map<String, dynamic> json) =>
    _$OperationStateLoadedImpl(
      (json['operationEntity'] as List<dynamic>)
          .map((e) => OperationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OperationStateLoadedImplToJson(
        _$OperationStateLoadedImpl instance) =>
    <String, dynamic>{
      'operationEntity': instance.operationEntity,
      'runtimeType': instance.$type,
    };

_$OperationStateLoadingImpl _$$OperationStateLoadingImplFromJson(
        Map<String, dynamic> json) =>
    _$OperationStateLoadingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OperationStateLoadingImplToJson(
        _$OperationStateLoadingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$OperationStateErrorImpl _$$OperationStateErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$OperationStateErrorImpl(
      json['error'],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OperationStateErrorImplToJson(
        _$OperationStateErrorImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };
