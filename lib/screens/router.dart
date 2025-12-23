import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'home/view.dart';
import 'ani_shelf/view.dart';

part 'router.freezed.dart';

enum _Patterns {
  home('/');

  final String value;
  const _Patterns(this.value);
}

@Freezed(
  map: .new(map: false, mapOrNull: false, maybeMap: false),
  when: .new(when: false, whenOrNull: false, maybeWhen: false),
)
sealed class PageUrl with _$PageUrl {
  const PageUrl._();

  factory PageUrl.home() = _HomeUrl;

  _Patterns get _pattern => switch (this) {
    _HomeUrl() => .home,
  };

  String get url {
    final p = _pattern.value;
    return switch (this) {
      _HomeUrl() => p,
    };
  }
}

extension PageChangeExt on BuildContext {
  void goPage(PageUrl page) => go(page.url);
  void pushPage(PageUrl page) => push(page.url);
}

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomePage(child: child),
      routes: [_p(.home, (context, state) => const AniShelfPage())],
    ),
  ],
);

/// page
GoRoute _p(_Patterns p, Widget Function(BuildContext, GoRouterState) builder) =>
    GoRoute(path: p.value, builder: builder);
