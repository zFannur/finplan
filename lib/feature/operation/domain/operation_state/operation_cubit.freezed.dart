// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OperationState _$OperationStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'init':
      return _OperationStateInital.fromJson(json);
    case 'loaded':
      return _OperationStateLoaded.fromJson(json);
    case 'loading':
      return _OperationStateLoading.fromJson(json);
    case 'error':
      return _OperationStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'OperationState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$OperationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<OperationEntity> operationEntity) loaded,
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<OperationEntity> operationEntity)? loaded,
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<OperationEntity> operationEntity)? loaded,
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OperationStateInital value) init,
    required TResult Function(_OperationStateLoaded value) loaded,
    required TResult Function(_OperationStateLoading value) loading,
    required TResult Function(_OperationStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OperationStateInital value)? init,
    TResult? Function(_OperationStateLoaded value)? loaded,
    TResult? Function(_OperationStateLoading value)? loading,
    TResult? Function(_OperationStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OperationStateInital value)? init,
    TResult Function(_OperationStateLoaded value)? loaded,
    TResult Function(_OperationStateLoading value)? loading,
    TResult Function(_OperationStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationStateCopyWith<$Res> {
  factory $OperationStateCopyWith(
          OperationState value, $Res Function(OperationState) then) =
      _$OperationStateCopyWithImpl<$Res, OperationState>;
}

/// @nodoc
class _$OperationStateCopyWithImpl<$Res, $Val extends OperationState>
    implements $OperationStateCopyWith<$Res> {
  _$OperationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OperationStateInitalImplCopyWith<$Res> {
  factory _$$OperationStateInitalImplCopyWith(_$OperationStateInitalImpl value,
          $Res Function(_$OperationStateInitalImpl) then) =
      __$$OperationStateInitalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OperationStateInitalImplCopyWithImpl<$Res>
    extends _$OperationStateCopyWithImpl<$Res, _$OperationStateInitalImpl>
    implements _$$OperationStateInitalImplCopyWith<$Res> {
  __$$OperationStateInitalImplCopyWithImpl(_$OperationStateInitalImpl _value,
      $Res Function(_$OperationStateInitalImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$OperationStateInitalImpl implements _OperationStateInital {
  const _$OperationStateInitalImpl({final String? $type})
      : $type = $type ?? 'init';

  factory _$OperationStateInitalImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationStateInitalImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OperationState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStateInitalImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<OperationEntity> operationEntity) loaded,
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<OperationEntity> operationEntity)? loaded,
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<OperationEntity> operationEntity)? loaded,
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OperationStateInital value) init,
    required TResult Function(_OperationStateLoaded value) loaded,
    required TResult Function(_OperationStateLoading value) loading,
    required TResult Function(_OperationStateError value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OperationStateInital value)? init,
    TResult? Function(_OperationStateLoaded value)? loaded,
    TResult? Function(_OperationStateLoading value)? loading,
    TResult? Function(_OperationStateError value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OperationStateInital value)? init,
    TResult Function(_OperationStateLoaded value)? loaded,
    TResult Function(_OperationStateLoading value)? loading,
    TResult Function(_OperationStateError value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OperationStateInitalImplToJson(
      this,
    );
  }
}

abstract class _OperationStateInital implements OperationState {
  const factory _OperationStateInital() = _$OperationStateInitalImpl;

  factory _OperationStateInital.fromJson(Map<String, dynamic> json) =
      _$OperationStateInitalImpl.fromJson;
}

/// @nodoc
abstract class _$$OperationStateLoadedImplCopyWith<$Res> {
  factory _$$OperationStateLoadedImplCopyWith(_$OperationStateLoadedImpl value,
          $Res Function(_$OperationStateLoadedImpl) then) =
      __$$OperationStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OperationEntity> operationEntity});
}

