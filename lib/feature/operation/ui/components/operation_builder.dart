import 'package:finplan/feature/operation/ui/components/custom_text_button.dart';
import 'package:flutter/material.dart';

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
                onSelectedPage(PageType.all);
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
        // IndexedStack(
        //   index: _selectedPage,
        //   children: [],
        // ),
      ],
    );
  }
}
