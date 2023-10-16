// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntiryImpl _$$UserEntiryImplFromJson(Map<String, dynamic> json) =>
    _$UserEntiryImpl(
      email: json['email'] as String,
      username: json['username'] as String,
      id: json['id'] as String,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$UserEntiryImplToJson(_$UserEntiryImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'id': instance.id,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
