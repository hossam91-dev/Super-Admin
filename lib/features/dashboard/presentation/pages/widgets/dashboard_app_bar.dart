import 'package:firm_super_admin/features/dashboard/presentation/pages/widgets/dashboard_app_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';

import 'package:firm_super_admin/core/constants/app_colors.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int index;
  const DashboardAppBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        DashboardAppBarHelper.getTitle(index, context),
        style: TextStyle(
          color: AppColors.textDark,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: DashboardAppBarHelper.getActions(index, context),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
