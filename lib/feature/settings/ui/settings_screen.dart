import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/const/app_local_data_keys.dart';
import 'package:finplan/app/router/app_router.dart';
import 'package:finplan/app/ui/components/app_bar.dart';
import 'package:finplan/app/ui/components/app_button.dart';
import 'package:finplan/app/ui/theme/app_colors.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/feature/operation/domain/entities/operation_entity/operation_entity.dart';
import 'package:finplan/feature/operation/ui/bloc/operation_cubit/operation_cubit.dart';
import 'package:finplan/feature/settings/ui/bloc/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/domain/state/categories/categories_cubit.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryCubit = context.read<CategoriesCubit>();
    final route = context.router;
    return Scaffold(
      appBar: const AppAppBar(
        name: 'Настройки',
        withSettings: false,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppButton(
                isFixedSize: false,
                onPressed: () {
                  categoryCubit.getAllCategories();
                  route.push(const CategoriesEditRoute());
                },
                child: const Text(
                  'Редактировать категории',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bold14,
                )),
            const ImportExportWidget(),
          ],
        ),
      ),
    );
  }
}

class ImportExportWidget extends StatelessWidget {
  const ImportExportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppButton(
          isFixedSize: false,
          onPressed: () {
            context.read<SettingsCubit>().saveToCsv();
          },
          child: const Text(
            'Сохранить данные',
            textAlign: TextAlign.center,
            style: AppTextStyle.bold14,
          ),
        ),
        AppButton(
          isFixedSize: false,
          onPressed: () async {
            final List<OperationEntity> data =
                await context.read<SettingsCubit>().loadCsvFromStorage();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => _PreloadDataScreen(data: data),
              ),
            );
          },
          child: const Text(
            'Загрузить данные',
            textAlign: TextAlign.center,
            style: AppTextStyle.bold14,
          ),
        ),
      ],
    );
  }
}

class _PreloadDataScreen extends StatelessWidget {
  final List<OperationEntity> data;

  const _PreloadDataScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        name: 'Содержание',
        withSettings: false,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  data[index].sum.toString(),
                  style: AppTextStyle.medium14,
                ),
                Text(
                  data[index].category,
                  style: AppTextStyle.medium14,
                ),
                Text(
                  data[index].underCategory,
                  style: AppTextStyle.medium14,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SettingsCubit>().saveData(data);
          context.read<OperationCubit>().getOperation();
          context.pushRoute(const FinanceRoute());
        },
        child: const Icon(
          Icons.save,
          color: AppColors.orange,
        ),
      ),
    );
  }
}
