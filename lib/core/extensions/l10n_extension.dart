import 'package:firm_super_admin/l10n/arb/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
