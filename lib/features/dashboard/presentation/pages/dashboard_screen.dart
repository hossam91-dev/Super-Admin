import 'package:firm_super_admin/core/constants/app_colors.dart';
import 'package:firm_super_admin/core/widgets/custom_buttom_nav_bar.dart';
import 'package:firm_super_admin/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:firm_super_admin/features/dashboard/presentation/cubit/main_nav_cubit.dart';
import 'package:firm_super_admin/features/dashboard/presentation/pages/widgets/dashboard_app_bar.dart';
import 'package:firm_super_admin/features/dashboard/presentation/pages/widgets/dashboard_content.dart';
import 'package:firm_super_admin/features/firms/presentation/pages/firms_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DashboardCubit()..fetchDashboardData()),
        BlocProvider(create: (_) => MainNavCubit()),
      ],
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  static const _pages = [
    DashboardContent(),
    FirmsScreen(),
    Center(child: Text("Billing")),
    Center(child: Text("Health")),
    Center(child: Text("Settings")),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<MainNavCubit>().state;

    return Scaffold(
      backgroundColor: AppColors.fieldBackground,
      appBar: DashboardAppBar(index: currentIndex),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: currentIndex,
        onItemTapped: context.read<MainNavCubit>().changeIndex,
      ),
      body: IndexedStack(index: currentIndex, children: _pages),
    );
  }
}
