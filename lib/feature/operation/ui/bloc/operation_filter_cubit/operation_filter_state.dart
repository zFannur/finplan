part of 'operation_filter_cubit.dart';

@freezed
class OperationFilterState with _$OperationFilterState {
  const factory OperationFilterState({
    @JsonKey(includeToJson: false, includeFromJson: false)
    AsyncSnapshot? asyncSnapshot,
    @Default([])
    List<OperationEntity>? operationList,
    Map<DateTime, List<OperationEntity>>? mapByDay,
    Map<DateTime, List<OperationEntity>>? mapByMonth,
  }) = _OperationFilterState;

  factory OperationFilterState.fromJson(Map<String, dynamic> json) =>
      _$OperationFilterStateFromJson(json);
}
