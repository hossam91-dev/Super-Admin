import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';


class AddFirmStepper extends StatelessWidget {
  final int currentStep;

  const AddFirmStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        children: [
          Row(
            children: List.generate(3, (index) {
              return Expanded(
                child: Container(
                  height: 6,
                  margin: EdgeInsets.only(
                    right: index == 2 ? 0 : 8,
                  ),
                  decoration: BoxDecoration(
                    color: index <= currentStep
                        ? AppColors.primary
                        : AppColors.fieldBorder,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStepLabel(context.l10n.addFirmStep1, 0),
              _buildStepLabel(context.l10n.addFirmStep2, 1),
              _buildStepLabel(context.l10n.addFirmStep3, 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepLabel(String label, int index) {
    final isActive = index <= currentStep;
    return Text(
      label,
      style: TextStyle(
        color: isActive ? AppColors.primary : AppColors.textMuted,
        fontSize: 12,
        fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
      ),
    );
  }
}
