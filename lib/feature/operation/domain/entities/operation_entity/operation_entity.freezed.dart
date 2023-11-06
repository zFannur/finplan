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
  TypeOperation get type => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get sum => throw _privateConstructorUsedError;
  String get underCategory => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;

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
      TypeOperation type,
      String category,
      int sum,
      String underCategory,
      String note});
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
    Object? category = null,
    Object? sum = null,
    Object? underCategory = null,
    Object? note = null,
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
              as TypeOperation,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
      underCategory: null == underCategory
          ? _value.underCategory
          : underCategory // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
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
      TypeOperation type,
      String category,
      int sum,
      String underCategory,
      String note});
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
    Object? category = null,
    Object? sum = null,
    Object? underCategory = null,
    Object? note = null,
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
              as TypeOperation,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
      underCategory: null == underCategory
          ? _value.underCategory
          : underCategory // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
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
      required this.category,
      required this.sum,
      required this.underCategory,
      required this.note});

  factory _$OperationEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String date;
  @override
  final TypeOperation type;
  @override
  final String category;
  @override
  final int sum;
  @override
  final String underCategory;
  @override
  final String note;

  @override
  String toString() {
    return 'OperationEntity(id: $id, date: $date, type: $type, category: $category, sum: $sum, underCategory: $underCategory, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.sum, sum) || other.sum == sum) &&
            (identical(other.underCategory, underCategory) ||
                other.underCategory == underCategory) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, date, type, category, sum, underCategory, note);

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
      required final TypeOperation type,
      required final String category,
      required final int sum,
      required final String underCategory,
      required final String note}) = _$OperationEntityImpl;

  factory _OperationEntity.fromJson(Map<String, dynamic> json) =
      _$OperationEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get date;
  @override
  TypeOperation get type;
  @override
  String get category;
  @override
  int get sum;
  @override
  String get underCategory;
  @override
  String get note;
  @override
  @JsonKey(ignore: true)
  _$$OperationEntityImplCopyWith<_$OperationEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
