import 'package:auto_route/annotations.dart';
import 'package:finplan/feature/auth/ui/components/auth_builder.dart';
import 'package:finplan/feature/auth/ui/user_screen.dart';
import 'package:flutter/material.dart';

import '../../../app/ui/components/app_loader.dart';
import 'login_screen.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      isNotAuthorized: (context) => LoginScreen(),
      isWaiting: (context) => const Scaffold(body: AppLoader()),
      isAuthorized: (context, userEntity, child) => const UserScreen(),
    );
  }
}
