import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';
import '../../data/models/dashboard_models.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  void fetchDashboardData() async {
    emit(DashboardLoading());

    await Future.delayed(const Duration(milliseconds: 800));

    emit(
      DashboardLoaded(
        stats: [
          StatModel(
            title: 'TOTAL FIRMS',
            count: '47',
            subtitle: '+3 this month',
            icon: Icons.business_center_rounded,
            iconColor: AppColors.primary,
            subtitleColor: AppColors.primary,
          ),
          StatModel(
            title: 'ACTIVE',
            count: '43',
            subtitle: 'Current state: 43',
            icon: Icons.check_circle_rounded,
            iconColor: AppColors.success,
            subtitleColor: AppColors.success,
          ),
          StatModel(
            title: 'PENDING',
            count: '12',
            subtitle: 'Requires review',
            icon: Icons.pending_actions_rounded,
            iconColor: AppColors.warning,
            subtitleColor: AppColors.warning,
          ),
        ],
        needsAttention: [
          AttentionItemModel(
            name: 'Cairo Partners',
            status: 'overdue',
            colorType: 'red',
          ),
          AttentionItemModel(
            name: 'Gulf Legal',
            status: 'trial',
            colorType: 'orange',
          ),
          AttentionItemModel(
            name: 'Delta Law',
            status: 'storage',
            colorType: 'orange',
          ),
        ],
        recentFirms: [
          RecentFirmModel(
            name: 'Cairo Partners',
            initials: 'CP',
            type: 'Enterprise',
            status: 'active',
          ),
          RecentFirmModel(
            name: 'Gulf Legal Group',
            initials: 'GL',
            type: 'Standard',
            status: 'inactive',
          ),
          RecentFirmModel(
            name: 'Aswan Energy',
            initials: 'AE',
            type: 'Pro',
            status: 'active',
          ),
        ],
      ),
    );
  }
}
