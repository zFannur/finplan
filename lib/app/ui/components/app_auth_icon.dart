import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/router/app_router.dart';
import 'package:flutter/material.dart';

import '../../../feature/auth/ui/components/auth_builder.dart';

class AppAuthIcon extends StatelessWidget {
  const AppAuthIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      isNotAuthorized: (context) => IconButton(
        onPressed: () {
          context.pushRoute(LoginRoute());
        },
        icon: const Icon(Icons.no_accounts),
      ),
      isWaiting: (context) => IconButton(
        onPressed: () {},
        icon: const Icon(Icons.download_for_offline_outlined),
      ),
      isAuthorized: (context, userEntity, child) =>
          IconButton(
            onPressed: () {
              context.pushRoute(const UserRoute());
            },
            icon: const Icon(Icons.account_circle_sharp),
          ),
    );
  }
}
