import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';

import 'package:firm_super_admin/core/router/app_router.dart';

class DashboardAppBarHelper {
  static String getTitle(int index, BuildContext context) {
    switch (index) {
      case 0:
        return context.l10n.navHome;
      case 1:
        return context.l10n.navFirms;
      case 2:
        return context.l10n.navBilling;
      case 3:
        return context.l10n.navHealth;
      case 4:
        return context.l10n.navSettings;
      default:
        return '';
    }
  }

  static List<Widget> getActions(int index, BuildContext context) {
    return [
      if (index == 1)
        _buildAddAction(context)
      else
        _buildNotificationAction(context),
      const SizedBox(width: 8),
    ];
  }

  static Widget _buildAddAction(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.add,
        color: AppColors.primary,
      ),
      onPressed: () {
        context.push(AppRouter.addFirmPath);
      },
    );
  }

  static Widget _buildNotificationAction(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            color: AppColors.primary,
          ),
          onPressed: () {},
        ),
        Positioned(
          right: 3,
          top: 3,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            constraints: const BoxConstraints(minWidth: 16, minHeight: 10),
            child: const Text(
              '3',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
