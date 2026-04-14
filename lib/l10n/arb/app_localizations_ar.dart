// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'مدير LawSaaS';

  @override
  String get appSubtitle => 'بوابة المشرف الرئيسي';

  @override
  String get version => 'v2.1.0';

  @override
  String get next => 'التالي';

  @override
  String get back => 'رجوع';

  @override
  String get save => 'حفظ';

  @override
  String get cancel => 'إلغاء';

  @override
  String get close => 'إغلاق';

  @override
  String get create => 'إنشاء';

  @override
  String get seeAll => 'عرض الكل';

  @override
  String get search => 'بحث';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get emailHint => 'admin@lawsaas.com';

  @override
  String get passwordHint => '••••••••';

  @override
  String get errorInvalidCredentials => 'بيانات الاعتماد غير صالحة';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navFirms => 'الشركات';

  @override
  String get navBilling => 'الفواتير';

  @override
  String get navHealth => 'النظام';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get billingContent => 'محتوى الفواتير';

  @override
  String get healthContent => 'محتوى النظام';

  @override
  String get settingsContent => 'محتوى الإعدادات';

  @override
  String get dashboard => 'لوحة التحكم';

  @override
  String get greeting => 'صباح الخير، أحمد';

  @override
  String get date => 'الإثنين، 15 يناير 2025';

  @override
  String get totalFirmsTitle => 'إجمالي الشركات';

  @override
  String get activeTitle => 'نشط';

  @override
  String get pendingTitle => 'قيد الانتظار';

  @override
  String get recentFirms => 'أحدث الشركات';

  @override
  String get needsAttention => 'تحتاج إلى اهتمام';

  @override
  String get overdue => 'متأخر';

  @override
  String get trial => 'تجريبي';

  @override
  String get storage => 'المساحة';

  @override
  String get dashboardStatMonthPrefix => '+';

  @override
  String get dashboardStatMonthSuffix => ' هذا الشهر';

  @override
  String get dashboardStatActivePrefix => 'الحالة الحالية: ';

  @override
  String get dashboardStatPendingSuffix => 'يتطلب مراجعة';

  @override
  String get firmsSearchHint => 'ابحث عن الشركات...';

  @override
  String get addFirm => 'إضافة شركة محاماة';

  @override
  String get addFirmStep1 => 'معلومات الشركة';

  @override
  String get addFirmStep2 => 'الخطة';

  @override
  String get addFirmStep3 => 'المشرف';

  @override
  String get addFirmStepProgressPrefix => ' من 3';

  @override
  String get firmNameLabel => 'اسم الشركة';

  @override
  String get firmNameHint => 'مثال: ستيرلنج وشركاه';

  @override
  String get subdomainLabel => 'النطاق الفرعي';

  @override
  String get subdomainHint => 'sterling';

  @override
  String get subdomainSuffix => '.lawsaas.com';

  @override
  String get countryLabel => 'الدولة';

  @override
  String get countryDefault => 'الولايات المتحدة';

  @override
  String get cityLabel => 'المدينة';

  @override
  String get cityHint => 'نيويورك';

  @override
  String get contactEmailLabel => 'بريد التواصل';

  @override
  String get contactEmailHint => 'contact@firm.com';

  @override
  String get choosePlanTitle => 'اختر الخطة';

  @override
  String get choosePlanSubtitle => 'اختر الخطة المناسبة لهذه الشركة';

  @override
  String get billingMonthly => 'شهري';

  @override
  String get billingAnnual => 'سنوي';

  @override
  String get billingSaveBadge => 'وفر 17%';

  @override
  String get planMostPopular => 'الأكثر شيوعاً';

  @override
  String get planPriceSuffix => ' /شهرياً';

  @override
  String get planBasicTitle => 'أساسية';

  @override
  String get planBasicPrice => '49\$';

  @override
  String get planBasicDesc => 'أساسية للشركات الناشئة الصغيرة';

  @override
  String get planProTitle => 'احترافية';

  @override
  String get planProPrice => '89\$';

  @override
  String get planProOldPrice => '99\$';

  @override
  String get planProDesc => 'مثالية للشركات المتنامية';

  @override
  String get planEnterpriseTitle => 'شركات كبرى';

  @override
  String get planEnterprisePrice => '199\$';

  @override
  String get planEnterpriseDesc => 'بدون حدود للنمو';

  @override
  String get adminFullNameLabel => 'اسم المشرف بالكامل';

  @override
  String get adminFullNameHint => 'مثال: أحمد حسن';

  @override
  String get adminEmailLabel => 'بريد المشرف';

  @override
  String get adminEmailHint => 'ahmed@al-rashid.law';

  @override
  String get passwordSetupTitle => 'إعداد كلمة المرور';

  @override
  String get passwordMethodEmailTitle => 'إرسال بريد إلكتروني للإعداد';

  @override
  String get passwordMethodEmailSubtitle =>
      'المستخدم ينشئ كلمة المرور عبر رابط آمن';

  @override
  String get passwordMethodManualTitle => 'تعيين كلمة المرور يدوياً';

  @override
  String get passwordMethodManualSubtitle => 'قم بتعيين كلمة مرور مؤقتة الآن';

  @override
  String get adminSetupNotice => 'سيتم إنشاء حساب مشرف لهذه الشركة تلقائياً';

  @override
  String get createFirmButton => 'إنشاء الشركة';

  @override
  String get expires => 'تنتهي في';

  @override
  String get users => 'مستخدمين';

  @override
  String get cases => 'قضايا';

  @override
  String get firmCreatedSuccess => 'تم إنشاء الشركة بنجاح!';

  @override
  String get errorOccurred => 'حدث خطأ';

  @override
  String get errorPrefix => 'خطأ';

  @override
  String get filterAll => 'الكل';

  @override
  String get filterActive => 'نشط';

  @override
  String get filterTrial => 'تجريبي';

  @override
  String get filterSuspended => 'معلق';

  @override
  String get available => 'متاح';

  @override
  String get unavailable => 'غير متاح';

  @override
  String get featureUpTo5Users => 'ما يصل إلى 5 مستخدمين';

  @override
  String get feature100ActiveCases => '100 قضية نشطة';

  @override
  String get feature5GBSecureStorage => '5 جيجابايت مساحة تخزين آمنة';

  @override
  String get featureUpTo20Users => 'ما يصل إلى 20 مستخدم';

  @override
  String get featureUnlimitedActiveCases => 'قضايا نشطة غير محدودة';

  @override
  String get feature20GBSecureStorage => '20 جيجابايت مساحة تخزين آمنة';

  @override
  String get featureUnlimitedUsers => 'مستخدمين غير محدودين';

  @override
  String get featureUnlimitedEverything => 'كل شيء غير محدود';

  @override
  String get feature100GBSecureStorage => '100 جيجابايت مساحة تخزين آمنة';
}
