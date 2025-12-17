// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'a.dart';

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Init value)?  init,TResult Function( Fetch value)?  fetch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Init() when init != null:
return init(_that);case Fetch() when fetch != null:
return fetch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Init value)  init,required TResult Function( Fetch value)  fetch,}){
final _that = this;
switch (_that) {
case Init():
return init(_that);case Fetch():
return fetch(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Init value)?  init,TResult? Function( Fetch value)?  fetch,}){
final _that = this;
switch (_that) {
case Init() when init != null:
return init(_that);case Fetch() when fetch != null:
return fetch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  fetch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Init() when init != null:
return init();case Fetch() when fetch != null:
return fetch();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  fetch,}) {final _that = this;
switch (_that) {
case Init():
return init();case Fetch():
return fetch();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  fetch,}) {final _that = this;
switch (_that) {
case Init() when init != null:
return init();case Fetch() when fetch != null:
return fetch();case _:
  return null;

}
}

}

/// @nodoc


class Init implements A {
  const Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'A.init()';
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




// dart format on
