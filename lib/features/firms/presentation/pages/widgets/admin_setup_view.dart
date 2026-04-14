import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';

import 'package:firm_super_admin/core/enums/enums.dart';
import 'package:firm_super_admin/core/widgets/custom_text_form_field.dart';
import '../../cubit/add_firm_cubit.dart';
import '../../cubit/add_firm_state.dart';

class AdminSetupView extends StatelessWidget {
  const AdminSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFirmCubit, AddFirmState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoBanner(context),
              const SizedBox(height: 32),

              _buildLabel(context.l10n.adminFullNameLabel),
              CustomTextFormField(
                hintText: context.l10n.adminFullNameHint,
                initialValue: state.adminName,
                onChanged: (val) => context.read<AddFirmCubit>().updateAdminName(val),
              ),
              const SizedBox(height: 24),

              _buildLabel(context.l10n.adminEmailLabel),
              CustomTextFormField(
                hintText: context.l10n.adminEmailHint,
                initialValue: state.adminEmail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) => context.read<AddFirmCubit>().updateAdminEmail(val),
              ),
              const SizedBox(height: 32),

              Text(
                context.l10n.passwordSetupTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 16),

              _buildOptionTile(
                context: context,
                method: PasswordMethod.setupEmail,
                title: context.l10n.passwordMethodEmailTitle,
                subtitle: context.l10n.passwordMethodEmailSubtitle,
                selectedMethod: state.passwordMethod,
              ),
              const SizedBox(height: 12),

              _buildOptionTile(
                context: context,
                method: PasswordMethod.manual,
                title: context.l10n.passwordMethodManualTitle,
                subtitle: context.l10n.passwordMethodManualSubtitle,
                selectedMethod: state.passwordMethod,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_rounded, color: AppColors.primary, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              context.l10n.adminSetupNotice,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textDark,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required BuildContext context,
    required PasswordMethod method,
    required String title,
    required String subtitle,
    required PasswordMethod selectedMethod,
  }) {
    final isSelected = method == selectedMethod;

    return GestureDetector(
      onTap: () => context.read<AddFirmCubit>().updatePasswordMethod(method),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.fieldBorder,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.textMuted,
                  width: 2,
                ),
                color: isSelected ? Colors.white : Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
