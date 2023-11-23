import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/domain/entities/category_entity.dart';
import 'package:finplan/app/ui/theme/app_icons.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/app/ui/theme/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/domain/state/categories/categories_cubit.dart';
import '../../../app/router/app_router.dart';
import '../../../app/ui/theme/app_colors.dart';
import 'bloc/operation_cubit/operation_cubit.dart';
import 'components/operations_builder.dart';

@RoutePage()
class OperationPage extends StatelessWidget {
  const OperationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: AppPadding.top18,
            child: Container(
              padding: AppPadding.all16,
              color: AppColors.greyDark,
              child: const Column(
                children: [
                  Text(
                    'Общая сумма',
                    style: AppTextStyle.bold14,
                  ),
                  Text(
                    '1 000 000 000 р',
                    style: AppTextStyle.bold24,
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: AppPadding.top18,
              child: OperationsBuilder(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushRoute(
            OperationDetailRoute(
              buttonIcon: Icons.add,
              onTap: (operationEntity) {
                context.read<OperationCubit>().addOperation(operationEntity);
                context.read<CategoriesCubit>().add(
                      name: operationEntity.category,
                      categoryType: CategoryType.category,
                    );
                context.read<CategoriesCubit>().add(
                  name: operationEntity.category,
                  categoryType: CategoryType.underCategory,
                );
                context.popRoute();
              },
              title: 'Добавить',
            ),
          );
        },
        child: AppIcons.add,
      ),
    );
  }
}
