import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infix/via.dart';

import 'home/view.dart';
import 'ani_shelf/view.dart';
import 'settings/view.dart';

part 'router.freezed.dart';

enum _Patterns {
  home('/'),
  settings('/settings');

  final String value;
  const _Patterns(this.value);
}

@freezed
sealed class PageUrl with _$PageUrl {
  const PageUrl._();

  factory PageUrl.home() = _HomeUrl;
  factory PageUrl.settings() = _SettingsUrl;

  _Patterns get _pattern => switch (this) {
    _HomeUrl() => .home,
    _SettingsUrl() => .settings,
  };

  String get url {
    final p = _pattern.value;
    return switch (this) {
      _HomeUrl() => p,
      _SettingsUrl() => p,
    };
  }
}

extension PageChangeExt on BuildContext {
  void goPage(PageUrl page) => go(page.url);
  void pushPage(PageUrl page) => push(page.url);
}

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      branches: [
        via((GoRoute p) => StatefulShellBranch(routes: [p])) >
            _p(.home, (context, state) => const AniShelfPage()),
        via((GoRoute p) => StatefulShellBranch(routes: [p])) >
            _p(.settings, (context, state) => const SettingsPage()),
      ],
      builder: (context, state, shell) => HomePage(child: shell),
    ),
  ],
);

/// page
GoRoute _p(_Patterns p, Widget Function(BuildContext, GoRouterState) builder) =>
    GoRoute(path: p.value, builder: builder);
