import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/constants/app_strings.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.greeting,
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          AppStrings.date,
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

