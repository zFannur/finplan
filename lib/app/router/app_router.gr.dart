// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    OperationDetailRoute.name: (routeData) {
      final args = routeData.argsAs<OperationDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OperationDetailScreen(
          key: args.key,
          buttonIcon: args.buttonIcon,
          onTap: args.onTap,
          title: args.title,
          operation: args.operation,
        ),
      );
    },
    OperationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OperationPage(),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootScreen(),
      );
    },
    StatisticRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StatisticScreen(),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OperationDetailScreen]
class OperationDetailRoute extends PageRouteInfo<OperationDetailRouteArgs> {
  OperationDetailRoute({
    Key? key,
    required IconData buttonIcon,
    required dynamic Function(OperationEntity) onTap,
    required String title,
    OperationEntity? operation,
    List<PageRouteInfo>? children,
  }) : super(
          OperationDetailRoute.name,
          args: OperationDetailRouteArgs(
            key: key,
            buttonIcon: buttonIcon,
            onTap: onTap,
            title: title,
            operation: operation,
          ),
          initialChildren: children,
        );

  static const String name = 'OperationDetailRoute';

  static const PageInfo<OperationDetailRouteArgs> page =
      PageInfo<OperationDetailRouteArgs>(name);
}

class OperationDetailRouteArgs {
  const OperationDetailRouteArgs({
    this.key,
    required this.buttonIcon,
    required this.onTap,
    required this.title,
    this.operation,
  });

  final Key? key;

  final IconData buttonIcon;

  final dynamic Function(OperationEntity) onTap;

  final String title;

  final OperationEntity? operation;

  @override
  String toString() {
    return 'OperationDetailRouteArgs{key: $key, buttonIcon: $buttonIcon, onTap: $onTap, title: $title, operation: $operation}';
  }
}

/// generated route for
/// [OperationPage]
class OperationRoute extends PageRouteInfo<void> {
  const OperationRoute({List<PageRouteInfo>? children})
      : super(
          OperationRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RootScreen]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StatisticScreen]
class StatisticRoute extends PageRouteInfo<void> {
  const StatisticRoute({List<PageRouteInfo>? children})
      : super(
          StatisticRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
