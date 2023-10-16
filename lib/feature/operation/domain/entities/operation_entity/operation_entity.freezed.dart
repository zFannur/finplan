// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OperationEntity _$OperationEntityFromJson(Map<String, dynamic> json) {
  return _OperationEntity.fromJson(json);
}

/// @nodoc
mixin _$OperationEntity {
  int get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get form => throw _privateConstructorUsedError;
  int get sum => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  AsyncSnapshot<dynamic>? get userState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OperationEntityCopyWith<OperationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationEntityCopyWith<$Res> {
  factory $OperationEntityCopyWith(
          OperationEntity value, $Res Function(OperationEntity) then) =
      _$OperationEntityCopyWithImpl<$Res, OperationEntity>;
  @useResult
  $Res call(
      {int id,
      String date,
      String type,
      String form,
      int sum,
      String note,
      @JsonKey(includeToJson: false, includeFromJson: false)
      AsyncSnapshot<dynamic>? userState});
}

/// @nodoc
class _$OperationEntityCopyWithImpl<$Res, $Val extends OperationEntity>
    implements $OperationEntityCopyWith<$Res> {
  _$OperationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? type = null,
    Object? form = null,
    Object? sum = null,
    Object? note = null,
    Object? userState = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as String,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      userState: freezed == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as AsyncSnapshot<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OperationEntityImplCopyWith<$Res>
    implements $OperationEntityCopyWith<$Res> {
  factory _$$OperationEntityImplCopyWith(_$OperationEntityImpl value,
          $Res Function(_$OperationEntityImpl) then) =
      __$$OperationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String date,
      String type,
      String form,
      int sum,
      String note,
      @JsonKey(includeToJson: false, includeFromJson: false)
      AsyncSnapshot<dynamic>? userState});
}

/// @nodoc
class __$$OperationEntityImplCopyWithImpl<$Res>
    extends _$OperationEntityCopyWithImpl<$Res, _$OperationEntityImpl>
    implements _$$OperationEntityImplCopyWith<$Res> {
  __$$OperationEntityImplCopyWithImpl(
      _$OperationEntityImpl _value, $Res Function(_$OperationEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? type = null,
    Object? form = null,
    Object? sum = null,
    Object? note = null,
    Object? userState = freezed,
  }) {
    return _then(_$OperationEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as String,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      userState: freezed == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as AsyncSnapshot<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperationEntityImpl implements _OperationEntity {
  const _$OperationEntityImpl(
      {required this.id,
      required this.date,
      required this.type,
      required this.form,
      required this.sum,
      required this.note,
      @JsonKey(includeToJson: false, includeFromJson: false) this.userState});

  factory _$OperationEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String date;
  @override
  final String type;
  @override
  final String form;
  @override
  final int sum;
  @override
  final String note;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final AsyncSnapshot<dynamic>? userState;

  @override
  String toString() {
    return 'OperationEntity(id: $id, date: $date, type: $type, form: $form, sum: $sum, note: $note, userState: $userState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.sum, sum) || other.sum == sum) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.userState, userState) ||
                other.userState == userState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, type, form, sum, note, userState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationEntityImplCopyWith<_$OperationEntityImpl> get copyWith =>
      __$$OperationEntityImplCopyWithImpl<_$OperationEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperationEntityImplToJson(
      this,
    );
  }
}

abstract class _OperationEntity implements OperationEntity {
  const factory _OperationEntity(
      {required final int id,
      required final String date,
      required final String type,
      required final String form,
      required final int sum,
      required final String note,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final AsyncSnapshot<dynamic>? userState}) = _$OperationEntityImpl;

  factory _OperationEntity.fromJson(Map<String, dynamic> json) =
      _$OperationEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get date;
  @override
  String get type;
  @override
  String get form;
  @override
  int get sum;
  @override
  String get note;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  AsyncSnapshot<dynamic>? get userState;
  @override
  @JsonKey(ignore: true)
  _$$OperationEntityImplCopyWith<_$OperationEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
