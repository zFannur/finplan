import 'package:auto_route/annotations.dart';
import 'package:finplan/app/ui/components/app_loader.dart';
import 'package:finplan/app/ui/theme/app_colors.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/feature/finance/ui/bloc/plan_cubit/finance_plan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/plan_entity/plan_entity.dart';
import 'components/plans_per_category.dart';

@RoutePage()
class FinancePlanPage extends StatelessWidget {
  const FinancePlanPage({super.key});

  final String nameExpense = 'Расход';
  final int value = 1;
  final List<int> month = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  final List<PlanEntity> listPlan = const [
    PlanEntity(
        name: 'Расход', category: 'category', sum: 1000, forecast: 1500, id: 0),
    PlanEntity(
        name: 'Расход',
        category: 'category2',
        sum: 200000,
        forecast: 2500,
        id: 1),
  ];

  @override
  Widget build(BuildContext context) {
    final listExpense =
        listPlan.where((element) => element.name == nameExpense).toList();
    return Column(
      children: [
        Container(
          color: AppColors.greyDark,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Месяц',
                style: AppTextStyle.bold14,
              ),
              DropdownButton<int>(
                //isExpanded: true,
                iconSize: 24,
                alignment: Alignment.center,
                value: value,
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
                onChanged: (value) {},
                items: month.map<DropdownMenuItem<int>>((value) {
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
        ),
        BlocBuilder<FinancePlanCubit, FinancePlanState>(
          builder: (BuildContext context, state) {
            return state.when(
              init: () {
                context.read<FinancePlanCubit>().getPlan();
                return const AppLoader();
              },
              loaded: (planList) {
                return PlansPerCategory(
                  name: nameExpense,
                  listPlans: listExpense,
                );
              },
              loading: () => const AppLoader(),
              error: (error) => Center(
                child: Text(
                  '$error',
                  style: AppTextStyle.mediumRed20,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

extension on String {
  String toMonthNum() {
    switch (this) {
      case 'Январь':
        return '1';
      case 'Февраль':
        return '2';
      case 'Март':
        return '3';
      case 'Апрель':
        return '4';
      case 'Май':
        return '5';
      case 'Июнь':
        return '6';
      case 'Июль':
        return '7';
      case 'Август':
        return '8';
      case 'Сентябрь':
        return '9';
      case 'Октябрь':
        return '10';
      case 'Ноябрь':
        return '11';
      case 'Декабрь':
        return '12';
      default:
        return '1';
    }
  }

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
