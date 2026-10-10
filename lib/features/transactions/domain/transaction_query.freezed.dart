// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionQuery {

 DateRange? get range; TransactionType? get type; TransactionCategory? get category;
/// Create a copy of TransactionQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionQueryCopyWith<TransactionQuery> get copyWith => _$TransactionQueryCopyWithImpl<TransactionQuery>(this as TransactionQuery, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TransactionQuery;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionQuery&&(identical(other.range, _this.range) || other.range == _this.range)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.category, _this.category) || other.category == _this.category));
}


@override
int get hashCode {
  final _this = this as TransactionQuery;
  return Object.hash(runtimeType,_this.range,_this.type,_this.category);
}

@override
String toString() {
  final _this = this as TransactionQuery;
  return 'TransactionQuery(range: ${_this.range}, type: ${_this.type}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $TransactionQueryCopyWith<$Res>  {
  factory $TransactionQueryCopyWith(TransactionQuery value, $Res Function(TransactionQuery) _then) = _$TransactionQueryCopyWithImpl;
@useResult
$Res call({
 DateRange? range, TransactionType? type, TransactionCategory? category
});


$DateRangeCopyWith<$Res>? get range;

}
/// @nodoc
class _$TransactionQueryCopyWithImpl<$Res>
    implements $TransactionQueryCopyWith<$Res> {
  _$TransactionQueryCopyWithImpl(this._self, this._then);

  final TransactionQuery _self;
  final $Res Function(TransactionQuery) _then;

/// Create a copy of TransactionQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? range = freezed,Object? type = freezed,Object? category = freezed,}) {
  return _then(TransactionQuery(
range: freezed == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as DateRange?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory?,
  ));
}
/// Create a copy of TransactionQuery
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


/// Adds pattern-matching-related methods to [TransactionQuery].
extension TransactionQueryPatterns on TransactionQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionQuery value)  $default,){
final _that = this;
switch (_that) {
case _TransactionQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionQuery value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateRange? range,  TransactionType? type,  TransactionCategory? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionQuery() when $default != null:
return $default(_that.range,_that.type,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateRange? range,  TransactionType? type,  TransactionCategory? category)  $default,) {final _that = this;
switch (_that) {
case _TransactionQuery():
return $default(_that.range,_that.type,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateRange? range,  TransactionType? type,  TransactionCategory? category)?  $default,) {final _that = this;
switch (_that) {
case _TransactionQuery() when $default != null:
return $default(_that.range,_that.type,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionQuery implements TransactionQuery {
  const _TransactionQuery({this.range, this.type, this.category});
  

@override final  DateRange? range;
@override final  TransactionType? type;
@override final  TransactionCategory? category;

/// Create a copy of TransactionQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionQueryCopyWith<_TransactionQuery> get copyWith => __$TransactionQueryCopyWithImpl<_TransactionQuery>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionQuery&&(identical(other.range, range) || other.range == range)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode {
    return Object.hash(runtimeType,range,type,category);
}

@override
String toString() {
    return 'TransactionQuery(range: $range, type: $type, category: $category)';
}


}

/// @nodoc
abstract mixin class _$TransactionQueryCopyWith<$Res> implements $TransactionQueryCopyWith<$Res> {
  factory _$TransactionQueryCopyWith(_TransactionQuery value, $Res Function(_TransactionQuery) _then) = __$TransactionQueryCopyWithImpl;
@override @useResult
$Res call({
 DateRange? range, TransactionType? type, TransactionCategory? category
});


@override $DateRangeCopyWith<$Res>? get range;

}
/// @nodoc
class __$TransactionQueryCopyWithImpl<$Res>
    implements _$TransactionQueryCopyWith<$Res> {
  __$TransactionQueryCopyWithImpl(this._self, this._then);

  final _TransactionQuery _self;
  final $Res Function(_TransactionQuery) _then;

/// Create a copy of TransactionQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? range = freezed,Object? type = freezed,Object? category = freezed,}) {
  return _then(_TransactionQuery(
range: freezed == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as DateRange?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory?,
  ));
}

/// Create a copy of TransactionQuery
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

/// @nodoc
mixin _$TransactionCursor {

 DateTime get date; String get id;
/// Create a copy of TransactionCursor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCursorCopyWith<TransactionCursor> get copyWith => _$TransactionCursorCopyWithImpl<TransactionCursor>(this as TransactionCursor, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TransactionCursor;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionCursor&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.id, _this.id) || other.id == _this.id));
}


@override
int get hashCode {
  final _this = this as TransactionCursor;
  return Object.hash(runtimeType,_this.date,_this.id);
}

@override
String toString() {
  final _this = this as TransactionCursor;
  return 'TransactionCursor(date: ${_this.date}, id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $TransactionCursorCopyWith<$Res>  {
  factory $TransactionCursorCopyWith(TransactionCursor value, $Res Function(TransactionCursor) _then) = _$TransactionCursorCopyWithImpl;
@useResult
$Res call({
 DateTime date, String id
});




}
/// @nodoc
class _$TransactionCursorCopyWithImpl<$Res>
    implements $TransactionCursorCopyWith<$Res> {
  _$TransactionCursorCopyWithImpl(this._self, this._then);

  final TransactionCursor _self;
  final $Res Function(TransactionCursor) _then;

/// Create a copy of TransactionCursor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? id = null,}) {
  return _then(TransactionCursor(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionCursor].
extension TransactionCursorPatterns on TransactionCursor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionCursor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionCursor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionCursor value)  $default,){
final _that = this;
switch (_that) {
case _TransactionCursor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionCursor value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionCursor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionCursor() when $default != null:
return $default(_that.date,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  String id)  $default,) {final _that = this;
switch (_that) {
case _TransactionCursor():
return $default(_that.date,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  String id)?  $default,) {final _that = this;
switch (_that) {
case _TransactionCursor() when $default != null:
return $default(_that.date,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionCursor implements TransactionCursor {
  const _TransactionCursor({required this.date, required this.id});
  

@override final  DateTime date;
@override final  String id;

/// Create a copy of TransactionCursor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCursorCopyWith<_TransactionCursor> get copyWith => __$TransactionCursorCopyWithImpl<_TransactionCursor>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionCursor&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date,id);
}

@override
String toString() {
    return 'TransactionCursor(date: $date, id: $id)';
}


}

/// @nodoc
abstract mixin class _$TransactionCursorCopyWith<$Res> implements $TransactionCursorCopyWith<$Res> {
  factory _$TransactionCursorCopyWith(_TransactionCursor value, $Res Function(_TransactionCursor) _then) = __$TransactionCursorCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, String id
});




}
/// @nodoc
class __$TransactionCursorCopyWithImpl<$Res>
    implements _$TransactionCursorCopyWith<$Res> {
  __$TransactionCursorCopyWithImpl(this._self, this._then);

  final _TransactionCursor _self;
  final $Res Function(_TransactionCursor) _then;

/// Create a copy of TransactionCursor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? id = null,}) {
  return _then(_TransactionCursor(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
