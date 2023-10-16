import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../entities/operation_entity/operation_entity.dart';
import '../operation_repository.dart';

part 'operation_state.dart';
part 'operation_cubit.freezed.dart';
part 'operation_cubit.g.dart';

class OperationCubit extends HydratedCubit<OperationState> {
  final OperationRepository operationRepository;
  
  OperationCubit(this.operationRepository) : super(const OperationState.init());

  void getOperation() async {
    emit(const OperationState.loading());
    try {
      final operationList = operationRepository.getOperation();
      emit(OperationState.loaded(operationList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> addOperation(OperationEntity operationEntity) async {
    try {
      await operationRepository.addOperation(operationEntity);
      final operationList = operationRepository.getOperation();
      emit(OperationState.loaded(operationList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> editOperation(OperationEntity operationEntity) async {
    try {
      await operationRepository.editOperation(operationEntity);
      final operationList = operationRepository.getOperation();
      emit(OperationState.loaded(operationList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> deleteOperation(OperationEntity operationEntity) async {
    try {
      await operationRepository.deleteOperation(operationEntity);
      final operationList = operationRepository.getOperation();
      emit(OperationState.loaded(operationList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(OperationState.error(error));
    super.addError(error, stackTrace);
  }

  @override
  OperationState? fromJson(Map<String, dynamic> json) {
    final state = OperationState.fromJson(json);
    return state.whenOrNull(
      loaded: (operationEntity) => OperationState.loaded(operationEntity),
    );
  }

  @override
  Map<String, dynamic>? toJson(OperationState state) {
    return state
        .whenOrNull(
        loaded: (operationEntity) => OperationState.loaded(operationEntity))
        ?.toJson() ??
        const OperationState.init().toJson();
  }
}
