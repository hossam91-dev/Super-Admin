import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';

import 'package:firm_super_admin/core/constants/app_colors.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            context.l10n.greeting,
          style: const TextStyle(
            color: AppColors.textDark,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
            context.l10n.date,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

