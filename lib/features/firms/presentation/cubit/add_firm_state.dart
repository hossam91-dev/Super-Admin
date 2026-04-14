import 'package:equatable/equatable.dart';
import 'package:firm_super_admin/core/enums/enums.dart';

class AddFirmState extends Equatable {
  final int currentStep;
  final AddFirmStatus status;
  final String? errorMessage;
  
  // Step 1: Firm Info
  final String firmName;
  final String subdomain;
  final String country;
  final String city;
  final String contactEmail;
  final bool isSubdomainAvailable;

  // Step 2: Plan Selection
  final FirmPlan selectedPlan;
  final BillingCycle billingCycle;

  // Step 3: Admin Setup
  final String adminName;
  final String adminEmail;
  final PasswordMethod passwordMethod;

  const AddFirmState({
    this.currentStep = 0,
    this.status = AddFirmStatus.initial,
    this.errorMessage,
    this.firmName = '',
    this.subdomain = '',
    this.country = 'United States',
    this.city = '',
    this.contactEmail = '',
    this.isSubdomainAvailable = true,
    this.selectedPlan = FirmPlan.pro,
    this.billingCycle = BillingCycle.monthly,
    this.adminName = '',
    this.adminEmail = '',
    this.passwordMethod = PasswordMethod.setupEmail,
  });

  AddFirmState copyWith({
    int? currentStep,
    AddFirmStatus? status,
    String? errorMessage,
    String? firmName,
    String? subdomain,
    String? country,
    String? city,
    String? contactEmail,
    bool? isSubdomainAvailable,
    FirmPlan? selectedPlan,
    BillingCycle? billingCycle,
    String? adminName,
    String? adminEmail,
    PasswordMethod? passwordMethod,
  }) {
    return AddFirmState(
      currentStep: currentStep ?? this.currentStep,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      firmName: firmName ?? this.firmName,
      subdomain: subdomain ?? this.subdomain,
      country: country ?? this.country,
      city: city ?? this.city,
      contactEmail: contactEmail ?? this.contactEmail,
      isSubdomainAvailable: isSubdomainAvailable ?? this.isSubdomainAvailable,
      selectedPlan: selectedPlan ?? this.selectedPlan,
      billingCycle: billingCycle ?? this.billingCycle,
      adminName: adminName ?? this.adminName,
      adminEmail: adminEmail ?? this.adminEmail,
      passwordMethod: passwordMethod ?? this.passwordMethod,
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
        status,
        errorMessage,
        firmName,
        subdomain,
        country,
        city,
        contactEmail,
        isSubdomainAvailable,
        selectedPlan,
        billingCycle,
        adminName,
        adminEmail,
        passwordMethod,
      ];
}
