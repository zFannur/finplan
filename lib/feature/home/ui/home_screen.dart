import 'package:auto_route/auto_route.dart';
import 'package:finplan/feature/operation/domain/state/operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/router/app_router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        OperationRoute(),
        StatisticRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          drawer: const Drawer(),
          appBar: AppBar(
            centerTitle: true,
            title: _title(),
            actions: _actions(),
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu), label: "Операции"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.stacked_bar_chart), label: "Статистика"),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.pushRoute(OperationDetailRoute(
                buttonIcon: Icons.add,
                onTap: (operationEntity) {
                  context.read<OperationCubit>().addOperation(operationEntity);
                  context.popRoute();
                },
                title: 'Добавить',
              ),);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget _title() {
    return const Row(
      children: [
        Icon(Icons.ac_unit),
        SizedBox(width: 10),
        Text('Фин План'),
      ],
    );
  }

  List<Widget> _actions() {
    return [
      Stack(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.downloading),
          ),
          Positioned(
            left: 25,
            top: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              height: 18,
              width: 18,
              child: const Text(
                '9',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }
}
