import 'package:firm_super_admin/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:firm_super_admin/core/router/app_router.dart';
import 'package:firm_super_admin/core/theme/app_theme.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:firm_super_admin/features/dashboard/presentation/cubit/locale_cubit.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => LocaleCubit(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => context.l10n.appName,
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: AppRouter.router,
          theme: AppTheme.darkTheme,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        );
      },
    );
  }
}
