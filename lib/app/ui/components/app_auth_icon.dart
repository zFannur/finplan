import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/auth/domain/auth_state/auth_cubit.dart';

class AppAuthIcon extends StatelessWidget {
  const AppAuthIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (BuildContext context, state) {
      return state.when(
        notAuthorized: () => IconButton(
          onPressed: () {
            context.pushRoute(const AuthRoute());
          },
          icon: const Icon(Icons.no_accounts),
        ),
        authorized: (userEntity) => IconButton(
          onPressed: () {
            context.pushRoute(const UserRoute());
          },
          icon: const Icon(Icons.account_circle_sharp),
        ),
        waiting: () => const Icon(Icons.download_for_offline_outlined),
        error: (error) => IconButton(
          onPressed: () {
            context.pushRoute(const AuthRoute());
          },
          icon: const Icon(Icons.no_accounts),
        ),
      );
    },);
  }
}
