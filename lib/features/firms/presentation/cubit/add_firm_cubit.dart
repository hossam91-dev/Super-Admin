import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firm_super_admin/core/enums/enums.dart';
import 'add_firm_state.dart';

class AddFirmCubit extends Cubit<AddFirmState> {
  AddFirmCubit() : super(const AddFirmState());

  void nextStep() {
    if (state.currentStep < 2) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  // Step 1 Updates
  void updateFirmName(String value) => emit(state.copyWith(firmName: value));
  void updateSubdomain(String value) {
    emit(state.copyWith(subdomain: value));
    _checkSubdomain(value);
  }
  void updateCountry(String value) => emit(state.copyWith(country: value));
  void updateCity(String value) => emit(state.copyWith(city: value));
  void updateContactEmail(String value) => emit(state.copyWith(contactEmail: value));

  void _checkSubdomain(String value) async {
    await Future.delayed(const Duration(milliseconds: 300));
    emit(state.copyWith(isSubdomainAvailable: value.length > 3));
  }

  // Step 2 Updates
  void selectPlan(FirmPlan plan) => emit(state.copyWith(selectedPlan: plan));
  void toggleBillingCycle(BillingCycle cycle) => emit(state.copyWith(billingCycle: cycle));

  // Step 3 Updates
  void updateAdminName(String value) => emit(state.copyWith(adminName: value));
  void updateAdminEmail(String value) => emit(state.copyWith(adminEmail: value));
  void updatePasswordMethod(PasswordMethod method) => emit(state.copyWith(passwordMethod: method));

  Future<void> createFirm() async {
    if (state.status == AddFirmStatus.loading) return;
    
    emit(state.copyWith(status: AddFirmStatus.loading, errorMessage: null));
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(status: AddFirmStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: AddFirmStatus.failure, 
        errorMessage: 'Failed to create firm. Please try again.'
      ));
    }
  }
}
