
import 'package:cms/cms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms.freezed.dart';

@Freezed(
  map: .new(map: false, mapOrNull: false, maybeMap: false),
  when: .new(when: false, whenOrNull: false, maybeWhen: false),
)
sealed class A with _$A {
  const factory A.init() = Init;
}

@Freezed(
  map: .new(map: false, mapOrNull: false, maybeMap: false),
  when: .new(when: false, whenOrNull: false, maybeWhen: false),
)
sealed class S with _$S {
  const factory S.zero() = Zero;
}

class M extends Cms<S, A> {
  M() : super(const Zero()) ;
  @override
  Future<S> kernel(S s, A a) async => switch ((s, a)) {
    _ => undefined(s, a),
  };
}
