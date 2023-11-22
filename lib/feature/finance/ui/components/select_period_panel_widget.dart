import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/const/app_const.dart';
import '../../../../app/ui/components/app_dropdown_button_widget.dart';
import '../../../../app/ui/theme/app_colors.dart';
import '../../../../app/ui/theme/app_text_style.dart';
import '../bloc/plan_cubit/finance_plan_cubit.dart';

class SelectPeriodPanel extends StatelessWidget {
  final String firstText;
  final String secondText;

  const SelectPeriodPanel({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    final planCubit = context.read<FinancePlanCubit>();
    final selectedMonth = context.watch<FinancePlanCubit>().state.selectMonth;
    final selectedYear = context.watch<FinancePlanCubit>().state.selectYear;
    return Container(
      color: AppColors.greyDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // const Column(
          //   children: [
          //     Text(
          //       'Месяц',
          //       style: AppTextStyle.bold14,
          //     ),
          //   ],
          // ),
          Row(
            children: [
              AppDropdownButtonWidget(
                value: selectedMonth,
                onChanged: (value) {
                  planCubit.setMonth(value ?? 1);
                },
                items: AppConst.monthSet.map<DropdownMenuItem<int>>((value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString().toMonthName()),
                  );
                }).toList(),
              ),
              AppDropdownButtonWidget(
                value: selectedYear,
                onChanged: (value) {
                  planCubit.setYear(value ?? 1);
                },
                items: AppConst.yearsSet.map<DropdownMenuItem<int>>((value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
            ],
          ),
          Text(
            firstText,
            style: AppTextStyle.bold14,
          ),
          Text(
            secondText,
            style: AppTextStyle.bold14,
          )
        ],
      ),
    );
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
