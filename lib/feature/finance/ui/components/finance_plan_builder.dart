import 'package:finplan/app/ui/components/app_loader.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/feature/finance/domain/plan_entity/plan_entity.dart';
import 'package:finplan/feature/finance/ui/bloc/plan_cubit/finance_plan_cubit.dart';
import 'package:finplan/feature/finance/ui/components/plans_per_category.dart';
import 'package:finplan/feature/finance/ui/components/select_period_panel_widget.dart';
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
          const SelectPeriodPanel(
            firstText: 'План',
            secondText: 'Факт',
          ),
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
                      name: PlanType.expense,
                      listPlans: state.listExpense ?? [],
                    ),
                    PlansPerCategory(
                      name: PlanType.income,
                      listPlans: state.listIncome ?? [],
                    ),
                    PlansPerCategory(
                      name: PlanType.target,
                      listPlans: state.listTargets ?? [],
                    ),
                    PlansPerCategory(
                      name: PlanType.since,
                      listPlans: state.listSince ?? [],
                    ),
                    PlansPerCategory(
                      name: PlanType.habit,
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
