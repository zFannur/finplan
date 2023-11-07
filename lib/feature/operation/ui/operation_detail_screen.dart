import 'package:auto_route/annotations.dart';
import 'package:finplan/app/di/init_di.dart';
import 'package:finplan/app/ui/components/app_bar.dart';
import 'package:finplan/app/ui/theme/app_colors.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/feature/finance/ui/bloc/plan_cubit/finance_plan_cubit.dart';
import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'package:finplan/feature/operation/ui/bloc/operation_cubit/operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/const/app_local_data_keys.dart';
import '../../../app/data/data_source/app_categories_local_data_source.dart';
import '../data/data_source/opeartion_local_data_source.dart';
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
  final controllerCategory = TextEditingController();
  final controllerSum = TextEditingController();
  final controllerUnderCategory = TextEditingController();
  final controllerNote = TextEditingController();

  @override
  void initState() {
    context.read<OperationCubit>().getOperation();
    controllerDate.text = widget.operation?.date ?? DateTime.now().toString();
    type = widget.operation?.type ?? TypeOperation.expense;
    if (widget.operation != null) {
      controllerCategory.text = widget.operation?.category ?? "";
      controllerSum.text = widget.operation?.sum.toString() ?? "";
      controllerUnderCategory.text = widget.operation?.underCategory ?? "";
      controllerNote.text = widget.operation?.note ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    locator.get<AppCategoriesLocalDataSource>().close();
    controllerDate.dispose();
    controllerCategory.dispose();
    controllerSum.dispose();
    controllerUnderCategory.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final categoriesCubit = context.read<CategoriesCubit>();
    return Scaffold(
      appBar: AppAppBar(name: widget.title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  DataFieldWidget(
                    hintText: 'Дата *',
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 16),
                            decoration: BoxDecoration(
                              color: type == TypeOperation.expense
                                  ? AppColors.redShade100
                                  : AppColors.greyDark,
                            ),
                            child: const Text(
                              "Расход",
                              style: AppTextStyle.boldRed14,
                            ),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 16),
                            decoration: BoxDecoration(
                              color: type == TypeOperation.income
                                  ? AppColors.greenShade100
                                  : AppColors.greyDark,
                            ),
                            child: const Text(
                              "Доход",
                              style: AppTextStyle.boldGreen14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    hintText: 'Категория *',
                    labelText: 'Направление операции',
                    categoriesKey: LocalDataConst.categoryKey,
                    controller: controllerCategory,
                    validator: emptyValidator,
                  ),
                  SumFieldWidget(
                    hintText: 'Сумма *',
                    labelText: 'Сумма операции',
                    controller: controllerSum,
                    validator: emptyValidator,
                  ),
                  CustomTextFormField(
                    hintText: 'Подкатегория *',
                    labelText: 'Дополнительно об операции',
                    categoriesKey: LocalDataConst.underCategoryKey,
                    controller: controllerUnderCategory,
                    validator: emptyValidator,
                  ),
                ],
              ),
            ),
            CustomTextFormField(
              hintText: 'Примечание',
              labelText: 'Для чего?',
              controller: controllerNote,
              categoriesKey: LocalDataConst.noteKey,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: widget.operation != null,
            child: FloatingActionButton(
              heroTag: '1',
              onPressed: () {
                context
                    .read<OperationCubit>()
                    .deleteOperation(widget.operation!);
              },
              child: const Icon(
                Icons.delete,
                color: AppColors.orange,
              ),
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              if (formKey.currentState?.validate() == true) {
                widget.onTap(OperationEntity(
                  id: widget.operation?.id ??
                      locator.get<OperationLocalDataSource>().getNewId(),
                  date: controllerDate.text,
                  type: type,
                  category: controllerCategory.text,
                  sum: int.parse(controllerSum.text),
                  underCategory: controllerUnderCategory.text,
                  note: controllerNote.text,
                ));
              }
            },
            child: Icon(widget.buttonIcon, color: AppColors.orange),
          ),
        ],
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
