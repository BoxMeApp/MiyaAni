// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Suggestion {

 String get value;
/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestionCopyWith<Suggestion> get copyWith => _$SuggestionCopyWithImpl<Suggestion>(this as Suggestion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Suggestion&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'Suggestion(value: $value)';
}


}

/// @nodoc
abstract mixin class $SuggestionCopyWith<$Res>  {
  factory $SuggestionCopyWith(Suggestion value, $Res Function(Suggestion) _then) = _$SuggestionCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$SuggestionCopyWithImpl<$Res>
    implements $SuggestionCopyWith<$Res> {
  _$SuggestionCopyWithImpl(this._self, this._then);

  final Suggestion _self;
  final $Res Function(Suggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



/// @nodoc


class _HistorySuggestion implements Suggestion {
  const _HistorySuggestion(this.value);
  

@override final  String value;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistorySuggestionCopyWith<_HistorySuggestion> get copyWith => __$HistorySuggestionCopyWithImpl<_HistorySuggestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistorySuggestion&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'Suggestion.history(value: $value)';
}


}

/// @nodoc
abstract mixin class _$HistorySuggestionCopyWith<$Res> implements $SuggestionCopyWith<$Res> {
  factory _$HistorySuggestionCopyWith(_HistorySuggestion value, $Res Function(_HistorySuggestion) _then) = __$HistorySuggestionCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class __$HistorySuggestionCopyWithImpl<$Res>
    implements _$HistorySuggestionCopyWith<$Res> {
  __$HistorySuggestionCopyWithImpl(this._self, this._then);

  final _HistorySuggestion _self;
  final $Res Function(_HistorySuggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_HistorySuggestion(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DatabaseSuggestion implements Suggestion {
  const _DatabaseSuggestion(this.value, {this.icon});
  

@override final  String value;
 final  String? icon;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DatabaseSuggestionCopyWith<_DatabaseSuggestion> get copyWith => __$DatabaseSuggestionCopyWithImpl<_DatabaseSuggestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DatabaseSuggestion&&(identical(other.value, value) || other.value == value)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,value,icon);

@override
String toString() {
  return 'Suggestion.database(value: $value, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$DatabaseSuggestionCopyWith<$Res> implements $SuggestionCopyWith<$Res> {
  factory _$DatabaseSuggestionCopyWith(_DatabaseSuggestion value, $Res Function(_DatabaseSuggestion) _then) = __$DatabaseSuggestionCopyWithImpl;
@override @useResult
$Res call({
 String value, String? icon
});




}
/// @nodoc
class __$DatabaseSuggestionCopyWithImpl<$Res>
    implements _$DatabaseSuggestionCopyWith<$Res> {
  __$DatabaseSuggestionCopyWithImpl(this._self, this._then);

  final _DatabaseSuggestion _self;
  final $Res Function(_DatabaseSuggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? icon = freezed,}) {
  return _then(_DatabaseSuggestion(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
