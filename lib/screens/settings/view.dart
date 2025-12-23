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
        child: StreamBuilder(
          stream: prefs.locale$,
          initialData: prefs.locale,
          builder: (context, snapshot) => DropdownButton<Locale?>(
            value: snapshot.data,
            onChanged: (locale) => prefs.locale = locale,
            items: [
              .new(value: null, child: Text(l10n.systemDefault)),
              .new(value: Locale('en'), child: Text(l10n.en)),
              .new(value: Locale('zh'), child: Text(l10n.zh)),
            ],
          ),
        ),
      ),
    );
  }
}