/// @nodoc
class __$$OperationStateLoadedImplCopyWithImpl<$Res>
    extends _$OperationStateCopyWithImpl<$Res, _$OperationStateLoadedImpl>
    implements _$$OperationStateLoadedImplCopyWith<$Res> {
  __$$OperationStateLoadedImplCopyWithImpl(_$OperationStateLoadedImpl _value,
      $Res Function(_$OperationStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationEntity = null,
  }) {
    return _then(_$OperationStateLoadedImpl(
      null == operationEntity
          ? _value._operationEntity
          : operationEntity // ignore: cast_nullable_to_non_nullable
              as List<OperationEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperationStateLoadedImpl implements _OperationStateLoaded {
  const _$OperationStateLoadedImpl(final List<OperationEntity> operationEntity,
      {final String? $type})
      : _operationEntity = operationEntity,
        $type = $type ?? 'loaded';

  factory _$OperationStateLoadedImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationStateLoadedImplFromJson(json);

  final List<OperationEntity> _operationEntity;
  @override
  List<OperationEntity> get operationEntity {
    if (_operationEntity is EqualUnmodifiableListView) return _operationEntity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operationEntity);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OperationState.loaded(operationEntity: $operationEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStateLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._operationEntity, _operationEntity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_operationEntity));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationStateLoadedImplCopyWith<_$OperationStateLoadedImpl>
      get copyWith =>
          __$$OperationStateLoadedImplCopyWithImpl<_$OperationStateLoadedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<OperationEntity> operationEntity) loaded,
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loaded(operationEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<OperationEntity> operationEntity)? loaded,
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return loaded?.call(operationEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<OperationEntity> operationEntity)? loaded,
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(operationEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OperationStateInital value) init,
    required TResult Function(_OperationStateLoaded value) loaded,
    required TResult Function(_OperationStateLoading value) loading,
    required TResult Function(_OperationStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OperationStateInital value)? init,
    TResult? Function(_OperationStateLoaded value)? loaded,
    TResult? Function(_OperationStateLoading value)? loading,
    TResult? Function(_OperationStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OperationStateInital value)? init,
    TResult Function(_OperationStateLoaded value)? loaded,
    TResult Function(_OperationStateLoading value)? loading,
    TResult Function(_OperationStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OperationStateLoadedImplToJson(
      this,
    );
  }
}

abstract class _OperationStateLoaded implements OperationState {
  const factory _OperationStateLoaded(
      final List<OperationEntity> operationEntity) = _$OperationStateLoadedImpl;

  factory _OperationStateLoaded.fromJson(Map<String, dynamic> json) =
      _$OperationStateLoadedImpl.fromJson;

  List<OperationEntity> get operationEntity;
  @JsonKey(ignore: true)
  _$$OperationStateLoadedImplCopyWith<_$OperationStateLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OperationStateLoadingImplCopyWith<$Res> {
  factory _$$OperationStateLoadingImplCopyWith(
          _$OperationStateLoadingImpl value,
          $Res Function(_$OperationStateLoadingImpl) then) =
      __$$OperationStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OperationStateLoadingImplCopyWithImpl<$Res>
    extends _$OperationStateCopyWithImpl<$Res, _$OperationStateLoadingImpl>
    implements _$$OperationStateLoadingImplCopyWith<$Res> {
  __$$OperationStateLoadingImplCopyWithImpl(_$OperationStateLoadingImpl _value,
      $Res Function(_$OperationStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$OperationStateLoadingImpl implements _OperationStateLoading {
  const _$OperationStateLoadingImpl({final String? $type})
      : $type = $type ?? 'loading';

  factory _$OperationStateLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationStateLoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OperationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStateLoadingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<OperationEntity> operationEntity) loaded,
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<OperationEntity> operationEntity)? loaded,
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<OperationEntity> operationEntity)? loaded,
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OperationStateInital value) init,
    required TResult Function(_OperationStateLoaded value) loaded,
    required TResult Function(_OperationStateLoading value) loading,
    required TResult Function(_OperationStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OperationStateInital value)? init,
    TResult? Function(_OperationStateLoaded value)? loaded,
    TResult? Function(_OperationStateLoading value)? loading,
    TResult? Function(_OperationStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OperationStateInital value)? init,
    TResult Function(_OperationStateLoaded value)? loaded,
    TResult Function(_OperationStateLoading value)? loading,
    TResult Function(_OperationStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OperationStateLoadingImplToJson(
      this,
    );
  }
}

abstract class _OperationStateLoading implements OperationState {
  const factory _OperationStateLoading() = _$OperationStateLoadingImpl;

  factory _OperationStateLoading.fromJson(Map<String, dynamic> json) =
      _$OperationStateLoadingImpl.fromJson;
}

/// @nodoc
abstract class _$$OperationStateErrorImplCopyWith<$Res> {
  factory _$$OperationStateErrorImplCopyWith(_$OperationStateErrorImpl value,
          $Res Function(_$OperationStateErrorImpl) then) =
      __$$OperationStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$OperationStateErrorImplCopyWithImpl<$Res>
    extends _$OperationStateCopyWithImpl<$Res, _$OperationStateErrorImpl>
    implements _$$OperationStateErrorImplCopyWith<$Res> {
  __$$OperationStateErrorImplCopyWithImpl(_$OperationStateErrorImpl _value,
      $Res Function(_$OperationStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$OperationStateErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperationStateErrorImpl implements _OperationStateError {
  const _$OperationStateErrorImpl(this.error, {final String? $type})
      : $type = $type ?? 'error';

  factory _$OperationStateErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationStateErrorImplFromJson(json);

  @override
  final dynamic error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OperationState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationStateErrorImplCopyWith<_$OperationStateErrorImpl> get copyWith =>
      __$$OperationStateErrorImplCopyWithImpl<_$OperationStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<OperationEntity> operationEntity) loaded,
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<OperationEntity> operationEntity)? loaded,
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<OperationEntity> operationEntity)? loaded,
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OperationStateInital value) init,
    required TResult Function(_OperationStateLoaded value) loaded,
    required TResult Function(_OperationStateLoading value) loading,
    required TResult Function(_OperationStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OperationStateInital value)? init,
    TResult? Function(_OperationStateLoaded value)? loaded,
    TResult? Function(_OperationStateLoading value)? loading,
    TResult? Function(_OperationStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OperationStateInital value)? init,
    TResult Function(_OperationStateLoaded value)? loaded,
    TResult Function(_OperationStateLoading value)? loading,
    TResult Function(_OperationStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OperationStateErrorImplToJson(
      this,
    );
  }
}

abstract class _OperationStateError implements OperationState {
  const factory _OperationStateError(final dynamic error) =
      _$OperationStateErrorImpl;

  factory _OperationStateError.fromJson(Map<String, dynamic> json) =
      _$OperationStateErrorImpl.fromJson;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$OperationStateErrorImplCopyWith<_$OperationStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
