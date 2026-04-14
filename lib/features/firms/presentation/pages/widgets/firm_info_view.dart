import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';

import 'package:firm_super_admin/core/widgets/custom_text_form_field.dart';
import '../../cubit/add_firm_cubit.dart';
import '../../cubit/add_firm_state.dart';

class FirmInfoView extends StatelessWidget {
  const FirmInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: BlocBuilder<AddFirmCubit, AddFirmState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel(context.l10n.firmNameLabel, isRequired: true),
              CustomTextFormField(
                hintText: context.l10n.firmNameHint,
                initialValue: state.firmName,
                onChanged: (val) => context.read<AddFirmCubit>().updateFirmName(val),
              ),
              const SizedBox(height: 24),

              _buildLabel(context.l10n.subdomainLabel),
              CustomTextFormField(
                hintText: context.l10n.subdomainHint,
                initialValue: state.subdomain,
                onChanged: (val) => context.read<AddFirmCubit>().updateSubdomain(val),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 12.0),
                  child: Text(
                    context.l10n.subdomainSuffix,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              if (state.subdomain.isNotEmpty) ...[
                const SizedBox(height: 8),
                _buildAvailabilityBadge(context, state.isSubdomainAvailable),
              ],
              // const SizedBox(height: 24),
              //
              // _buildLabel(context.l10n.countryLabel),
              // _buildDropdown(
              //   value: state.country,
              //   onChanged: (val) => context.read<AddFirmCubit>().updateCountry(val!),
              //   items: [context.l10n.countryDefault, 'Egypt', 'United Kingdom', 'United Arab Emirates'],
              // ),
              const SizedBox(height: 24),

              _buildLabel(context.l10n.cityLabel),
              CustomTextFormField(
                hintText: context.l10n.cityHint,
                initialValue: state.city,
                onChanged: (val) => context.read<AddFirmCubit>().updateCity(val),
              ),
              const SizedBox(height: 24),

              _buildLabel(context.l10n.contactEmailLabel),
              CustomTextFormField(
                hintText: context.l10n.contactEmailHint,
                initialValue: state.contactEmail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) => context.read<AddFirmCubit>().updateContactEmail(val),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLabel(String label, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          children: isRequired
              ? [
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ]
              : [],
        ),
      ),
    );
  }

  Widget _buildAvailabilityBadge(BuildContext context, bool available) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: available ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            available ? Icons.check : Icons.close,
            size: 14,
            color: available ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 4),
          Text(
            available ? context.l10n.available : context.l10n.unavailable,
            style: TextStyle(
              color: available ? Colors.green : Colors.red,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.fieldBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.fieldBorder),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.unfold_more_rounded, color: AppColors.textMuted),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

// Extension to add initialValue support to CustomTextFormField if it doesn't have it
// Alternatively, I should update the original widget.
// Actually, I'll update custom_text_form_field.dart to support initialValue.
