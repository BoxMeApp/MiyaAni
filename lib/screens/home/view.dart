import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infix/via.dart';
import 'package:miya_ani/l10n/generated/localizations.dart';
import 'package:miya_ani/screens/router.dart';

import 'cms.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return via((Widget c) => BlocProvider(create: (context) => M(), child: c)) >
        Scaffold(
          bottomNavigationBar: BlocConsumer<M, S>(
            builder: (context, state) => NavigationBar(
              destinations: <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: AppLocalizations.of(context)!.home,
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings,
                ),
              ],
              selectedIndex: state.index,
              onDestinationSelected: (index) =>
                  context.read<M>().add(.select(.values[index])),
            ),
            listener: (context, state) {
              switch (state) {
                case .home:
                  context.goPage(.home());
                case .settings:
                  context.goPage(.settings());
              }
            },
          ),
          body: child,
        );
  }
}
