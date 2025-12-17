import 'package:freezed_annotation/freezed_annotation.dart';

part 'a.freezed.dart';

@freezed
sealed class A with _$A {
  const factory A.init() = Init;
  const factory A.fetch() = Fetch;
}
