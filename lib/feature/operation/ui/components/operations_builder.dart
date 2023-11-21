import 'package:finplan/app/ui/components/app_text_field.dart';
import 'package:finplan/app/ui/theme/consts.dart';
import 'package:finplan/feature/operation/ui/bloc/operation_cubit/operation_cubit.dart';
import 'package:finplan/feature/operation/ui/bloc/operation_filter_cubit/operation_filter_cubit.dart';
import 'package:finplan/feature/operation/ui/components/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/domain/error_entity/error_entity.dart';
import '../../../../app/ui/components/app_loader.dart';
import '../../../../app/ui/components/app_snack_bar.dart';
import '../../../../app/ui/theme/app_text_style.dart';
import 'operation_per_day.dart';

enum PageType { all, week, month, search }

class OperationsBuilder extends StatefulWidget {
  const OperationsBuilder({super.key});

  @override
  State<OperationsBuilder> createState() => _OperationsBuilderState();
}

class _OperationsBuilderState extends State<OperationsBuilder> {
  PageType _currentPage = PageType.all;

  void onSelectedPage(PageType type) {
    if (_currentPage == type) return;
    setState(() {
      _currentPage = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextButton(
              currentPage: _currentPage,
              selectedPage: PageType.all,
              name: 'Все',
              onTap: () {
                if (_currentPage == PageType.all) return;
                onSelectedPage(PageType.all);
                context.read<OperationCubit>().getOperation();
              },
            ),
            CustomTextButton(
              currentPage: _currentPage,
              selectedPage: PageType.week,
              name: 'Неделя',
              onTap: () {
                onSelectedPage(PageType.week);
              },
            ),
            CustomTextButton(
              currentPage: _currentPage,
              selectedPage: PageType.month,
              name: 'Месяц',
              onTap: () {
                onSelectedPage(PageType.month);
              },
            ),
            CustomTextButton(
              currentPage: _currentPage,
              selectedPage: PageType.search,
              name: 'Поиск',
              onTap: () {
                onSelectedPage(PageType.search);
              },
            ),
          ],
        ),
        Visibility(
          visible: _currentPage == PageType.search,
          child: Padding(
            padding: AppPadding.v10h40,
            child: AppTextField(
              labelText: 'Поиск',
              onChanged: (query) {
                context
                    .read<OperationFilterCubit>()
                    .filterOperationSearch(query);
              },
            ),
          ),
        ),
        Expanded(
          child: BlocConsumer<OperationFilterCubit, OperationFilterState>(
            listener: (context, state) {
              // if (state.asyncSnapshot?.hasData == true) {
              //   AppSnackBar.showSnackBarWithMessage(
              //     context,
              //     state.asyncSnapshot?.data,
              //   );
              // }

              if (state.asyncSnapshot?.hasError == true) {
                AppSnackBar.showSnackBarWithError(
                  context,
                  ErrorEntity.fromException(state.asyncSnapshot?.error),
                );
              }
            },
            builder: (context, state) {
              if (state.asyncSnapshot?.connectionState ==
                  ConnectionState.waiting) {
                return const AppLoader();
              }

              if (state.mapByDay != null) {
                return ListView.builder(
                    itemCount: state.mapByDay!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OperationsPerDay(
                        date: state.mapByDay!.keys.elementAt(index),
                        listOperations:
                        state.mapByDay!.values.elementAt(index),
                      );
                    });
              }

              return const Text(
                "Нету операции",
                style: AppTextStyle.bold24,
              );
            },
          ),
        ),
      ],
    );
  }
}
