import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../app/ui/components/app_plan_dialog.dart';
import '../../../app/ui/theme/app_icons.dart';
import 'components/finance_plan_builder.dart';

@RoutePage()
class FinancePlanPage extends StatelessWidget {
  const FinancePlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const FinancePlanBuilder(),
      floatingActionButton: FloatingActionButton(
        heroTag: '3',
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AppPlanDialog(),
          );
        },
        child: AppIcons.add,
      ),
    );
  }
}
