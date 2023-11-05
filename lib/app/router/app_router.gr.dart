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
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthScreen(),
      );
    },
    FinanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FinanceScreen(),
      );
    },
    FinanceStatisticRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FinanceStatisticScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
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
        child: const OperationScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterScreen(key: args.key),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootScreen(),
      );
    },
    UserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserScreen(),
      );
    },
  };
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FinanceScreen]
class FinanceRoute extends PageRouteInfo<void> {
  const FinanceRoute({List<PageRouteInfo>? children})
      : super(
          FinanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FinanceStatisticScreen]
class FinanceStatisticRoute extends PageRouteInfo<void> {
  const FinanceStatisticRoute({List<PageRouteInfo>? children})
      : super(
          FinanceStatisticRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinanceStatisticRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
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
/// [OperationScreen]
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
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<RegisterRouteArgs> page =
      PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
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
/// [UserScreen]
class UserRoute extends PageRouteInfo<void> {
  const UserRoute({List<PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
