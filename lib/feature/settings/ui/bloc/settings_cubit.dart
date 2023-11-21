import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../operation/domain/entities/operation_entity/operation_entity.dart';
import '../../../operation/domain/usecase/operation_usecase.dart';
import '../../domain/usecase/import_export_usecase.dart';

part 'settings_state.dart';

part 'settings_cubit.freezed.dart';

@Singleton()
class SettingsCubit extends Cubit<SettingsState> {
  final ImportExportUseCase importExportUseCase;
  final OperationUseCase operationUseCase;

  SettingsCubit(
    this.importExportUseCase,
    this.operationUseCase,
  ) : super(const SettingsState.initial());

  Future<List<OperationEntity>> loadCsvFromStorage() {
    return importExportUseCase.loadCsvFromStorage();
  }

  Future<void> saveToCsv() {
    return importExportUseCase.saveToCsv();
  }

  Future<void> saveData(List<OperationEntity> operations) async {
    return operationUseCase.addDataFromFile(operations);
  }
}
