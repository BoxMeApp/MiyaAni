// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Subject {

 int get id; String get name; Map<ImageType, String> get images; String? get url; String? get summary;
/// Create a copy of Subject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectCopyWith<Subject> get copyWith => _$SubjectCopyWithImpl<Subject>(this as Subject, _$identity);

  /// Serializes this Subject to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'Subject(id: $id, name: $name, images: $images, url: $url, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $SubjectCopyWith<$Res>  {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) _then) = _$SubjectCopyWithImpl;
@useResult
$Res call({
 int id, String name, Map<ImageType, String> images, String? url, String? summary
});




}
/// @nodoc
class _$SubjectCopyWithImpl<$Res>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._self, this._then);

  final Subject _self;
  final $Res Function(Subject) _then;

/// Create a copy of Subject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? images = null,Object? url = freezed,Object? summary = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as Map<ImageType, String>,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Subject].
extension SubjectPatterns on Subject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Subject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Subject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Subject value)  $default,){
final _that = this;
switch (_that) {
case _Subject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Subject value)?  $default,){
final _that = this;
switch (_that) {
case _Subject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  Map<ImageType, String> images,  String? url,  String? summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Subject() when $default != null:
return $default(_that.id,_that.name,_that.images,_that.url,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  Map<ImageType, String> images,  String? url,  String? summary)  $default,) {final _that = this;
switch (_that) {
case _Subject():
return $default(_that.id,_that.name,_that.images,_that.url,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  Map<ImageType, String> images,  String? url,  String? summary)?  $default,) {final _that = this;
switch (_that) {
case _Subject() when $default != null:
return $default(_that.id,_that.name,_that.images,_that.url,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Subject extends Subject {
  const _Subject({required this.id, required this.name, required final  Map<ImageType, String> images, this.url, this.summary}): _images = images,super._();
  factory _Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

@override final  int id;
@override final  String name;
 final  Map<ImageType, String> _images;
@override Map<ImageType, String> get images {
  if (_images is EqualUnmodifiableMapView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_images);
}

@override final  String? url;
@override final  String? summary;

/// Create a copy of Subject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectCopyWith<_Subject> get copyWith => __$SubjectCopyWithImpl<_Subject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubjectToJson(this, );
}



@override
String toString() {
  return 'Subject(id: $id, name: $name, images: $images, url: $url, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$SubjectCopyWith(_Subject value, $Res Function(_Subject) _then) = __$SubjectCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, Map<ImageType, String> images, String? url, String? summary
});




}
/// @nodoc
class __$SubjectCopyWithImpl<$Res>
    implements _$SubjectCopyWith<$Res> {
  __$SubjectCopyWithImpl(this._self, this._then);

  final _Subject _self;
  final $Res Function(_Subject) _then;

/// Create a copy of Subject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? images = null,Object? url = freezed,Object? summary = freezed,}) {
  return _then(_Subject(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as Map<ImageType, String>,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CalendarItem {

 ({String cn, String en, String ja, int id}) get weekday; List<Subject> get items;
/// Create a copy of CalendarItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarItemCopyWith<CalendarItem> get copyWith => _$CalendarItemCopyWithImpl<CalendarItem>(this as CalendarItem, _$identity);

  /// Serializes this CalendarItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarItem&&(identical(other.weekday, weekday) || other.weekday == weekday)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekday,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CalendarItem(weekday: $weekday, items: $items)';
}


}

/// @nodoc
abstract mixin class $CalendarItemCopyWith<$Res>  {
  factory $CalendarItemCopyWith(CalendarItem value, $Res Function(CalendarItem) _then) = _$CalendarItemCopyWithImpl;
@useResult
$Res call({
 ({String cn, String en, String ja, int id}) weekday, List<Subject> items
});




}
/// @nodoc
class _$CalendarItemCopyWithImpl<$Res>
    implements $CalendarItemCopyWith<$Res> {
  _$CalendarItemCopyWithImpl(this._self, this._then);

  final CalendarItem _self;
  final $Res Function(CalendarItem) _then;

/// Create a copy of CalendarItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekday = null,Object? items = null,}) {
  return _then(_self.copyWith(
weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as ({String cn, String en, String ja, int id}),items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Subject>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarItem].
extension CalendarItemPatterns on CalendarItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarItem value)  $default,){
final _that = this;
switch (_that) {
case _CalendarItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarItem value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ({String cn, String en, String ja, int id}) weekday,  List<Subject> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarItem() when $default != null:
return $default(_that.weekday,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ({String cn, String en, String ja, int id}) weekday,  List<Subject> items)  $default,) {final _that = this;
switch (_that) {
case _CalendarItem():
return $default(_that.weekday,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ({String cn, String en, String ja, int id}) weekday,  List<Subject> items)?  $default,) {final _that = this;
switch (_that) {
case _CalendarItem() when $default != null:
return $default(_that.weekday,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalendarItem extends CalendarItem {
  const _CalendarItem({required this.weekday, required final  List<Subject> items}): _items = items,super._();
  factory _CalendarItem.fromJson(Map<String, dynamic> json) => _$CalendarItemFromJson(json);

@override final  ({String cn, String en, String ja, int id}) weekday;
 final  List<Subject> _items;
@override List<Subject> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CalendarItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarItemCopyWith<_CalendarItem> get copyWith => __$CalendarItemCopyWithImpl<_CalendarItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarItem&&(identical(other.weekday, weekday) || other.weekday == weekday)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekday,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CalendarItem(weekday: $weekday, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CalendarItemCopyWith<$Res> implements $CalendarItemCopyWith<$Res> {
  factory _$CalendarItemCopyWith(_CalendarItem value, $Res Function(_CalendarItem) _then) = __$CalendarItemCopyWithImpl;
@override @useResult
$Res call({
 ({String cn, String en, String ja, int id}) weekday, List<Subject> items
});




}
/// @nodoc
class __$CalendarItemCopyWithImpl<$Res>
    implements _$CalendarItemCopyWith<$Res> {
  __$CalendarItemCopyWithImpl(this._self, this._then);

  final _CalendarItem _self;
  final $Res Function(_CalendarItem) _then;

/// Create a copy of CalendarItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekday = null,Object? items = null,}) {
  return _then(_CalendarItem(
weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as ({String cn, String en, String ja, int id}),items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Subject>,
  ));
}


}

// dart format on
