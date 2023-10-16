import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../feature/home/ui/home_screen.dart';
import '../../feature/operation/domain/entities/operation_entity/operation_entity.dart';
import '../../feature/operation/ui/operation_detail_screen.dart';
import '../../feature/operation/ui/operation_screen.dart';
import '../../feature/statistic/ui/statistic_screen.dart';
import '../ui/root_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: RootRoute.page),
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
      children: [
        AutoRoute(
          page: OperationRoute.page,
          path: 'operation',
        ),
        AutoRoute(
          page: StatisticRoute.page,
          path: 'statistic',
        ),
      ],
    ),
    AutoRoute(
      page: OperationDetailRoute.page,
      path: '/operationDetail',
    ),
  ];
}