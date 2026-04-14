import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';

import 'package:firm_super_admin/core/enums/enums.dart';
import '../../cubit/add_firm_cubit.dart';
import '../../cubit/add_firm_state.dart';

class PlanSelectionView extends StatelessWidget {
  const PlanSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFirmCubit, AddFirmState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.choosePlanTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                context.l10n.choosePlanSubtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 24),

              _buildBillingToggle(context, state.billingCycle),
              const SizedBox(height: 24),

              _buildPlanCard(
                context: context,
                plan: FirmPlan.basic,
                title: context.l10n.planBasicTitle,
                price: context.l10n.planBasicPrice,
                description: context.l10n.planBasicDesc,
                features: [
                  'Up to 5 Users',
                  '100 Active Cases',
                  '5GB Secure Storage'
                ],
                selectedPlan: state.selectedPlan,
              ),
              const SizedBox(height: 16),

              _buildPlanCard(
                context: context,
                plan: FirmPlan.pro,
                title: context.l10n.planProTitle,
                price: context.l10n.planProPrice,
                oldPrice: context.l10n.planProOldPrice,
                description: context.l10n.planProDesc,
                features: [
                  'Up to 20 Users',
                  'Unlimited Active Cases',
                  '20GB Secure Storage'
                ],
                isPopular: true,
                selectedPlan: state.selectedPlan,
              ),
              const SizedBox(height: 16),

              _buildPlanCard(
                context: context,
                plan: FirmPlan.enterprise,
                title: context.l10n.planEnterpriseTitle,
                price: context.l10n.planEnterprisePrice,
                description: context.l10n.planEnterpriseDesc,
                features: [
                  'Unlimited Users',
                  'Unlimited Everything',
                  '100GB Secure Storage'
                ],
                selectedPlan: state.selectedPlan,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBillingToggle(BuildContext context, BillingCycle cycle) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.fieldBackground,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildToggleButton(
              context.l10n.billingMonthly,
              isActive: cycle == BillingCycle.monthly,
              onTap: () => context.read<AddFirmCubit>().toggleBillingCycle(BillingCycle.monthly),
            ),
            _buildToggleButton(
              context.l10n.billingAnnual,
              isActive: cycle == BillingCycle.annual,
              onTap: () => context.read<AddFirmCubit>().toggleBillingCycle(BillingCycle.annual),
              badge: context.l10n.billingSaveBadge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, {required bool isActive, required VoidCallback onTap, String? badge}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : [],
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.primary : AppColors.textMuted,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (badge != null) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required BuildContext context,
    required FirmPlan plan,
    required String title,
    required String price,
    String? oldPrice,
    required String description,
    required List<String> features,
    bool isPopular = false,
    required FirmPlan selectedPlan,
  }) {
    final isSelected = plan == selectedPlan;

    return GestureDetector(
      onTap: () => context.read<AddFirmCubit>().selectPlan(plan),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.fieldBorder,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
                if (isPopular)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      context.l10n.planMostPopular,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    context.l10n.planPriceSuffix,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
                if (oldPrice != null) ...[
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      oldPrice,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textMuted,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 16),
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.primary,
                        size: 18,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        feature,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
