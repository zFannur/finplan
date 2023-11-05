import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/router/app_router.dart';
import 'package:finplan/app/ui/components/app_auth_icon.dart';
import 'package:finplan/feature/operation/ui/operations_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Главное меню"),
        actions: const [
          AppAuthIcon(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              context.pushRoute(const FinanceRoute());
            },
            child: Text(
              'Финансы',
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => OperationScreen()),
              );
            },
            child: Text(
              'Тайм менеджмент',
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Навыки и привычки',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
