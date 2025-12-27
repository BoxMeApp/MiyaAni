import 'package:flutter/widget_previews.dart';
import 'package:miya_ani/l10n/generated/localizations.dart';

final class AppPreview extends Preview {
  const AppPreview({super.name, super.size})
    : super(localizations: AppPreview.localizationBuilder);

  static PreviewLocalizationsData localizationBuilder() => .new(
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
  );
}
