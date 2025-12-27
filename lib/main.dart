import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miya_ani/l10n/generated/localizations.dart';
import 'package:miya_ani/repositories/local_prefs.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/router.dart';
import 'scope/app/view.dart';

void main() => runApp(AppScope(child: const App()));

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.read<LocalPrefs>();
    return StreamBuilder(
      stream: prefs.locale$,
      initialData: prefs.locale,
      builder: (context, snapshot) => MaterialApp.router(
        theme: _buildTheme(.light),
        locale: snapshot.data,
        routerConfig: router,
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
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
        body: Center(child: Center()),
      ),
    );
  }
}

ThemeData _buildTheme(Brightness brightness) {
  final baseTheme = ThemeData(brightness: brightness);
  return baseTheme.copyWith(
    textTheme: GoogleFonts.notoSansScTextTheme(baseTheme.textTheme),
  );
}
