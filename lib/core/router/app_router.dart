import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firm_super_admin/features/auth/presentation/pages/login_screen.dart';
import 'package:firm_super_admin/features/dashboard/presentation/pages/dashboard_screen.dart';

class AppRouter {
  static const String loginPath = '/login';
  static const String dashboardPath = '/dashboard';

  static final GoRouter router = GoRouter(
    initialLocation: loginPath,
    routes: [
      GoRoute(
        path: loginPath,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: dashboardPath,
        builder: (context, state) => const DashboardScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
}

