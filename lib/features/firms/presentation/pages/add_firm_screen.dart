import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:firm_super_admin/core/enums/enums.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';

import '../cubit/add_firm_cubit.dart';
import '../cubit/add_firm_state.dart';
import 'widgets/firm_info_view.dart';
import 'widgets/plan_selection_view.dart';
import 'widgets/admin_setup_view.dart';
import 'widgets/add_firm_stepper.dart';
import 'widgets/add_firm_bottom_nav.dart';

class AddFirmScreen extends StatelessWidget {
  const AddFirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddFirmCubit(),
      child: BlocConsumer<AddFirmCubit, AddFirmState>(
        listener: _onStateChanged,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: _buildAppBar(context, state),
            body: Column(
              children: [
                AddFirmStepper(currentStep: state.currentStep),
                Expanded(
                  child: _buildCurrentStep(state.currentStep),
                ),
                AddFirmBottomNav(state: state),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onStateChanged(BuildContext context, AddFirmState state) {
    if (state.status == AddFirmStatus.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.firmCreatedSuccess)),
      );
      context.pop();
    } else if (state.status == AddFirmStatus.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage ?? context.l10n.errorOccurred)),
      );
    }
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, AddFirmState state) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.close, color: AppColors.textDark),
        onPressed: () => context.pop(),
      ),
      centerTitle: true,
      title: Text(
        context.l10n.addFirm,
        style: TextStyle(
          color: AppColors.textDark,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              '${state.currentStep + 1}${context.l10n.addFirmStepProgressPrefix}',
              style: const TextStyle(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentStep(int step) {
    switch (step) {
      case 0: return const FirmInfoView();
      case 1: return const PlanSelectionView();
      case 2: return const AdminSetupView();
      default: return const SizedBox();
    }
  }
}
