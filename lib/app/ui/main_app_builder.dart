import 'package:finplan/app/di/init_di.dart';
import 'package:finplan/app/domain/state/categories/categories_cubit.dart';
import 'package:finplan/app/ui/theme/theme.dart';
import 'package:finplan/feature/auth/domain/auth_repository.dart';
import 'package:finplan/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:finplan/feature/experience/domain/habit_repository.dart';
import 'package:finplan/feature/experience/ui/bloc/habit_cubit/habit_cubit.dart';
import 'package:finplan/feature/finance/ui/bloc/plan_cubit/finance_plan_cubit.dart';
import 'package:finplan/feature/operation/ui/bloc/operation_filter_cubit/operation_filter_cubit.dart';
import 'package:finplan/feature/settings/ui/bloc/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../feature/operation/ui/bloc/operation_cubit/operation_cubit.dart';
import '../../generated/l10n.dart';
import '../domain/app_builder.dart';
import '../router/app_router.dart';

class MainAppBuilder implements AppBuilder {
  final _appRouter = AppRouter();

  @override
  Widget buildApp() {
    return _GlobalProviders(
      child: MaterialApp.router(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
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
        BlocProvider(create: (context) => locator.get<SettingsCubit>()),
        BlocProvider(
            create: (context) => locator.get<OperationCubit>()..getOperation()),
        BlocProvider(
            create: (context) => AuthCubit(
                  locator.get<AuthRepository>(),
                )),
        BlocProvider(create: (context) => locator.get<CategoriesCubit>()),
        BlocProvider(
            create: (context) => OperationFilterCubit(
                  locator.get<OperationCubit>(),
                )),
        BlocProvider(
          create: (context) => locator.get<FinancePlanCubit>()..getPlan(),
        ),
        BlocProvider(
            create: (context) => HabitCubit(
              locator.get<HabitRepository>(),
            )..getHabit()),
      ],
      child: child,
    );
  }
}
