import 'package:auto_route/annotations.dart';
import 'package:finplan/app/di/init_di.dart';
import 'package:finplan/feature/operation/data/data_source/local_data_source.dart';
import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'package:finplan/feature/operation/domain/state/operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  final controllerDate = TextEditingController();
  final controllerType = TextEditingController();
  final controllerForm = TextEditingController();
  final controllerSum = TextEditingController();
  final controllerNote = TextEditingController();

  @override
  void initState() {
    controllerDate.text = widget.operation?.date ?? DateTime.now().toString();
    if (widget.operation != null) {
      controllerType.text = widget.operation?.type ?? "";
      controllerForm.text = widget.operation?.form ?? "";
      controllerSum.text = widget.operation?.sum.toString() ?? "";
      controllerNote.text = widget.operation?.note ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    controllerDate.dispose();
    controllerType.dispose();
    controllerForm.dispose();
    controllerSum.dispose();
    controllerNote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              CustomTextFormField(
                hintText: 'Тип',
                labelText: 'Тип операции',
                listCategories: listCategories(OperationType.type),
                controller: controllerType,
                validator: emptyValidator,
              ),
              CustomTextFormField(
                hintText: 'Направление',
                labelText: 'Направление операции',
                listCategories: listCategories(OperationType.form),
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
                listCategories: listCategories(OperationType.note),
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
              id: widget.operation?.id ?? locator.get<LocalDataSource>().getNewId(),
              date: controllerDate.text,
              type: controllerType.text,
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

  List<String> listCategories(OperationType operationType) {
    List<OperationEntity> operationList = context
            .read<OperationCubit>()
            .state
            .whenOrNull(loaded: (operationEntity) => operationEntity) ??
        [];
    List<String> categories = [];

    switch (operationType) {
      case OperationType.date:
        break;
      case OperationType.type:
        var uniques = <String, bool>{};
        for (var s in operationList) {
          uniques[s.type] = true;
        }
        for (var key in uniques.keys) {
          categories.add(key);
        }
        break;
      case OperationType.form:
        var uniques = <String, bool>{};
        for (var s in operationList) {
          uniques[s.form] = true;
        }
        for (var key in uniques.keys) {
          categories.add(key);
        }
        break;
      case OperationType.note:
        var uniques = <String, bool>{};
        for (var s in operationList) {
          uniques[s.note] = true;
        }
        for (var key in uniques.keys) {
          categories.add(key);
        }
        break;
    }

    return categories;
  }
}
