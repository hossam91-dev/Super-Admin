import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'LawSaaS Admin'**
  String get appName;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Super Admin Portal'**
  String get appSubtitle;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'v2.1.0'**
  String get version;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'admin@lawsaas.com'**
  String get emailHint;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'••••••••'**
  String get passwordHint;

  /// No description provided for @errorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid credentials'**
  String get errorInvalidCredentials;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'HOME'**
  String get navHome;

  /// No description provided for @navFirms.
  ///
  /// In en, this message translates to:
  /// **'FIRMS'**
  String get navFirms;

  /// No description provided for @navBilling.
  ///
  /// In en, this message translates to:
  /// **'BILLING'**
  String get navBilling;

  /// No description provided for @navHealth.
  ///
  /// In en, this message translates to:
  /// **'HEALTH'**
  String get navHealth;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'SETTINGS'**
  String get navSettings;

  /// No description provided for @billingContent.
  ///
  /// In en, this message translates to:
  /// **'Billing Content'**
  String get billingContent;

  /// No description provided for @healthContent.
  ///
  /// In en, this message translates to:
  /// **'Health Content'**
  String get healthContent;

  /// No description provided for @settingsContent.
  ///
  /// In en, this message translates to:
  /// **'Settings Content'**
  String get settingsContent;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Good morning, Ahmed'**
  String get greeting;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Monday, Jan 15 2025'**
  String get date;

  /// No description provided for @totalFirmsTitle.
  ///
  /// In en, this message translates to:
  /// **'TOTAL FIRMS'**
  String get totalFirmsTitle;

  /// No description provided for @activeTitle.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE'**
  String get activeTitle;

  /// No description provided for @pendingTitle.
  ///
  /// In en, this message translates to:
  /// **'PENDING'**
  String get pendingTitle;

  /// No description provided for @recentFirms.
  ///
  /// In en, this message translates to:
  /// **'Recent Firms'**
  String get recentFirms;

  /// No description provided for @needsAttention.
  ///
  /// In en, this message translates to:
  /// **'Needs Attention'**
  String get needsAttention;

  /// No description provided for @overdue.
  ///
  /// In en, this message translates to:
  /// **'overdue'**
  String get overdue;

  /// No description provided for @trial.
  ///
  /// In en, this message translates to:
  /// **'trial'**
  String get trial;

  /// No description provided for @storage.
  ///
  /// In en, this message translates to:
  /// **'storage'**
  String get storage;

  /// No description provided for @dashboardStatMonthPrefix.
  ///
  /// In en, this message translates to:
  /// **'+'**
  String get dashboardStatMonthPrefix;

  /// No description provided for @dashboardStatMonthSuffix.
  ///
  /// In en, this message translates to:
  /// **' this month'**
  String get dashboardStatMonthSuffix;

  /// No description provided for @dashboardStatActivePrefix.
  ///
  /// In en, this message translates to:
  /// **'Current state: '**
  String get dashboardStatActivePrefix;

  /// No description provided for @dashboardStatPendingSuffix.
  ///
  /// In en, this message translates to:
  /// **'Requires review'**
  String get dashboardStatPendingSuffix;

  /// No description provided for @firmsSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search firms...'**
  String get firmsSearchHint;

  /// No description provided for @addFirm.
  ///
  /// In en, this message translates to:
  /// **'Add Law Firm'**
  String get addFirm;

  /// No description provided for @addFirmStep1.
  ///
  /// In en, this message translates to:
  /// **'Firm Info'**
  String get addFirmStep1;

  /// No description provided for @addFirmStep2.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get addFirmStep2;

  /// No description provided for @addFirmStep3.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get addFirmStep3;

  /// No description provided for @addFirmStepProgressPrefix.
  ///
  /// In en, this message translates to:
  /// **' of 3'**
  String get addFirmStepProgressPrefix;

  /// No description provided for @firmNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Firm Name'**
  String get firmNameLabel;

  /// No description provided for @firmNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Sterling & Associates'**
  String get firmNameHint;

  /// No description provided for @subdomainLabel.
  ///
  /// In en, this message translates to:
  /// **'Subdomain'**
  String get subdomainLabel;

  /// No description provided for @subdomainHint.
  ///
  /// In en, this message translates to:
  /// **'sterling'**
  String get subdomainHint;

  /// No description provided for @subdomainSuffix.
  ///
  /// In en, this message translates to:
  /// **'.lawsaas.com'**
  String get subdomainSuffix;

  /// No description provided for @countryLabel.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get countryLabel;

  /// No description provided for @countryDefault.
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get countryDefault;

  /// No description provided for @cityLabel.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get cityLabel;

  /// No description provided for @cityHint.
  ///
  /// In en, this message translates to:
  /// **'New York'**
  String get cityHint;

  /// No description provided for @contactEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact Email'**
  String get contactEmailLabel;

  /// No description provided for @contactEmailHint.
  ///
  /// In en, this message translates to:
  /// **'contact@firm.com'**
  String get contactEmailHint;

  /// No description provided for @choosePlanTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose Plan'**
  String get choosePlanTitle;

  /// No description provided for @choosePlanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the right plan for this firm'**
  String get choosePlanSubtitle;

  /// No description provided for @billingMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get billingMonthly;

  /// No description provided for @billingAnnual.
  ///
  /// In en, this message translates to:
  /// **'Annual'**
  String get billingAnnual;

  /// No description provided for @billingSaveBadge.
  ///
  /// In en, this message translates to:
  /// **'SAVE 17%'**
  String get billingSaveBadge;

  /// No description provided for @planMostPopular.
  ///
  /// In en, this message translates to:
  /// **'MOST POPULAR'**
  String get planMostPopular;

  /// No description provided for @planPriceSuffix.
  ///
  /// In en, this message translates to:
  /// **' /mo'**
  String get planPriceSuffix;

  /// No description provided for @planBasicTitle.
  ///
  /// In en, this message translates to:
  /// **'Basic'**
  String get planBasicTitle;

  /// No description provided for @planBasicPrice.
  ///
  /// In en, this message translates to:
  /// **'\$49'**
  String get planBasicPrice;

  /// No description provided for @planBasicDesc.
  ///
  /// In en, this message translates to:
  /// **'Essential for small startups'**
  String get planBasicDesc;

  /// No description provided for @planProTitle.
  ///
  /// In en, this message translates to:
  /// **'Pro'**
  String get planProTitle;

  /// No description provided for @planProPrice.
  ///
  /// In en, this message translates to:
  /// **'\$89'**
  String get planProPrice;

  /// No description provided for @planProOldPrice.
  ///
  /// In en, this message translates to:
  /// **'\$99'**
  String get planProOldPrice;

  /// No description provided for @planProDesc.
  ///
  /// In en, this message translates to:
  /// **'Perfect for growing firms'**
  String get planProDesc;

  /// No description provided for @planEnterpriseTitle.
  ///
  /// In en, this message translates to:
  /// **'Enterprise'**
  String get planEnterpriseTitle;

  /// No description provided for @planEnterprisePrice.
  ///
  /// In en, this message translates to:
  /// **'\$199'**
  String get planEnterprisePrice;

  /// No description provided for @planEnterpriseDesc.
  ///
  /// In en, this message translates to:
  /// **'Scale without limits'**
  String get planEnterpriseDesc;

  /// No description provided for @adminFullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Admin Full Name'**
  String get adminFullNameLabel;

  /// No description provided for @adminFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Ahmed Hassan'**
  String get adminFullNameHint;

  /// No description provided for @adminEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Admin Email'**
  String get adminEmailLabel;

  /// No description provided for @adminEmailHint.
  ///
  /// In en, this message translates to:
  /// **'ahmed@al-rashid.law'**
  String get adminEmailHint;

  /// No description provided for @passwordSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Password Setup'**
  String get passwordSetupTitle;

  /// No description provided for @passwordMethodEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Send setup email'**
  String get passwordMethodEmailTitle;

  /// No description provided for @passwordMethodEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'User creates password via secure link'**
  String get passwordMethodEmailSubtitle;

  /// No description provided for @passwordMethodManualTitle.
  ///
  /// In en, this message translates to:
  /// **'Set password manually'**
  String get passwordMethodManualTitle;

  /// No description provided for @passwordMethodManualSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Define a temporary password now'**
  String get passwordMethodManualSubtitle;

  /// No description provided for @adminSetupNotice.
  ///
  /// In en, this message translates to:
  /// **'An admin account will be created for this firm automatically'**
  String get adminSetupNotice;

  /// No description provided for @createFirmButton.
  ///
  /// In en, this message translates to:
  /// **'Create Firm'**
  String get createFirmButton;

  /// No description provided for @expires.
  ///
  /// In en, this message translates to:
  /// **'Expires'**
  String get expires;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'users'**
  String get users;

  /// No description provided for @cases.
  ///
  /// In en, this message translates to:
  /// **'cases'**
  String get cases;

  /// No description provided for @firmCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Firm created successfully!'**
  String get firmCreatedSuccess;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Error occurred'**
  String get errorOccurred;

  /// No description provided for @errorPrefix.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorPrefix;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get filterActive;

  /// No description provided for @filterTrial.
  ///
  /// In en, this message translates to:
  /// **'Trial'**
  String get filterTrial;

  /// No description provided for @filterSuspended.
  ///
  /// In en, this message translates to:
  /// **'Suspended'**
  String get filterSuspended;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailable;

  /// No description provided for @featureUpTo5Users.
  ///
  /// In en, this message translates to:
  /// **'Up to 5 users'**
  String get featureUpTo5Users;

  /// No description provided for @feature100ActiveCases.
  ///
  /// In en, this message translates to:
  /// **'100 active cases'**
  String get feature100ActiveCases;

  /// No description provided for @feature5GBSecureStorage.
  ///
  /// In en, this message translates to:
  /// **'5GB secure storage'**
  String get feature5GBSecureStorage;

  /// No description provided for @featureUpTo20Users.
  ///
  /// In en, this message translates to:
  /// **'Up to 20 users'**
  String get featureUpTo20Users;

  /// No description provided for @featureUnlimitedActiveCases.
  ///
  /// In en, this message translates to:
  /// **'Unlimited active cases'**
  String get featureUnlimitedActiveCases;

  /// No description provided for @feature20GBSecureStorage.
  ///
  /// In en, this message translates to:
  /// **'20GB secure storage'**
  String get feature20GBSecureStorage;

  /// No description provided for @featureUnlimitedUsers.
  ///
  /// In en, this message translates to:
  /// **'Unlimited users'**
  String get featureUnlimitedUsers;

  /// No description provided for @featureUnlimitedEverything.
  ///
  /// In en, this message translates to:
  /// **'Unlimited everything'**
  String get featureUnlimitedEverything;

  /// No description provided for @feature100GBSecureStorage.
  ///
  /// In en, this message translates to:
  /// **'100GB secure storage'**
  String get feature100GBSecureStorage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
