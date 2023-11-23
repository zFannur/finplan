import 'package:auto_route/annotations.dart';
import 'package:finplan/feature/finance/ui/components/select_period_panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/domain/error_entity/error_entity.dart';
import '../../../app/ui/components/app_loader.dart';
import '../../../app/ui/components/app_snack_bar.dart';
import '../../../app/ui/theme/app_text_style.dart';
import '../domain/plan_entity/plan_entity.dart';
import 'bloc/plan_cubit/finance_plan_cubit.dart';
import 'components/plans_per_category.dart';

@RoutePage()
class FinanceStatisticPage extends StatelessWidget {
  const FinanceStatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SelectPeriodPanel(
            firstText: 'План',
            secondText: 'Факт',
          ),
          Expanded(
            child: BlocConsumer<FinancePlanCubit, FinancePlanState>(
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
                //вывести логику отсюда
                if (state.statList != null &&
                    (state.statList?.isNotEmpty == true)) {
                  List<PlanEntity> listExpense = [];
                  List<PlanEntity> listIncome = [];
                  List<PlanEntity> listTarget = [];
                  List<PlanEntity> listSince = [];
                  List<PlanEntity> listHabit = [];

                  for (var element in state.statList!) {
                    switch (element.type) {
                      case PlanType.expense:
                        listExpense.add(element);
                      case PlanType.income:
                        listIncome.add(element);
                      case PlanType.target:
                        listTarget.add(element);
                      case PlanType.since:
                        listSince.add(element);
                      case PlanType.habit:
                        listHabit.add(element);
                    }
                  }

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        PlansPerCategory(
                          name: PlanType.expense,
                          listPlans: listExpense,
                        ),
                        PlansPerCategory(
                          name: PlanType.income,
                          listPlans: listIncome,
                        ),
                        PlansPerCategory(
                          name: PlanType.target,
                          listPlans: listTarget,
                        ),
                        PlansPerCategory(
                          name: PlanType.since,
                          listPlans: listSince,
                        ),
                        PlansPerCategory(
                          name: PlanType.habit,
                          listPlans: listHabit,
                        ),
                      ],
                    ),
                  );
                }

                return const Center(
                  child: Text(
                    "Нету статистики",
                    style: AppTextStyle.bold24,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
