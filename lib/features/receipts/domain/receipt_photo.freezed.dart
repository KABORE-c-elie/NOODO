// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReceiptPhoto {

 String get id; String get fileName; String? get creditorId; String? get transactionId; String? get paymentId; DateTime get takenAt;
/// Create a copy of ReceiptPhoto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptPhotoCopyWith<ReceiptPhoto> get copyWith => _$ReceiptPhotoCopyWithImpl<ReceiptPhoto>(this as ReceiptPhoto, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReceiptPhoto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiptPhoto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.fileName, _this.fileName) || other.fileName == _this.fileName)&&(identical(other.creditorId, _this.creditorId) || other.creditorId == _this.creditorId)&&(identical(other.transactionId, _this.transactionId) || other.transactionId == _this.transactionId)&&(identical(other.paymentId, _this.paymentId) || other.paymentId == _this.paymentId)&&(identical(other.takenAt, _this.takenAt) || other.takenAt == _this.takenAt));
}


@override
int get hashCode {
  final _this = this as ReceiptPhoto;
  return Object.hash(runtimeType,_this.id,_this.fileName,_this.creditorId,_this.transactionId,_this.paymentId,_this.takenAt);
}

@override
String toString() {
  final _this = this as ReceiptPhoto;
  return 'ReceiptPhoto(id: ${_this.id}, fileName: ${_this.fileName}, creditorId: ${_this.creditorId}, transactionId: ${_this.transactionId}, paymentId: ${_this.paymentId}, takenAt: ${_this.takenAt})';
}


}

/// @nodoc
abstract mixin class $ReceiptPhotoCopyWith<$Res>  {
  factory $ReceiptPhotoCopyWith(ReceiptPhoto value, $Res Function(ReceiptPhoto) _then) = _$ReceiptPhotoCopyWithImpl;
@useResult
$Res call({
 String id, String fileName, String? creditorId, String? transactionId, String? paymentId, DateTime takenAt
});




}
/// @nodoc
class _$ReceiptPhotoCopyWithImpl<$Res>
    implements $ReceiptPhotoCopyWith<$Res> {
  _$ReceiptPhotoCopyWithImpl(this._self, this._then);

  final ReceiptPhoto _self;
  final $Res Function(ReceiptPhoto) _then;

/// Create a copy of ReceiptPhoto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileName = null,Object? creditorId = freezed,Object? transactionId = freezed,Object? paymentId = freezed,Object? takenAt = null,}) {
  return _then(ReceiptPhoto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,creditorId: freezed == creditorId ? _self.creditorId : creditorId // ignore: cast_nullable_to_non_nullable
as String?,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,paymentId: freezed == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String?,takenAt: null == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ReceiptPhoto].
extension ReceiptPhotoPatterns on ReceiptPhoto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiptPhoto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiptPhoto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiptPhoto value)  $default,){
final _that = this;
switch (_that) {
case _ReceiptPhoto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiptPhoto value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiptPhoto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fileName,  String? creditorId,  String? transactionId,  String? paymentId,  DateTime takenAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiptPhoto() when $default != null:
return $default(_that.id,_that.fileName,_that.creditorId,_that.transactionId,_that.paymentId,_that.takenAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fileName,  String? creditorId,  String? transactionId,  String? paymentId,  DateTime takenAt)  $default,) {final _that = this;
switch (_that) {
case _ReceiptPhoto():
return $default(_that.id,_that.fileName,_that.creditorId,_that.transactionId,_that.paymentId,_that.takenAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fileName,  String? creditorId,  String? transactionId,  String? paymentId,  DateTime takenAt)?  $default,) {final _that = this;
switch (_that) {
case _ReceiptPhoto() when $default != null:
return $default(_that.id,_that.fileName,_that.creditorId,_that.transactionId,_that.paymentId,_that.takenAt);case _:
  return null;

}
}

}

/// @nodoc


class _ReceiptPhoto implements ReceiptPhoto {
  const _ReceiptPhoto({required this.id, required this.fileName, this.creditorId, this.transactionId, this.paymentId, required this.takenAt});
  

@override final  String id;
@override final  String fileName;
@override final  String? creditorId;
@override final  String? transactionId;
@override final  String? paymentId;
@override final  DateTime takenAt;

/// Create a copy of ReceiptPhoto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptPhotoCopyWith<_ReceiptPhoto> get copyWith => __$ReceiptPhotoCopyWithImpl<_ReceiptPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiptPhoto&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.creditorId, creditorId) || other.creditorId == creditorId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.takenAt, takenAt) || other.takenAt == takenAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,fileName,creditorId,transactionId,paymentId,takenAt);
}

@override
String toString() {
    return 'ReceiptPhoto(id: $id, fileName: $fileName, creditorId: $creditorId, transactionId: $transactionId, paymentId: $paymentId, takenAt: $takenAt)';
}


}

