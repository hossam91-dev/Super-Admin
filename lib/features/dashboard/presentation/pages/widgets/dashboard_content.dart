import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firm_super_admin/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:firm_super_admin/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:firm_super_admin/features/dashboard/presentation/pages/widgets/dashboard_header.dart';
import 'package:firm_super_admin/features/dashboard/presentation/pages/widgets/stat_card.dart';
import 'package:firm_super_admin/features/dashboard/presentation/pages/widgets/attention_list.dart';
import 'package:firm_super_admin/features/dashboard/presentation/pages/widgets/recent_firms_list.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DashboardLoaded) {
          return CustomScrollView(
            slivers: [
              const SliverPadding(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 8),
                sliver: SliverToBoxAdapter(
                  child: DashboardHeader(),
                ),
              ),
              
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    itemCount: state.stats.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 16),
                    itemBuilder: (context, index) => StatCard(model: state.stats[index]),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                sliver: SliverToBoxAdapter(
                  child: AttentionList(items: state.needsAttention),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                sliver: SliverToBoxAdapter(
                  child: RecentFirmsList(items: state.recentFirms),
                ),
              ),
            ],
          );
        }

        if (state is DashboardError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
