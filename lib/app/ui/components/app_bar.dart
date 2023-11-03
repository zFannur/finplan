import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../theme/app_icons.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;

  const AppAppBar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.popRoute();
        },
        icon: AppIcons.arrowBack,
      ),
      centerTitle: true,
      title: Text(name),
      actions: [
        IconButton(
          onPressed: () {
            //navigate to settings
          },
          icon: AppIcons.settings,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
