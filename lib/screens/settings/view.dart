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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              l10n.lang,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            StreamBuilder(
              stream: prefs.locale$,
              builder: (context, snapshot) {
                return RadioGroup<Locale?>(
                  onChanged: (locale) => prefs.locale = locale,
                  groupValue: prefs.locale,
                  child: Column(
                    children: [
                      RadioListTile<Locale?>(
                        value: null,
                        title: Text(l10n.systemDefault),
                      ),
                      RadioListTile<Locale?>(
                        value: Locale('en'),
                        title: Text(l10n.en),
                      ),
                      RadioListTile<Locale?>(
                        value: Locale('zh'),
                        title: Text(l10n.zh),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}