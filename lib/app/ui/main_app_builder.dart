import 'package:finplan/app/di/init_di.dart';
import 'package:finplan/app/domain/app_categories_repository.dart';
import 'package:finplan/app/domain/state/categories/categories_cubit.dart';
import 'package:finplan/app/ui/theme/theme.dart';
import 'package:finplan/feature/auth/domain/auth_repository.dart';
import 'package:finplan/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:finplan/feature/finance/domain/usecase/plan_usecase.dart';
import 'package:finplan/feature/finance/ui/bloc/plan_cubit/finance_plan_cubit.dart';
import 'package:finplan/feature/operation/domain/usecase/operation_usecase.dart';
import 'package:finplan/feature/operation/ui/bloc/operation_filter_cubit/operation_filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/operation/ui/bloc/operation_cubit/operation_cubit.dart';
import '../domain/app_builder.dart';
import '../router/app_router.dart';

class MainAppBuilder implements AppBuilder {
  final _appRouter = AppRouter();

  @override
  Widget buildApp() {
    return _GlobalProviders(
      child: MaterialApp.router(
        theme: mainThemeData,
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
            create: (context) => locator.get<OperationCubit>()..getOperation()),
        BlocProvider(
            create: (context) => AuthCubit(
                  locator.get<AuthRepository>(),
                )),
        BlocProvider(
            create: (context) => CategoriesCubit(
                  locator.get<AppCategoriesRepository>(),
                )),
        BlocProvider(
            create: (context) => OperationFilterCubit(
                  locator.get<OperationCubit>(),
                )),
        BlocProvider(
            create: (context) => FinancePlanCubit(
                  locator.get<PlanUseCase>(),
                  locator.get<OperationUseCase>(),
                )..getPlan()),
      ],
      child: child,
    );
  }
}
