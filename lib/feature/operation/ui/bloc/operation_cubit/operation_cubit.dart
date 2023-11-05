import 'package:finplan/feature/operation/domain/usecase/operation_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/operation_entity/operation_entity.dart';


part 'operation_state.dart';
part 'operation_cubit.freezed.dart';
part 'operation_cubit.g.dart';

@Singleton()
class OperationCubit extends HydratedCubit<OperationState> {
  final OperationUseCase operationUseCase;
  
  OperationCubit(this.operationUseCase) : super(const OperationState.init());

  void getOperation() async {
    emit(const OperationState.loading());
    try {
      final operationList = await operationUseCase.getOperation();
      emit(OperationState.loaded(operationList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> addOperation(OperationEntity operationEntity) async {
    try {
      final operationList = await operationUseCase.addOperation(operationEntity);
      emit(OperationState.loaded(operationList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> editOperation(OperationEntity operationEntity) async {
    try {
      final operationList = await operationUseCase.editOperation(operationEntity);
      emit(OperationState.loaded(operationList));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> deleteOperation(OperationEntity operationEntity) async {
    try {
      final operationList = await operationUseCase.deleteOperation(operationEntity);
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
      loaded: (operationList) => OperationState.loaded(operationList),
    );
  }

  @override
  Map<String, dynamic>? toJson(OperationState state) {
    return state
        .whenOrNull(
        loaded: (operationList) => OperationState.loaded(operationList))
        ?.toJson() ??
        const OperationState.init().toJson();
  }
}
