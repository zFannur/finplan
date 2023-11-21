import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'components/finance_plan_builder.dart';

@RoutePage()
class FinanceStatisticPage extends StatelessWidget {
  const FinanceStatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const FinancePlanBuilder(),
    );
  }
}