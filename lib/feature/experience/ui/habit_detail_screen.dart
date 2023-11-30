import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/di/init_di.dart';
import 'package:finplan/app/ui/components/app_bar.dart';
import 'package:finplan/app/ui/components/app_text_field.dart';
import 'package:finplan/app/ui/theme/app_colors.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/app/ui/theme/consts.dart';
import 'package:finplan/feature/experience/domain/entity/habit_entity.dart';
import 'package:flutter/material.dart';
import '../../../app/data/data_source/app_categories_local_data_source.dart';
import '../../operation/data/data_source/opeartion_local_data_source.dart';

@RoutePage()
class HabitDetailScreen extends StatefulWidget {
  final String title;
  final IconData buttonIcon;
  final Function(HabitEntity habitEntity) onTap;
  final HabitEntity? habitEntity;

  const HabitDetailScreen({
    super.key,
    required this.buttonIcon,
    required this.onTap,
    required this.title,
    this.habitEntity,
  });

  @override
  State<HabitDetailScreen> createState() => _HabitDetailScreenState();
}

class _HabitDetailScreenState extends State<HabitDetailScreen> {
  final formKey = GlobalKey<FormState>();

  final controllerName = TextEditingController();
  final controllerWhy = TextEditingController();
  late String category;
  late int repeatsDay;
  late int duration;

  @override
  void initState() {
    category = widget.habitEntity?.category ?? "Выбрать категорию";
    repeatsDay = widget.habitEntity?.repeatsDay ?? 1;
    duration = widget.habitEntity?.duration ?? 21;
    if (widget.habitEntity != null) {
      controllerName.text = widget.habitEntity?.category ?? "";
      controllerWhy.text = widget.habitEntity?.why ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    locator.get<AppCategoriesLocalDataSource>().close();
    controllerName.dispose();
    controllerWhy.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(name: widget.title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: AppPadding.v10h40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Название *',
                      style: AppTextStyle.bold24,
                    ),
                    AppTextField(
                      labelText: 'Названовите привычку',
                      controller: controllerName,
                      validator: emptyValidator,
                    ),
                    const Padding(
                      padding: AppPadding.top8,
                      child: Text(
                        'Почему? *',
                        style: AppTextStyle.bold24,
                      ),
                    ),
                    AppTextField(
                      labelText: 'Краткая мотивация',
                      controller: controllerWhy,
                      validator: emptyValidator,
                    ),
                    const Padding(
                      padding: AppPadding.top8,
                      child: Text(
                        'Повторов в день',
                        style: AppTextStyle.bold24,
                      ),
                    ),
                    CounterWidget(
                      countNum: repeatsDay,
                      onTapAdd: () {},
                      onTapRemove: () {},
                    ),
                    const Padding(
                      padding: AppPadding.top8,
                      child: Text(
                        'Продолжительность',
                        style: AppTextStyle.bold24,
                      ),
                    ),
                    CounterWidget(
                      countNum: duration,
                      onTapAdd: () {},
                      onTapRemove: () {},
                    ),
                    const Padding(
                      padding: AppPadding.top8,
                      child: Text(
                        'Напоминание',
                        style: AppTextStyle.bold24,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        color: AppColors.greyDark,
                        padding: AppPadding.v10h20,
                        child: Text(
                          category,
                          style: AppTextStyle.bold24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: widget.habitEntity != null,
            child: FloatingActionButton(
              heroTag: '1',
              onPressed: () {
                // context
                //     .read<OperationCubit>()
                //     .deleteOperation(widget.habitEntity!);
                // context.popRoute();
              },
              child: const Icon(
                Icons.delete,
                color: AppColors.orange,
              ),
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              if (formKey.currentState?.validate() == true) {
                widget.onTap(HabitEntity(
                  id: widget.habitEntity?.id ??
                      locator.get<OperationLocalDataSource>().getNewId(),
                  name: controllerName.text,
                  why: controllerWhy.text,
                  repeatsDay: 1,
                  duration: 21,
                  category: '',
                ));
              }
            },
            child: Icon(widget.buttonIcon, color: AppColors.orange),
          ),
        ],
      ),
    );
  }

  String? emptyValidator(String? value) {
    if (value?.isEmpty == true) {
      return "обязательное поле";
    }
    return null;
  }
}

class CounterWidget extends StatelessWidget {
  final int countNum;
  final Function() onTapAdd;
  final Function() onTapRemove;

  const CounterWidget({
    super.key,
    required this.countNum,
    required this.onTapAdd,
    required this.onTapRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onTapAdd,
          icon: const Icon(
            Icons.add,
            color: AppColors.orange,
          ),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.greyDark,
            shape: const RoundedRectangleBorder(),
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: AppColors.greyDark,
          padding: AppPadding.v10h20,
          child: Text(
            '$countNum',
            style: AppTextStyle.bold24,
          ),
        ),
        IconButton(
          onPressed: onTapRemove,
          icon: const Icon(
            Icons.remove,
            color: AppColors.orange,
          ),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.greyDark,
            shape: const RoundedRectangleBorder(),
          ),
        ),
      ],
    );
  }
}
