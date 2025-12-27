import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infix/flutter_infix.dart';
import 'package:subject_repository/subject_repository.dart';

import 'cms.dart';

class AppScope extends StatelessWidget {
  final Widget child;

  const AppScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => M()..add(.init()),
      child: _Scope(child: child),
    );
  }
}

class _Scope extends StatelessWidget {
  final Widget child;

  const _Scope({required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<M, S>(
      builder: (context, state) => switch (state) {
        Zero _ =>
          wrap((c) => MaterialApp(home: c))
                  .wrap((c) => Scaffold(body: c))
                  .wrap((c) => Center(child: c))
                  .wrap((c) => c) >
              CircularProgressIndicator(),
        Loaded s => MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => SubjectRepository()),
            RepositoryProvider(create: (context) => s.localPrefs),
          ],
          child: child,
        ),
      },
    );
  }
}
