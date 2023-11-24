import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/router/app_router.dart';
import 'package:finplan/app/ui/components/app_auth_icon.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
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
            child: const Text(
              'Финансы',
              style: AppTextStyle.bold24,
            ),
          ),
          TextButton(
            onPressed: () {
            },
            child: const Text(
              'Тайм менеджмент',
              style: AppTextStyle.bold24,
            ),
          ),
          TextButton(
            onPressed: () {
              context.pushRoute(const ExperienceRoute());
            },
            child: const Text(
              'Опыт',
              style: AppTextStyle.bold24,
            ),
          ),
        ],
      ),
    );
  }
}
