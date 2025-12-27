import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infix/via.dart';
import 'package:subject_repository/subject_repository.dart';

import 'cms.dart';

class AppScope extends StatelessWidget {
  final Widget child;

  const AppScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return via(
          (Widget c) =>
              BlocProvider(create: (context) => M()..add(.init()), child: c),
        ).via((Widget c) => _Scope(child: c)) >
        child;
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
          via((Widget c) => MaterialApp(home: c))
                  .via((Widget c) => Scaffold(body: c))
                  .via((Widget c) => Center(child: c)) >
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
