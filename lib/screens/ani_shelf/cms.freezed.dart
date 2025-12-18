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


/// Adds pattern-matching-related methods to [A].
extension APatterns on A {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Fetch value)?  fetch,TResult Function( _$Fetch value)?  $fetch,TResult Function( Search value)?  search,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Fetch() when fetch != null:
return fetch(_that);case _$Fetch() when $fetch != null:
return $fetch(_that);case Search() when search != null:
return search(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Fetch value)  fetch,required TResult Function( _$Fetch value)  $fetch,required TResult Function( Search value)  search,}){
final _that = this;
switch (_that) {
case Fetch():
return fetch(_that);case _$Fetch():
return $fetch(_that);case Search():
return search(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Fetch value)?  fetch,TResult? Function( _$Fetch value)?  $fetch,TResult? Function( Search value)?  search,}){
final _that = this;
switch (_that) {
case Fetch() when fetch != null:
return fetch(_that);case _$Fetch() when $fetch != null:
return $fetch(_that);case Search() when search != null:
return search(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetch,TResult Function( int page)?  $fetch,TResult Function( String query)?  search,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Fetch() when fetch != null:
return fetch();case _$Fetch() when $fetch != null:
return $fetch(_that.page);case Search() when search != null:
return search(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetch,required TResult Function( int page)  $fetch,required TResult Function( String query)  search,}) {final _that = this;
switch (_that) {
case Fetch():
return fetch();case _$Fetch():
return $fetch(_that.page);case Search():
return search(_that.query);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetch,TResult? Function( int page)?  $fetch,TResult? Function( String query)?  search,}) {final _that = this;
switch (_that) {
case Fetch() when fetch != null:
return fetch();case _$Fetch() when $fetch != null:
return $fetch(_that.page);case Search() when search != null:
return search(_that.query);case _:
  return null;

}
}

}

/// @nodoc


class Fetch implements A {
  const Fetch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Fetch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'A.fetch()';
}


}




/// @nodoc

@internal
class _$Fetch implements A {
  const _$Fetch(this.page);
  

 final  int page;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$FetchCopyWith<_$Fetch> get copyWith => __$$FetchCopyWithImpl<_$Fetch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$Fetch&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'A.\$fetch(page: $page)';
}


}

/// @nodoc
abstract mixin class _$$FetchCopyWith<$Res> implements $ACopyWith<$Res> {
  factory _$$FetchCopyWith(_$Fetch value, $Res Function(_$Fetch) _then) = __$$FetchCopyWithImpl;
@useResult
$Res call({
 int page
});




}
/// @nodoc
class __$$FetchCopyWithImpl<$Res>
    implements _$$FetchCopyWith<$Res> {
  __$$FetchCopyWithImpl(this._self, this._then);

  final _$Fetch _self;
  final $Res Function(_$Fetch) _then;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(_$Fetch(
null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Search implements A {
  const Search(this.query);
  

 final  String query;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchCopyWith<Search> get copyWith => _$SearchCopyWithImpl<Search>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Search&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'A.search(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchCopyWith<$Res> implements $ACopyWith<$Res> {
  factory $SearchCopyWith(Search value, $Res Function(Search) _then) = _$SearchCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchCopyWithImpl<$Res>
    implements $SearchCopyWith<$Res> {
  _$SearchCopyWithImpl(this._self, this._then);

  final Search _self;
  final $Res Function(Search) _then;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(Search(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
