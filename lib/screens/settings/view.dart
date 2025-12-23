import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miya_ani/l10n/generated/localizations.dart';
import 'package:miya_ani/repositories/local_prefs.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.read<LocalPrefs>();
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: DropdownButton<Locale?>(
          value: prefs.locale,
          onChanged: (Locale? locale) => prefs.locale = locale,
          items: [
            DropdownMenuItem(value: null, child: Text(l10n.systemDefault)),
            DropdownMenuItem(value: Locale('en'), child: Text(l10n.en)),
            DropdownMenuItem(value: Locale('zh'), child: Text(l10n.zh)),
          ],
        ),
      ),
    );
  }
}
