import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';

import 'package:firm_super_admin/core/enums/enums.dart';
import 'package:firm_super_admin/core/widgets/custom_elevated_button.dart';
import '../../cubit/add_firm_cubit.dart';
import '../../cubit/add_firm_state.dart';

class AddFirmBottomNav extends StatelessWidget {
  final AddFirmState state;

  const AddFirmBottomNav({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: state.currentStep == 0 || state.status == AddFirmStatus.loading
                  ? null
                  : () => context.read<AddFirmCubit>().previousStep(),
              child: Text(
                context.l10n.back,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: CustomElevatedButton(
              onPressed: state.status == AddFirmStatus.loading
                  ? null
                  : () {
                      if (state.currentStep < 2) {
                        context.read<AddFirmCubit>().nextStep();
                      } else {
                        context.read<AddFirmCubit>().createFirm();
                      }
                    },
              isLoading: state.status == AddFirmStatus.loading,
              text: state.currentStep == 2
                  ? context.l10n.createFirmButton
                  : context.l10n.next,
            ),
          ),
        ],
      ),
    );
  }
}
