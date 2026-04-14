import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';
import 'package:firm_super_admin/core/enums/enums.dart';

class FirmsFilterChips extends StatelessWidget {
  final FirmStatus? selectedFilter;
  final Function(FirmStatus?) onFilterChanged;

  const FirmsFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<({FirmStatus? status, String label})> filters = [
      (status: null, label: context.l10n.filterAll),
      (status: FirmStatus.active, label: context.l10n.filterActive),
      (status: FirmStatus.trial, label: context.l10n.filterTrial),
      (status: FirmStatus.suspended, label: context.l10n.filterSuspended),
    ];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: filters.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilter == filter.status;

          return GestureDetector(
            onTap: () => onFilterChanged(filter.status),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  filter.label,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey.shade600,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
