import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miya_ani/l10n/generated/localizations.dart';
import 'package:miya_ani/widgets/ani_cover.dart';
import 'package:subject_repository/subject_repository.dart';
import 'package:infix/via.dart';

import 'screens/router.dart';

void main() {
  runApp(const TestApp());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return via(
          (Widget c) => MultiRepositoryProvider(
            providers: [
              RepositoryProvider(create: (context) => SubjectRepository()),
            ],
            child: c,
          ),
        ) >
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
