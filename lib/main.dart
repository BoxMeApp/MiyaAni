import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miya_ani/l10n/generated/localizations.dart';
import 'package:subject_repository/subject_repository.dart';
import 'package:infix/via.dart';

import 'screens/router.dart';

void main() {
  runApp(const App());
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
