import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/const/app_local_data_keys.dart';
import 'package:finplan/app/ui/theme/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/finance/data/data_source/plan_local_data_source.dart';
import '../../../feature/finance/domain/plan_entity/plan_entity.dart';
import '../../../feature/finance/ui/bloc/plan_cubit/finance_plan_cubit.dart';
import '../../di/init_di.dart';
import '../../domain/state/categories/categories_cubit.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';
import 'app_button.dart';
import 'app_loader.dart';
import 'app_text_field.dart';

class AppPlanDialog extends StatefulWidget {
  const AppPlanDialog({
    super.key,
    this.planEntity,
  });

  final PlanEntity? planEntity;

  @override
  State<AppPlanDialog> createState() => _AppPlanDialogState();
}

class _AppPlanDialogState extends State<AppPlanDialog> {
  final TextEditingController controllerSum = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  late String valueType;
  String? selectedCategory;

  @override
  void initState() {
    valueType = widget.planEntity?.type.toStr() ?? PlanType.expense.toStr();
    if (widget.planEntity != null) {
      controllerSum.text = widget.planEntity?.sum.toString() ?? "";
      selectedCategory = widget.planEntity?.category ?? "";
    }
    context.read<CategoriesCubit>().getCategories(LocalDataConst.categoryKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: AppColors.greyDark,
      children: [
        Form(
          key: formKey,
          child: Padding(
            padding: AppPadding.all16,
            child: Column(
              children: [
                DropdownButton<String>(
                  //isExpanded: true,
                  iconSize: 24,
                  alignment: Alignment.center,
                  value: valueType,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.orange,
                  ),
                  elevation: 16,
                  style: AppTextStyle.bold24,
                  dropdownColor: AppColors.greyDark,
                  underline: Container(
                    width: double.infinity,
                    height: 2,
                    color: AppColors.orange,
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        valueType = value;
                      });
                    }
                  },
                  items: PlanType.values.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.toStr(),
                      child: Text(value.toStr()),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: AppPadding.top8,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: BlocBuilder<CategoriesCubit, CategoriesState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loaded: (List<dynamic> list) => SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Wrap(
                              children: List.generate(
                                list.length,
                                (index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: AppButton(
                                      isFixedSize: false,
                                      backgroundColor:
                                          selectedCategory == list[index]
                                              ? AppColors.grey
                                              : AppColors.greyDark,
                                      onPressed: () {
                                        if (selectedCategory == list[index]) {
                                          selectedCategory = null;
                                        } else {
                                          selectedCategory = list[index];
                                        }
                                        setState(() {});
                                      },
                                      child: Text(
                                        list[index],
                                        style: AppTextStyle.medium14,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          loading: () => const AppLoader(),
                          error: (error) => Text(
                            error.toString(),
                            style: AppTextStyle.mediumRed20,
                          ),
                          orElse: () {
                            return const Text(
                              'Что то пошло не так',
                              style: AppTextStyle.mediumRed20,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: AppPadding.top8,
                  child: AppTextField(
                    keyboardType: TextInputType.number,
                    labelText: 'Сумма',
                    controller: controllerSum,
                  ),
                ),
                Padding(
                  padding: AppPadding.top8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        onPressed: () {
                          if (widget.planEntity != null) {
                            context
                                .read<FinancePlanCubit>()
                                .deletePlan(widget.planEntity!);
                            context.popRoute();
                          } else {
                            context.popRoute();
                          }
                        },
                        child: Text(
                          widget.planEntity != null ? 'Удалить' : 'Назад',
                          style: AppTextStyle.bold14,
                        ),
                      ),
                      AppButton(
                        onPressed: () {
                          final planCubit = context.read<FinancePlanCubit>();
                          if (formKey.currentState?.validate() == true &&
                              selectedCategory != null) {
                            planCubit.addPlan(PlanEntity(
                              id: locator.get<PlanLocalDataSource>().getNewId(),
                              date: DateTime.now()
                                  .copyWith(month: planCubit.state.selectMonth)
                                  .toString(),
                              type: valueType.toType(),
                              category: selectedCategory!,
                              sum: int.parse(controllerSum.text),
                            ));
                            context.popRoute();
                          }
                        },
                        child: Text(
                          widget.planEntity != null
                              ? 'Редактировать'
                              : 'Добавить',
                          style: AppTextStyle.bold14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

extension on String {
  PlanType toType() {
    switch (this) {
      case 'Расход':
        return PlanType.expense;
      case 'Доход':
        return PlanType.income;
      case 'Цели':
        return PlanType.target;
      case 'Навыки':
        return PlanType.since;
      case 'Привычки':
        return PlanType.habit;
      default:
        throw Exception(['Ошибка преобразования данных']);
    }
  }
}

extension on PlanType {
  String toStr() {
    switch (this) {
      case PlanType.expense:
        return 'Расход';
      case PlanType.income:
        return 'Доход';
      case PlanType.target:
        return 'Цели';
      case PlanType.since:
        return 'Навыки';
      case PlanType.habit:
        return 'Привычки';
      default:
        throw Exception(['Ошибка преобразования данных']);
    }
  }
}
