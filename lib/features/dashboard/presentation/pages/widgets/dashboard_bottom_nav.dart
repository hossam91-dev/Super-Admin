import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/constants/app_strings.dart';
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
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.navHome),
        BottomNavigationBarItem(icon: Icon(Icons.business_center), label: AppStrings.navFirms),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: AppStrings.navBilling),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_heart_outlined), label: AppStrings.navHealth),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: AppStrings.navSettings),
      ],
    );
  }
}

