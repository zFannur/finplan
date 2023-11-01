import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/domain/state/categories/categories_cubit.dart';
import 'package:finplan/app/ui/app_loader.dart';
import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/router/app_router.dart';
import '../domain/operation_state/operation_cubit.dart';

@RoutePage()
class OperationPage extends StatelessWidget {
  const OperationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationCubit, OperationState>(
      builder: (context, state) {
        return state.when(
          init: () => const AppLoader(),
          loaded: (operationList) {
            return ListView.builder(
              itemCount: operationList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    context.pushRoute(
                      OperationDetailRoute(
                        operation: operationList[index],
                        buttonIcon: Icons.edit,
                        onTap: (operationEntity) {
                          context
                              .read<OperationCubit>()
                              .editOperation(operationEntity);

                          context.read<CategoriesCubit>().add(
                                form: operationEntity.form,
                                note: operationEntity.note,
                              );
                          context.popRoute();
                        },
                        title: 'Редактирование',
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: operationList[index].type == TypeOperation.expense
                          ? Colors.red.shade100
                          : Colors.green.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            operationList[index].date,
                            maxLines: 1,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                operationList[index].form,
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(operationList[index].note),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(operationList[index].sum.toString()),
                        ),
                        Expanded(
                          flex: 0,
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<OperationCubit>()
                                  .deleteOperation(operationList[index]);
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const AppLoader(),
          error: (error) => Center(
            child: Text(error.toString()),
          ),
        );
      },
    );
  }
}
