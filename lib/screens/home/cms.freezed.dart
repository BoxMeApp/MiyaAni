// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$A {

 S get page;
/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ACopyWith<A> get copyWith => _$ACopyWithImpl<A>(this as A, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is A&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'A(page: $page)';
}


}

/// @nodoc
abstract mixin class $ACopyWith<$Res>  {
  factory $ACopyWith(A value, $Res Function(A) _then) = _$ACopyWithImpl;
@useResult
$Res call({
 S page
});




}
/// @nodoc
class _$ACopyWithImpl<$Res>
    implements $ACopyWith<$Res> {
  _$ACopyWithImpl(this._self, this._then);

  final A _self;
  final $Res Function(A) _then;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as S,
  ));
}

}



/// @nodoc


class Select implements A {
  const Select(this.page);
  

@override final  S page;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectCopyWith<Select> get copyWith => _$SelectCopyWithImpl<Select>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Select&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'A.select(page: $page)';
}


}

/// @nodoc
abstract mixin class $SelectCopyWith<$Res> implements $ACopyWith<$Res> {
  factory $SelectCopyWith(Select value, $Res Function(Select) _then) = _$SelectCopyWithImpl;
@override @useResult
$Res call({
 S page
});




}
/// @nodoc
class _$SelectCopyWithImpl<$Res>
    implements $SelectCopyWith<$Res> {
  _$SelectCopyWithImpl(this._self, this._then);

  final Select _self;
  final $Res Function(Select) _then;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(Select(
null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as S,
  ));
}


}

// dart format on
