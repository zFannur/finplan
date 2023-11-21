import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'package:finplan/feature/operation/domain/usecase/operation_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@Injectable()
@prod
@dev
class ImportExportUseCase {
  final OperationUseCase operationUseCase;
  ImportExportUseCase(this.operationUseCase);

  Future<void> saveToCsv() async {
    List<OperationEntity> listOperation = await operationUseCase.getOperation();
    List<List<String>> data = List.generate(
        listOperation.length,
            (index) => [
          listOperation[index].id.toString(),
          listOperation[index].date,
          listOperation[index].type.toHive(),
          listOperation[index].category,
          listOperation[index].sum.toString(),
          listOperation[index].underCategory,
          listOperation[index].note,
        ]);

    String csvData = const ListToCsvConverter().convert(data);

    final String directory = (await getDownloadsDirectory())?.path ?? '';
    final path = "$directory/csv-${DateTime.now()}.csv";
    print(path);
    final File file = File(path);
    await file.writeAsString(csvData);
    await file.create();
  }

  Future<List<OperationEntity>> loadCsvFromStorage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['csv'],
      type: FileType.custom,
    );
    String path = result?.files.first.path ?? '';
    final csvFile = File(path).openRead();
    List<List<dynamic>> list = await csvFile
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
    return List.generate(
        list.length,
            (index) => OperationEntity(
          id: list[index][0] ?? '',
          date: list[index][1] ?? '',
          type: list[index][2].toString().toType(),
          category: list[index][3] ?? '',
          sum: int.parse(list[index][4].toString()),
          underCategory: list[index][5] ?? '',
          note: list[index].length > 6 ? list[index][6] : '',
        ));
  }
}

extension on String {
  TypeOperation toType() {
    if (this == 'expense') {
      return TypeOperation.expense;
    } else {
      return TypeOperation.income;
    }
  }
}

extension on TypeOperation {
  String toHive() {
    if (this == TypeOperation.expense) {
      return 'expense';
    } else {
      return 'income';
    }
  }
}