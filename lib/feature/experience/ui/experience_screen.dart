import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/ui/components/app_bar.dart';
import 'package:flutter/material.dart';

import '../../../app/router/app_router.dart';

@RoutePage()
class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HabitRoute(),
        SinceRoute(),
        ExperienceStatisticRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: const AppAppBar(name: 'Опыт'),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu, size: 0),
                label: "Привычки",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu, size: 0),
                label: "Навыки",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu, size: 0),
                label: "Статистика",
              ),
            ],
          ),
        );
      },
    );
  }
}