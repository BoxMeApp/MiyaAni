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
            Text("Language", style: Theme.of(context).textTheme.titleMedium),  // TODO: l10n.language
            RadioGroup<Locale?>(
              onChanged: (locale) => prefs.locale = locale,
              groupValue: prefs.locale,
              child: Column(
                children: [
                  RadioListTile<Locale?>(value: null, title: Text(l10n.systemDefault)),  // TODO: 若系统默认与所选的语言相同，单选框并不改变
                  RadioListTile<Locale?>(value: Locale('en'), title: Text(l10n.en)),
                  RadioListTile<Locale?>(value: Locale('zh'), title: Text(l10n.zh)),
                ],
              ),
            ),
            // StreamBuilder(
            //   stream: prefs.locale$,
            //   initialData: prefs.locale,
            //   builder: (context, snapshot) => ListTile(
            //     leading: DropdownButton<Locale?>(
            //       value: snapshot.data,
            //       onChanged: (locale) => prefs.locale = locale,
            //       items: [
            //         .new(value: null, child: Text(l10n.systemDefault)),
            //         .new(value: Locale('en'), child: Text(l10n.en)),
            //         .new(value: Locale('zh'), child: Text(l10n.zh)),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}