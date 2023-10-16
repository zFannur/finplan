import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/router/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.pushRoute(HomeRoute());
          },
          child: Text('home'),
        ),
      ),
    );
  }
}
