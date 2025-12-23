import 'package:cms/cms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms.freezed.dart';

@freezed
sealed class A with _$A {
  const factory A.select(S page) = Select;
}

enum S { home, settings }

class M extends Cms<S, A> {
  M() : super(.home);
  @override
  Future<S> kernel(S s, A a) async => switch ((s, a)) {
    (_, Select a) => a.page,
  };
}
