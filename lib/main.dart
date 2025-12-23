import 'package:flutter/material.dart';
import 'package:miya_ani/l10n/generated/localizations.dart';
import 'package:miya_ani/widgets/ani_cover.dart';
import 'package:infix/via.dart';

import 'screens/router.dart';
import 'scope/app/view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return via((Widget c) => AppScope(child: c)) >
        MaterialApp.router(
          routerConfig: router,
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
  }
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Test AniCover')),
        body: Center(child: AniCover.test()),
      ),
    );
  }
}
