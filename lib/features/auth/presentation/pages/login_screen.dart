import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:firm_super_admin/core/router/app_router.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';

import 'package:firm_super_admin/features/auth/presentation/cubit/login_cubit.dart';
import 'package:firm_super_admin/features/auth/presentation/cubit/login_state.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';
import 'widgets/language_switcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                context.pushReplacement(AppRouter.dashboardPath);
              }
            },
            builder: (context, state) {
              String? errorMessage;
              if (state is LoginError) {
                errorMessage = state.message;
              }

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: const LanguageSwitcher(),
                      ),
                      const SizedBox(height: 12),

                      const LoginHeader(),
                      const SizedBox(height: 48),

                      LoginForm(
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        errorMessage: errorMessage,
                        isLoading: state is LoginLoading,
                      ),

                      const SizedBox(height: 40),

                      Text(
                        context.l10n.version,
                        style: TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
