import 'package:auto_route/annotations.dart';
import 'package:finplan/app/di/init_di.dart';
import 'package:finplan/feature/operation/data/data_source/opeartion_local_data_source.dart';
import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'package:flutter/material.dart';

import '../../../app/const/app_local_data_keys.dart';
import '../../../app/data/data_source/app_categories_local_data_source.dart';
import 'components/custom_text_form_field.dart';

enum OperationType {
  date,
  type,
  form,
  note,
}

@RoutePage()
class OperationDetailScreen extends StatefulWidget {
  final String title;
  final IconData buttonIcon;
  final Function(OperationEntity operationEntity) onTap;
  final OperationEntity? operation;

  const OperationDetailScreen({
    super.key,
    required this.buttonIcon,
    required this.onTap,
    required this.title,
    this.operation,
  });

  @override
  State<OperationDetailScreen> createState() => _OperationDetailScreenState();
}

class _OperationDetailScreenState extends State<OperationDetailScreen> {
  final formKey = GlobalKey<FormState>();

  late TypeOperation type;
  final controllerDate = TextEditingController();
  final controllerForm = TextEditingController();
  final controllerSum = TextEditingController();
  final controllerNote = TextEditingController();

  @override
  void initState() {
    controllerDate.text = widget.operation?.date ?? DateTime.now().toString();
    type = widget.operation?.type ?? TypeOperation.expense;
    if (widget.operation != null) {
      controllerForm.text = widget.operation?.form ?? "";
      controllerSum.text = widget.operation?.sum.toString() ?? "";
      controllerNote.text = widget.operation?.note ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    locator.get<AppCategoriesLocalDataSource>().close();
    controllerDate.dispose();
    controllerForm.dispose();
    controllerSum.dispose();
    controllerNote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final categoriesCubit = context.read<CategoriesCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DataFieldWidget(
                hintText: 'Дата',
                labelText: 'Дата операции',
                controller: controllerDate,
                validator: emptyValidator,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        type = TypeOperation.expense;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                        decoration: BoxDecoration(
                          color: type == TypeOperation.expense
                              ? Colors.red.shade300
                              : Colors.grey,
                        ),
                        child: const Text("Расход"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        type = TypeOperation.income;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                        decoration: BoxDecoration(
                          color: type == TypeOperation.income
                              ? Colors.green.shade300
                              : Colors.grey,
                        ),
                        child: const Text("Доход"),
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextFormField(
                hintText: 'Направление',
                labelText: 'Направление операции',
                categoriesKey: LocalDataConst.formCategoryKey,
                controller: controllerForm,
                validator: emptyValidator,
              ),
              SumFieldWidget(
                hintText: 'Сумма',
                labelText: 'Сумма операции',
                controller: controllerSum,
                validator: emptyValidator,
              ),
              CustomTextFormField(
                hintText: 'Дополнительно',
                labelText: 'Дополнительно об операции',
                categoriesKey: LocalDataConst.noteCategoryKey,
                controller: controllerNote,
                validator: emptyValidator,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            widget.onTap(OperationEntity(
              id: widget.operation?.id ??
                  locator.get<OperationLocalDataSource>().getNewId(),
              date: controllerDate.text,
              type: type,
              form: controllerForm.text,
              sum: int.parse(controllerSum.text),
              note: controllerNote.text,
            ));
          }
        },
        child: Icon(widget.buttonIcon),
      ),
    );
  }

  String? emptyValidator(String? value) {
    if (value?.isEmpty == true) {
      return "обязательное поле";
    }
    return null;
  }
}
