import 'package:auto_route/auto_route.dart';
import 'package:finplan/feature/finance/ui/finance_plan_page.dart';
import 'package:flutter/cupertino.dart';

import '../../feature/auth/ui/auth_screen.dart';
import '../../feature/auth/ui/login_screen.dart';
import '../../feature/auth/ui/register_screen.dart';
import '../../feature/auth/ui/user_screen.dart';
import '../../feature/finance/ui/finance_screen.dart';
import '../../feature/finance/ui/finance_statistic_page.dart';
import '../../feature/operation/domain/entities/operation_entity/operation_entity.dart';
import '../../feature/operation/ui/operation_detail_screen.dart';
import '../../feature/operation/ui/operations_page.dart';
import '../ui/root_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: RootRoute.page),
    AutoRoute(
      page: FinanceRoute.page,
      path: '/finance',
      children: [
        AutoRoute(
          page: OperationRoute.page,
          path: 'operation',
        ),
        AutoRoute(
          page: FinancePlanRoute.page,
          path: 'plan',
        ),
        AutoRoute(
          page: FinanceStatisticRoute.page,
          path: 'finance_statistic',
        ),
      ],
    ),
    AutoRoute(
      page: OperationDetailRoute.page,
      path: '/operationDetail',
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    AutoRoute(
      page: RegisterRoute.page,
      path: '/register',
    ),
    AutoRoute(
      page: UserRoute.page,
      path: '/user',
    ),
    AutoRoute(
      page: AuthRoute.page,
      path: '/auth',
    ),
  ];
}