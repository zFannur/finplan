part of 'operation_cubit.dart';

@freezed
class OperationState with _$OperationState {
  const factory OperationState.init() = _OperationStateInital;

  const factory OperationState.loaded(
      List<OperationEntity> operationEntity,
      ) = _OperationStateLoaded;

  const factory OperationState.loading() = _OperationStateLoading;

  const factory OperationState.error(dynamic error) = _OperationStateError;

  factory OperationState.fromJson(Map<String, dynamic> json) =>
      _$OperationStateFromJson(json);
}
