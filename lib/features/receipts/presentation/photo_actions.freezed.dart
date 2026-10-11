// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_actions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PhotoFilter {

 String? get creditorId; DateRange? get range;
/// Create a copy of PhotoFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoFilterCopyWith<PhotoFilter> get copyWith => _$PhotoFilterCopyWithImpl<PhotoFilter>(this as PhotoFilter, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PhotoFilter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoFilter&&(identical(other.creditorId, _this.creditorId) || other.creditorId == _this.creditorId)&&(identical(other.range, _this.range) || other.range == _this.range));
}


@override
int get hashCode {
  final _this = this as PhotoFilter;
  return Object.hash(runtimeType,_this.creditorId,_this.range);
}

@override
String toString() {
  final _this = this as PhotoFilter;
  return 'PhotoFilter(creditorId: ${_this.creditorId}, range: ${_this.range})';
}


}

/// @nodoc
abstract mixin class $PhotoFilterCopyWith<$Res>  {
  factory $PhotoFilterCopyWith(PhotoFilter value, $Res Function(PhotoFilter) _then) = _$PhotoFilterCopyWithImpl;
@useResult
$Res call({
 String? creditorId, DateRange? range
});


$DateRangeCopyWith<$Res>? get range;

}
/// @nodoc
class _$PhotoFilterCopyWithImpl<$Res>
    implements $PhotoFilterCopyWith<$Res> {
  _$PhotoFilterCopyWithImpl(this._self, this._then);

  final PhotoFilter _self;
  final $Res Function(PhotoFilter) _then;

/// Create a copy of PhotoFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? creditorId = freezed,Object? range = freezed,}) {
  return _then(PhotoFilter(
creditorId: freezed == creditorId ? _self.creditorId : creditorId // ignore: cast_nullable_to_non_nullable
as String?,range: freezed == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as DateRange?,
  ));
}
/// Create a copy of PhotoFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DateRangeCopyWith<$Res>? get range {
    if (_self.range == null) {
    return null;
  }

  return $DateRangeCopyWith<$Res>(_self.range!, (value) {
    return _then(_self.copyWith(range: value));
  });
}
}


/// Adds pattern-matching-related methods to [PhotoFilter].
extension PhotoFilterPatterns on PhotoFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoFilter value)  $default,){
final _that = this;
switch (_that) {
case _PhotoFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoFilter value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? creditorId,  DateRange? range)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoFilter() when $default != null:
return $default(_that.creditorId,_that.range);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? creditorId,  DateRange? range)  $default,) {final _that = this;
switch (_that) {
case _PhotoFilter():
return $default(_that.creditorId,_that.range);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? creditorId,  DateRange? range)?  $default,) {final _that = this;
switch (_that) {
case _PhotoFilter() when $default != null:
return $default(_that.creditorId,_that.range);case _:
  return null;

}
}

}

/// @nodoc


class _PhotoFilter implements PhotoFilter {
  const _PhotoFilter({this.creditorId, this.range});
  

@override final  String? creditorId;
@override final  DateRange? range;

/// Create a copy of PhotoFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoFilterCopyWith<_PhotoFilter> get copyWith => __$PhotoFilterCopyWithImpl<_PhotoFilter>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoFilter&&(identical(other.creditorId, creditorId) || other.creditorId == creditorId)&&(identical(other.range, range) || other.range == range));
}


@override
int get hashCode {
    return Object.hash(runtimeType,creditorId,range);
}

@override
String toString() {
    return 'PhotoFilter(creditorId: $creditorId, range: $range)';
}


}

/// @nodoc
abstract mixin class _$PhotoFilterCopyWith<$Res> implements $PhotoFilterCopyWith<$Res> {
  factory _$PhotoFilterCopyWith(_PhotoFilter value, $Res Function(_PhotoFilter) _then) = __$PhotoFilterCopyWithImpl;
@override @useResult
$Res call({
 String? creditorId, DateRange? range
});


@override $DateRangeCopyWith<$Res>? get range;

}
/// @nodoc
class __$PhotoFilterCopyWithImpl<$Res>
    implements _$PhotoFilterCopyWith<$Res> {
  __$PhotoFilterCopyWithImpl(this._self, this._then);

  final _PhotoFilter _self;
  final $Res Function(_PhotoFilter) _then;

/// Create a copy of PhotoFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? creditorId = freezed,Object? range = freezed,}) {
  return _then(_PhotoFilter(
creditorId: freezed == creditorId ? _self.creditorId : creditorId // ignore: cast_nullable_to_non_nullable
as String?,range: freezed == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as DateRange?,
  ));
}

/// Create a copy of PhotoFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DateRangeCopyWith<$Res>? get range {
    if (_self.range == null) {
    return null;
  }

  return $DateRangeCopyWith<$Res>(_self.range!, (value) {
    return _then(_self.copyWith(range: value));
  });
}
}

// dart format on
