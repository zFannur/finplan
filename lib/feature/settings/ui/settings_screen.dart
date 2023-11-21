import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
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

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        name: 'Настройки',
        withSettings: false,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppButton(
              onPressed: () {
                context.read<SettingsCubit>().saveToCsv();
              },
              child: const Text(
                'Сохранить данные',
                style: AppTextStyle.bold14,
              ),
            ),
            AppButton(
              onPressed: () async {
                final List<OperationEntity> data =
                    await context.read<SettingsCubit>().loadCsvFromStorage();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(),
                      body: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(data[index].id.toString()),
                                Text(data[index].category),
                                Text(data[index].underCategory),
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
                        child: const Icon(Icons.save, color: AppColors.orange,),
                      ),
                    ),
                  ),
                );
              },
              child: const Text(
                'Загрузить данные',
                style: AppTextStyle.bold14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
