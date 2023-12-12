import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/di/init_di.dart';
import 'package:finplan/app/ui/components/app_bar.dart';
import 'package:finplan/app/ui/theme/app_colors.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:finplan/app/ui/theme/consts.dart';
import 'package:finplan/feature/experience/data/data_source/habit_local_data_source.dart';
import 'package:finplan/feature/experience/domain/entity/habit_entity.dart';
import 'package:finplan/feature/experience/ui/bloc/habit_cubit/habit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/data/data_source/app_categories_local_data_source.dart';
import 'components/CustomTextField.dart';

@RoutePage()
class HabitDetailScreen extends StatefulWidget {
  final Function(HabitEntity habitEntity) onTap;
  final HabitEntity? habitEntity;

  const HabitDetailScreen({
    super.key,
    required this.onTap,
    this.habitEntity,
  });

  @override
  State<HabitDetailScreen> createState() => _HabitDetailScreenState();
}

class _HabitDetailScreenState extends State<HabitDetailScreen> {
  final formKey = GlobalKey<FormState>();

  final controllerName = TextEditingController();
  final controllerTriggers = TextEditingController();
  final controllerAwards = TextEditingController();
  final controllerMotivation = TextEditingController();
  late Map<String, List<String>> dependenceFor;
  late Map<String, List<String>> dependenceOn;
  late int repeatsDay;
  late int duration;

  @override
  void initState() {
    //context.read<HabitCubit>().getHabit();
    repeatsDay = widget.habitEntity?.repeatsDay ?? 1;
    duration = widget.habitEntity?.duration ?? 21;
    if (widget.habitEntity != null) {
      controllerName.text = widget.habitEntity?.name ?? "";
      controllerMotivation.text = widget.habitEntity?.motivation ?? "";
      controllerTriggers.text = widget.habitEntity?.triggers ?? "";
      controllerAwards.text = widget.habitEntity?.awards ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    //locator.get<AppCategoriesLocalDataSource>().close();
    controllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
          name: widget.habitEntity != null ? 'Редактировать' : 'Добавить'),
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
                    CustomTextField(
                      controller: controllerName,
                      labelText: 'Назовите привычку *',
                      name: 'Название *',
                      validator: emptyValidator,
                    ),
                    CustomTextField(
                      controller: controllerTriggers,
                      labelText: 'После привычка выполняется *',
                      name: 'Триггеры *',
                      validator: emptyValidator,
                    ),
                    CustomTextField(
                      controller: controllerAwards,
                      labelText: 'Награда за выполняется *',
                      name: 'Награда *',
                      validator: emptyValidator,
                    ),
                    CustomTextField(
                      controller: controllerMotivation,
                      labelText: 'Краткая мотивация',
                      name: 'Для чего? *',
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
                      onTapAdd: () {
                        repeatsDay++;
                        setState(() {});
                      },
                      onTapRemove: () {
                        if (repeatsDay <= 0) return;
                        repeatsDay--;
                        setState(() {});
                      },
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
                      onTapAdd: () {
                        duration++;
                        setState(() {});
                      },
                      onTapRemove: () {
                        if (duration <= 0) return;
                        duration--;
                        setState(() {});
                      },
                    ),
                    const Padding(
                      padding: AppPadding.top8,
                      child: Text(
                        'Напоминание',
                        style: AppTextStyle.bold24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.orange,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.greyDark,
                        shape: const RoundedRectangleBorder(),
                      ),
                    ),
                    const Padding(
                      padding: AppPadding.top8,
                      child: Text(
                        'Зависит от',
                        style: AppTextStyle.bold24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.orange,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.greyDark,
                        shape: const RoundedRectangleBorder(),
                      ),
                    ),
                    const Padding(
                      padding: AppPadding.top8,
                      child: Text(
                        'Зависимость для',
                        style: AppTextStyle.bold24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.orange,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.greyDark,
                        shape: const RoundedRectangleBorder(),
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
                context
                    .read<HabitCubit>()
                    .deleteHabit(widget.habitEntity!);
                context.popRoute();
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
                      locator.get<HabitLocalDataSource>().getNewId(),
                  name: controllerName.text,
                  motivation: controllerMotivation.text,
                  repeatsDay: repeatsDay,
                  duration: duration,
                  triggers: controllerTriggers.text,
                  awards: controllerAwards.text,
                ));
              }
            },
            child: Icon(
              widget.habitEntity != null ? Icons.edit : Icons.add,
              color: AppColors.orange,
            ),
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
