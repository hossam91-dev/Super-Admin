// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'LawSaaS Admin';

  @override
  String get appSubtitle => 'Super Admin Portal';

  @override
  String get version => 'v2.1.0';

  @override
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get close => 'Close';

  @override
  String get create => 'Create';

  @override
  String get seeAll => 'See all';

  @override
  String get search => 'Search';

  @override
  String get signIn => 'Sign In';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get emailHint => 'admin@lawsaas.com';

  @override
  String get passwordHint => '••••••••';

  @override
  String get errorInvalidCredentials => 'Invalid credentials';

  @override
  String get navHome => 'HOME';

  @override
  String get navFirms => 'FIRMS';

  @override
  String get navBilling => 'BILLING';

  @override
  String get navHealth => 'HEALTH';

  @override
  String get navSettings => 'SETTINGS';

  @override
  String get billingContent => 'Billing Content';

  @override
  String get healthContent => 'Health Content';

  @override
  String get settingsContent => 'Settings Content';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get greeting => 'Good morning, Ahmed';

  @override
  String get date => 'Monday, Jan 15 2025';

  @override
  String get totalFirmsTitle => 'TOTAL FIRMS';

  @override
  String get activeTitle => 'ACTIVE';

  @override
  String get pendingTitle => 'PENDING';

  @override
  String get recentFirms => 'Recent Firms';

  @override
  String get needsAttention => 'Needs Attention';

  @override
  String get overdue => 'overdue';

  @override
  String get trial => 'trial';

  @override
  String get storage => 'storage';

  @override
  String get dashboardStatMonthPrefix => '+';

  @override
  String get dashboardStatMonthSuffix => ' this month';

  @override
  String get dashboardStatActivePrefix => 'Current state: ';

  @override
  String get dashboardStatPendingSuffix => 'Requires review';

  @override
  String get firmsSearchHint => 'Search firms...';

  @override
  String get addFirm => 'Add Law Firm';

  @override
  String get addFirmStep1 => 'Firm Info';

  @override
  String get addFirmStep2 => 'Plan';

  @override
  String get addFirmStep3 => 'Admin';

  @override
  String get addFirmStepProgressPrefix => ' of 3';

  @override
  String get firmNameLabel => 'Firm Name';

  @override
  String get firmNameHint => 'e.g. Sterling & Associates';

  @override
  String get subdomainLabel => 'Subdomain';

  @override
  String get subdomainHint => 'sterling';

  @override
  String get subdomainSuffix => '.lawsaas.com';

  @override
  String get countryLabel => 'Country';

  @override
  String get countryDefault => 'United States';

  @override
  String get cityLabel => 'City';

  @override
  String get cityHint => 'New York';

  @override
  String get contactEmailLabel => 'Contact Email';

  @override
  String get contactEmailHint => 'contact@firm.com';

  @override
  String get choosePlanTitle => 'Choose Plan';

  @override
  String get choosePlanSubtitle => 'Select the right plan for this firm';

  @override
  String get billingMonthly => 'Monthly';

  @override
  String get billingAnnual => 'Annual';

  @override
  String get billingSaveBadge => 'SAVE 17%';

  @override
  String get planMostPopular => 'MOST POPULAR';

  @override
  String get planPriceSuffix => ' /mo';

  @override
  String get planBasicTitle => 'Basic';

  @override
  String get planBasicPrice => '\$49';

  @override
  String get planBasicDesc => 'Essential for small startups';

  @override
  String get planProTitle => 'Pro';

  @override
  String get planProPrice => '\$89';

  @override
  String get planProOldPrice => '\$99';

  @override
  String get planProDesc => 'Perfect for growing firms';

  @override
  String get planEnterpriseTitle => 'Enterprise';

  @override
  String get planEnterprisePrice => '\$199';

  @override
  String get planEnterpriseDesc => 'Scale without limits';

  @override
  String get adminFullNameLabel => 'Admin Full Name';

  @override
  String get adminFullNameHint => 'e.g. Ahmed Hassan';

  @override
  String get adminEmailLabel => 'Admin Email';

  @override
  String get adminEmailHint => 'ahmed@al-rashid.law';

  @override
  String get passwordSetupTitle => 'Password Setup';

  @override
  String get passwordMethodEmailTitle => 'Send setup email';

  @override
  String get passwordMethodEmailSubtitle =>
      'User creates password via secure link';

  @override
  String get passwordMethodManualTitle => 'Set password manually';

  @override
  String get passwordMethodManualSubtitle => 'Define a temporary password now';

  @override
  String get adminSetupNotice =>
      'An admin account will be created for this firm automatically';

  @override
  String get createFirmButton => 'Create Firm';

  @override
  String get expires => 'Expires';

  @override
  String get users => 'users';

  @override
  String get cases => 'cases';

  @override
  String get firmCreatedSuccess => 'Firm created successfully!';

  @override
  String get errorOccurred => 'Error occurred';

  @override
  String get errorPrefix => 'Error';

  @override
  String get filterAll => 'All';

  @override
  String get filterActive => 'Active';

  @override
  String get filterTrial => 'Trial';

  @override
  String get filterSuspended => 'Suspended';

  @override
  String get available => 'Available';

  @override
  String get unavailable => 'Unavailable';

  @override
  String get featureUpTo5Users => 'Up to 5 users';

  @override
  String get feature100ActiveCases => '100 active cases';

  @override
  String get feature5GBSecureStorage => '5GB secure storage';

  @override
  String get featureUpTo20Users => 'Up to 20 users';

  @override
  String get featureUnlimitedActiveCases => 'Unlimited active cases';

  @override
  String get feature20GBSecureStorage => '20GB secure storage';

  @override
  String get featureUnlimitedUsers => 'Unlimited users';

  @override
  String get featureUnlimitedEverything => 'Unlimited everything';

  @override
  String get feature100GBSecureStorage => '100GB secure storage';
}
