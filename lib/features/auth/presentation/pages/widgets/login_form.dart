import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';

import 'package:firm_super_admin/core/utils/validators.dart';
import 'package:firm_super_admin/core/widgets/custom_elevated_button.dart';
import 'package:firm_super_admin/core/widgets/custom_text_form_field.dart';
import 'package:firm_super_admin/features/auth/presentation/cubit/login_cubit.dart';
import 'package:firm_super_admin/features/auth/presentation/cubit/login_state.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? errorMessage;
  final bool isLoading;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    this.errorMessage,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            
            CustomTextFormField(
              controller: emailController,
              hintText: context.l10n.emailHint,
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: AppColors.textMuted,
              ),
              keyboardType: TextInputType.emailAddress,
              validator: Validators.validateEmail,
            ),
            const SizedBox(height: 20),

            
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) => current is LoginVisibilityChanged,
              builder: (context, state) {
                return CustomTextFormField(
                  controller: passwordController,
                  hintText: context.l10n.passwordHint,
                  obscureText: !cubit.isPasswordVisible,
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.textMuted,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      cubit.isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.textMuted,
                    ),
                    onPressed: () {
                      cubit.togglePasswordVisibility();
                    },
                  ),
                  validator: Validators.validatePassword,
                  errorText: errorMessage,
                );
              },
            ),

            
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(context.l10n.forgotPassword,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            
            CustomElevatedButton(
              text: context.l10n.signIn,
              isLoading: isLoading,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  cubit.login(
                    emailController.text,
                    passwordController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

