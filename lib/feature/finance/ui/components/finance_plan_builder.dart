import 'package:finplan/app/ui/components/app_loader.dart';
import 'package:finplan/app/ui/theme/app_colors.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';
import 'package:finplan/feature/finance/ui/bloc/plan_cubit/finance_plan_cubit.dart';
import 'package:finplan/feature/finance/ui/components/plans_per_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/domain/error_entity/error_entity.dart';
import '../../../../app/ui/components/app_snack_bar.dart';

class FinancePlanBuilder extends StatelessWidget {
  const FinancePlanBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SelectMonthPanel(),
          BlocConsumer<FinancePlanCubit, FinancePlanState>(
            listener: (context, state) {
              // if (state.asyncSnapshot?.hasData == true) {
              //   AppSnackBar.showSnackBarWithMessage(
              //     context,
              //     state.asyncSnapshot?.data,
              //   );
              // }

              if (state.asyncSnapshot?.hasError == true) {
                AppSnackBar.showSnackBarWithError(
                  context,
                  ErrorEntity.fromException(state.asyncSnapshot?.error),
                );
              }
            },
            builder: (BuildContext context, state) {
              if (state.asyncSnapshot?.connectionState ==
                  ConnectionState.waiting) {
                return const AppLoader();
              }

              if (state.planList != null &&
                  (state.planList?.isNotEmpty == true)) {
                return Column(
                  children: [
                    PlansPerCategory(
                      name: PlanType.expense.toStr(),
                      listPlans: state.listExpense ?? [],
                    ),
                    PlansPerCategory(
                      name: PlanType.income.toStr(),
                      listPlans: state.listIncome ?? [],
                    ),
                    PlansPerCategory(
                      name: PlanType.target.toStr(),
                      listPlans: state.listTargets ?? [],
                    ),
                    PlansPerCategory(
                      name: PlanType.since.toStr(),
                      listPlans: state.listSince ?? [],
                    ),
                    PlansPerCategory(
                      name: PlanType.habit.toStr(),
                      listPlans: state.listHabit ?? [],
                    ),
                  ],
                );
              }

              return const Center(
                child: Text(
                  "Нету планов",
                  style: AppTextStyle.bold24,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SelectMonthPanel extends StatelessWidget {
  const SelectMonthPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final planCubit = context.read<FinancePlanCubit>();
    final selectedMonth = context.watch<FinancePlanCubit>().state.selectMonth;
    return Container(
      color: AppColors.greyDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text(
                'Месяц',
                style: AppTextStyle.bold14,
              ),
            ],
          ),
          DropdownButton<int>(
            //isExpanded: true,
            iconSize: 24,
            alignment: Alignment.center,
            value: selectedMonth,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: AppColors.orange,
            ),
            elevation: 16,
            style: AppTextStyle.bold14,
            dropdownColor: AppColors.greyDark,
            underline: Container(
              width: double.infinity,
              height: 2,
              color: AppColors.orange,
            ),
            onChanged: (value) {
              planCubit.setMonth(value ?? 1);
            },
            items:
                planCubit.state.monthSet?.map<DropdownMenuItem<int>>((value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString().toMonthName()),
              );
            }).toList(),
          ),
          const Text(
            'Год',
            style: AppTextStyle.bold14,
          ),
          DropdownButton<int>(
            //isExpanded: true,
            iconSize: 24,
            alignment: Alignment.center,
            value: selectedMonth,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: AppColors.orange,
            ),
            elevation: 16,
            style: AppTextStyle.bold14,
            dropdownColor: AppColors.greyDark,
            underline: Container(
              width: double.infinity,
              height: 2,
              color: AppColors.orange,
            ),
            onChanged: (value) {
              planCubit.setMonth(value ?? 1);
            },
            items:
            planCubit.state.monthSet?.map<DropdownMenuItem<int>>((value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString().toMonthName()),
              );
            }).toList(),
          ),
          const Text(
            'План',
            style: AppTextStyle.bold14,
          ),
          const Text(
            'Прогноз',
            style: AppTextStyle.bold14,
          )
        ],
      ),
    );
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
        return 'Цель';
      case PlanType.since:
        return 'Навык';
      case PlanType.habit:
        return 'Привычки';
      default:
        throw Exception(['Ошибка преобразования данных']);
    }
  }
}

extension on String {
  String toMonthName() {
    switch (this) {
      case '1':
        return 'Январь';
      case '2':
        return 'Февраль';
      case '3':
        return 'Март';
      case '4':
        return 'Апрель';
      case '5':
        return 'Май';
      case '6':
        return 'Июнь';
      case '7':
        return 'Июль';
      case '8':
        return 'Август';
      case '9':
        return 'Сентябрь';
      case '10':
        return 'Октябрь';
      case '11':
        return 'Ноябрь';
      case '12':
        return 'Декабрь';
      default:
        return '1';
    }
  }
}
