import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';

import 'package:firm_super_admin/core/constants/app_colors.dart';

class DashboardBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const DashboardBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 8,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      items: [
        BottomNavigationBarItem(icon: const Icon(Icons.home), label: context.l10n.navHome),
        BottomNavigationBarItem(icon: const Icon(Icons.business_center), label: context.l10n.navFirms),
        BottomNavigationBarItem(icon: const Icon(Icons.account_balance_wallet_outlined), label: context.l10n.navBilling),
        BottomNavigationBarItem(icon: const Icon(Icons.monitor_heart_outlined), label: context.l10n.navHealth),
        BottomNavigationBarItem(icon: const Icon(Icons.settings_outlined), label: context.l10n.navSettings),
      ],
    );
  }
}

