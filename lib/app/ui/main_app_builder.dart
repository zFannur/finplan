import 'package:finplan/app/di/init_di.dart';
import 'package:finplan/feature/operation/domain/operation_repository.dart';
import 'package:finplan/feature/operation/domain/state/operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/app_builder.dart';
import '../router/app_router.dart';

class MainAppBuilder implements AppBuilder {
  final _appRouter = AppRouter();

  @override
  Widget buildApp() {
    return _GlobalProviders(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}

class _GlobalProviders extends StatelessWidget {
  const _GlobalProviders({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => OperationCubit(
                  locator.get<OperationRepository>(),
                )..getOperation()),
      ],
      child: child,
    );
  }
}