/// @nodoc
abstract mixin class _$ReceiptPhotoCopyWith<$Res> implements $ReceiptPhotoCopyWith<$Res> {
  factory _$ReceiptPhotoCopyWith(_ReceiptPhoto value, $Res Function(_ReceiptPhoto) _then) = __$ReceiptPhotoCopyWithImpl;
@override @useResult
$Res call({
 String id, String fileName, String? creditorId, String? transactionId, String? paymentId, DateTime takenAt
});




}
/// @nodoc
class __$ReceiptPhotoCopyWithImpl<$Res>
    implements _$ReceiptPhotoCopyWith<$Res> {
  __$ReceiptPhotoCopyWithImpl(this._self, this._then);

  final _ReceiptPhoto _self;
  final $Res Function(_ReceiptPhoto) _then;

/// Create a copy of ReceiptPhoto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileName = null,Object? creditorId = freezed,Object? transactionId = freezed,Object? paymentId = freezed,Object? takenAt = null,}) {
  return _then(_ReceiptPhoto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,creditorId: freezed == creditorId ? _self.creditorId : creditorId // ignore: cast_nullable_to_non_nullable
as String?,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,paymentId: freezed == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String?,takenAt: null == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$PhotoQuery {

 String? get creditorId; DateRange? get range;
/// Create a copy of PhotoQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoQueryCopyWith<PhotoQuery> get copyWith => _$PhotoQueryCopyWithImpl<PhotoQuery>(this as PhotoQuery, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PhotoQuery;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoQuery&&(identical(other.creditorId, _this.creditorId) || other.creditorId == _this.creditorId)&&(identical(other.range, _this.range) || other.range == _this.range));
}


@override
int get hashCode {
  final _this = this as PhotoQuery;
  return Object.hash(runtimeType,_this.creditorId,_this.range);
}

@override
String toString() {
  final _this = this as PhotoQuery;
  return 'PhotoQuery(creditorId: ${_this.creditorId}, range: ${_this.range})';
}


}

/// @nodoc
abstract mixin class $PhotoQueryCopyWith<$Res>  {
  factory $PhotoQueryCopyWith(PhotoQuery value, $Res Function(PhotoQuery) _then) = _$PhotoQueryCopyWithImpl;
@useResult
$Res call({
 String? creditorId, DateRange? range
});


$DateRangeCopyWith<$Res>? get range;

}
/// @nodoc
class _$PhotoQueryCopyWithImpl<$Res>
    implements $PhotoQueryCopyWith<$Res> {
  _$PhotoQueryCopyWithImpl(this._self, this._then);

  final PhotoQuery _self;
  final $Res Function(PhotoQuery) _then;

/// Create a copy of PhotoQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? creditorId = freezed,Object? range = freezed,}) {
  return _then(PhotoQuery(
creditorId: freezed == creditorId ? _self.creditorId : creditorId // ignore: cast_nullable_to_non_nullable
as String?,range: freezed == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as DateRange?,
  ));
}
/// Create a copy of PhotoQuery
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


/// Adds pattern-matching-related methods to [PhotoQuery].
extension PhotoQueryPatterns on PhotoQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoQuery value)  $default,){
final _that = this;
switch (_that) {
case _PhotoQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoQuery value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoQuery() when $default != null:
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
case _PhotoQuery() when $default != null:
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
case _PhotoQuery():
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
case _PhotoQuery() when $default != null:
return $default(_that.creditorId,_that.range);case _:
  return null;

}
}

}

/// @nodoc


class _PhotoQuery implements PhotoQuery {
  const _PhotoQuery({this.creditorId, this.range});
  

@override final  String? creditorId;
@override final  DateRange? range;

/// Create a copy of PhotoQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoQueryCopyWith<_PhotoQuery> get copyWith => __$PhotoQueryCopyWithImpl<_PhotoQuery>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoQuery&&(identical(other.creditorId, creditorId) || other.creditorId == creditorId)&&(identical(other.range, range) || other.range == range));
}


@override
int get hashCode {
    return Object.hash(runtimeType,creditorId,range);
}

@override
String toString() {
    return 'PhotoQuery(creditorId: $creditorId, range: $range)';
}


}

/// @nodoc
abstract mixin class _$PhotoQueryCopyWith<$Res> implements $PhotoQueryCopyWith<$Res> {
  factory _$PhotoQueryCopyWith(_PhotoQuery value, $Res Function(_PhotoQuery) _then) = __$PhotoQueryCopyWithImpl;
@override @useResult
$Res call({
 String? creditorId, DateRange? range
});


@override $DateRangeCopyWith<$Res>? get range;

}
/// @nodoc
class __$PhotoQueryCopyWithImpl<$Res>
    implements _$PhotoQueryCopyWith<$Res> {
  __$PhotoQueryCopyWithImpl(this._self, this._then);

  final _PhotoQuery _self;
  final $Res Function(_PhotoQuery) _then;

/// Create a copy of PhotoQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? creditorId = freezed,Object? range = freezed,}) {
  return _then(_PhotoQuery(
creditorId: freezed == creditorId ? _self.creditorId : creditorId // ignore: cast_nullable_to_non_nullable
as String?,range: freezed == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as DateRange?,
  ));
}

/// Create a copy of PhotoQuery
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
