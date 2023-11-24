import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/ui/theme/app_icons.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SincePage extends StatelessWidget {
  const SincePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: '2',
        onPressed: () {
          // context.pushRoute(
          //   OperationDetailRoute(
          //     buttonIcon: Icons.add,
          //     onTap: (operationEntity) {
          //       context.read<OperationCubit>().addOperation(operationEntity);
          //       context.read<CategoriesCubit>().add(
          //             name: operationEntity.category,
          //             categoryType: CategoryType.category,
          //           );
          //       context.read<CategoriesCubit>().add(
          //             name: operationEntity.category,
          //             categoryType: CategoryType.underCategory,
          //           );
          //       context.popRoute();
          //     },
          //     title: 'Добавить',
          //   ),
          // );
        },
        child: AppIcons.add,
      ),
    );
  }
}
