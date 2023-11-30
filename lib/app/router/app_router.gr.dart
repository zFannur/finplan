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
    CategoriesEditRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoriesEditScreen(),
      );
    },
    ExperienceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExperienceScreen(),
      );
    },
    ExperienceStatisticRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExperienceStatisticPage(),
      );
    },
    FinancePlanRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FinancePlanPage(),
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
        child: const FinanceStatisticPage(),
      );
    },
    HabitDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HabitDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HabitDetailScreen(
          key: args.key,
          buttonIcon: args.buttonIcon,
          onTap: args.onTap,
          title: args.title,
          habitEntity: args.habitEntity,
        ),
      );
    },
    HabitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HabitPage(),
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
        child: const OperationPage(),
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
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SinceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SincePage(),
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
/// [CategoriesEditScreen]
class CategoriesEditRoute extends PageRouteInfo<void> {
  const CategoriesEditRoute({List<PageRouteInfo>? children})
      : super(
          CategoriesEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesEditRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExperienceScreen]
class ExperienceRoute extends PageRouteInfo<void> {
  const ExperienceRoute({List<PageRouteInfo>? children})
      : super(
          ExperienceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExperienceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExperienceStatisticPage]
class ExperienceStatisticRoute extends PageRouteInfo<void> {
  const ExperienceStatisticRoute({List<PageRouteInfo>? children})
      : super(
          ExperienceStatisticRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExperienceStatisticRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FinancePlanPage]
class FinancePlanRoute extends PageRouteInfo<void> {
  const FinancePlanRoute({List<PageRouteInfo>? children})
      : super(
          FinancePlanRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinancePlanRoute';

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
/// [FinanceStatisticPage]
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
/// [HabitDetailScreen]
class HabitDetailRoute extends PageRouteInfo<HabitDetailRouteArgs> {
  HabitDetailRoute({
    Key? key,
    required IconData buttonIcon,
    required dynamic Function(HabitEntity) onTap,
    required String title,
    HabitEntity? habitEntity,
    List<PageRouteInfo>? children,
  }) : super(
          HabitDetailRoute.name,
          args: HabitDetailRouteArgs(
            key: key,
            buttonIcon: buttonIcon,
            onTap: onTap,
            title: title,
            habitEntity: habitEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'HabitDetailRoute';

  static const PageInfo<HabitDetailRouteArgs> page =
      PageInfo<HabitDetailRouteArgs>(name);
}

class HabitDetailRouteArgs {
  const HabitDetailRouteArgs({
    this.key,
    required this.buttonIcon,
    required this.onTap,
    required this.title,
    this.habitEntity,
  });

  final Key? key;

  final IconData buttonIcon;

  final dynamic Function(HabitEntity) onTap;

  final String title;

  final HabitEntity? habitEntity;

  @override
  String toString() {
    return 'HabitDetailRouteArgs{key: $key, buttonIcon: $buttonIcon, onTap: $onTap, title: $title, habitEntity: $habitEntity}';
  }
}

/// generated route for
/// [HabitPage]
class HabitRoute extends PageRouteInfo<void> {
  const HabitRoute({List<PageRouteInfo>? children})
      : super(
          HabitRoute.name,
          initialChildren: children,
        );

  static const String name = 'HabitRoute';

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
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SincePage]
class SinceRoute extends PageRouteInfo<void> {
  const SinceRoute({List<PageRouteInfo>? children})
      : super(
          SinceRoute.name,
          initialChildren: children,
        );

  static const String name = 'SinceRoute';

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
