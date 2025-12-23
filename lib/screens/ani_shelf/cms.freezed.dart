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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is A);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'A()';
}


}

/// @nodoc
class $ACopyWith<$Res>  {
$ACopyWith(A _, $Res Function(A) __);
}



/// @nodoc


class _Fetch implements A {
  const _Fetch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'A.fetch()';
}


}




/// @nodoc


class _Fetch$ implements A {
  const _Fetch$(this.page);
  

 final  int page;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Fetch$CopyWith<_Fetch$> get copyWith => __$Fetch$CopyWithImpl<_Fetch$>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch$&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'A._fetch\$(page: $page)';
}


}

/// @nodoc
abstract mixin class _$Fetch$CopyWith<$Res> implements $ACopyWith<$Res> {
  factory _$Fetch$CopyWith(_Fetch$ value, $Res Function(_Fetch$) _then) = __$Fetch$CopyWithImpl;
@useResult
$Res call({
 int page
});




}
/// @nodoc
class __$Fetch$CopyWithImpl<$Res>
    implements _$Fetch$CopyWith<$Res> {
  __$Fetch$CopyWithImpl(this._self, this._then);

  final _Fetch$ _self;
  final $Res Function(_Fetch$) _then;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(_Fetch$(
null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Search implements A {
  const _Search(this.query);
  

 final  String query;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCopyWith<_Search> get copyWith => __$SearchCopyWithImpl<_Search>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Search&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'A.search(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res> implements $ACopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) = __$SearchCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SearchCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_Search(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Refresh implements A {
  const _Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'A.refresh()';
}


}




/// @nodoc
mixin _$S<T> {

 PagingState<int, T> get pages; String? get tag;
/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SCopyWith<T, S<T>> get copyWith => _$SCopyWithImpl<T, S<T>>(this as S<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is S<T>&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,pages,tag);

@override
String toString() {
  return 'S<$T>(pages: $pages, tag: $tag)';
}


}

/// @nodoc
abstract mixin class $SCopyWith<T,$Res>  {
  factory $SCopyWith(S<T> value, $Res Function(S<T>) _then) = _$SCopyWithImpl;
@useResult
$Res call({
 PagingState<int, T> pages, String? tag
});




}
/// @nodoc
class _$SCopyWithImpl<T,$Res>
    implements $SCopyWith<T, $Res> {
  _$SCopyWithImpl(this._self, this._then);

  final S<T> _self;
  final $Res Function(S<T>) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pages = null,Object? tag = freezed,}) {
  return _then(_self.copyWith(
pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as PagingState<int, T>,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [S].
extension SPatterns<T> on S<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _S<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _S() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _S<T> value)  $default,){
final _that = this;
switch (_that) {
case _S():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _S<T> value)?  $default,){
final _that = this;
switch (_that) {
case _S() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PagingState<int, T> pages,  String? tag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _S() when $default != null:
return $default(_that.pages,_that.tag);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PagingState<int, T> pages,  String? tag)  $default,) {final _that = this;
switch (_that) {
case _S():
return $default(_that.pages,_that.tag);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PagingState<int, T> pages,  String? tag)?  $default,) {final _that = this;
switch (_that) {
case _S() when $default != null:
return $default(_that.pages,_that.tag);case _:
  return null;

}
}

}

/// @nodoc


class _S<T> implements S<T> {
  const _S({required this.pages, this.tag});
  

@override final  PagingState<int, T> pages;
@override final  String? tag;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SCopyWith<T, _S<T>> get copyWith => __$SCopyWithImpl<T, _S<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _S<T>&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,pages,tag);

@override
String toString() {
  return 'S<$T>(pages: $pages, tag: $tag)';
}


}

/// @nodoc
abstract mixin class _$SCopyWith<T,$Res> implements $SCopyWith<T, $Res> {
  factory _$SCopyWith(_S<T> value, $Res Function(_S<T>) _then) = __$SCopyWithImpl;
@override @useResult
$Res call({
 PagingState<int, T> pages, String? tag
});




}
/// @nodoc
class __$SCopyWithImpl<T,$Res>
    implements _$SCopyWith<T, $Res> {
  __$SCopyWithImpl(this._self, this._then);

  final _S<T> _self;
  final $Res Function(_S<T>) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pages = null,Object? tag = freezed,}) {
  return _then(_S<T>(
pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as PagingState<int, T>,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

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


class HistorySuggestion implements Suggestion {
  const HistorySuggestion(this.value);
  

@override final  String value;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistorySuggestionCopyWith<HistorySuggestion> get copyWith => _$HistorySuggestionCopyWithImpl<HistorySuggestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistorySuggestion&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'Suggestion.history(value: $value)';
}


}

/// @nodoc
abstract mixin class $HistorySuggestionCopyWith<$Res> implements $SuggestionCopyWith<$Res> {
  factory $HistorySuggestionCopyWith(HistorySuggestion value, $Res Function(HistorySuggestion) _then) = _$HistorySuggestionCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class _$HistorySuggestionCopyWithImpl<$Res>
    implements $HistorySuggestionCopyWith<$Res> {
  _$HistorySuggestionCopyWithImpl(this._self, this._then);

  final HistorySuggestion _self;
  final $Res Function(HistorySuggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(HistorySuggestion(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DatabaseSuggestion implements Suggestion {
  const DatabaseSuggestion(this.value, {this.icon});
  

@override final  String value;
 final  String? icon;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatabaseSuggestionCopyWith<DatabaseSuggestion> get copyWith => _$DatabaseSuggestionCopyWithImpl<DatabaseSuggestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DatabaseSuggestion&&(identical(other.value, value) || other.value == value)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,value,icon);

@override
String toString() {
  return 'Suggestion.database(value: $value, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $DatabaseSuggestionCopyWith<$Res> implements $SuggestionCopyWith<$Res> {
  factory $DatabaseSuggestionCopyWith(DatabaseSuggestion value, $Res Function(DatabaseSuggestion) _then) = _$DatabaseSuggestionCopyWithImpl;
@override @useResult
$Res call({
 String value, String? icon
});




}
/// @nodoc
class _$DatabaseSuggestionCopyWithImpl<$Res>
    implements $DatabaseSuggestionCopyWith<$Res> {
  _$DatabaseSuggestionCopyWithImpl(this._self, this._then);

  final DatabaseSuggestion _self;
  final $Res Function(DatabaseSuggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? icon = freezed,}) {
  return _then(DatabaseSuggestion(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
