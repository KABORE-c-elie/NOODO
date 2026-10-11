// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_planner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlannedReminder {

 int get id; ReminderKind get kind; DateTime get at; DateTime get dueDate; String? get creditorId; String? get creditorName; int? get amountFcfa;
/// Create a copy of PlannedReminder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlannedReminderCopyWith<PlannedReminder> get copyWith => _$PlannedReminderCopyWithImpl<PlannedReminder>(this as PlannedReminder, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlannedReminder;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlannedReminder&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.dueDate, _this.dueDate) || other.dueDate == _this.dueDate)&&(identical(other.creditorId, _this.creditorId) || other.creditorId == _this.creditorId)&&(identical(other.creditorName, _this.creditorName) || other.creditorName == _this.creditorName)&&(identical(other.amountFcfa, _this.amountFcfa) || other.amountFcfa == _this.amountFcfa));
}


@override
int get hashCode {
  final _this = this as PlannedReminder;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.at,_this.dueDate,_this.creditorId,_this.creditorName,_this.amountFcfa);
}

@override
String toString() {
  final _this = this as PlannedReminder;
  return 'PlannedReminder(id: ${_this.id}, kind: ${_this.kind}, at: ${_this.at}, dueDate: ${_this.dueDate}, creditorId: ${_this.creditorId}, creditorName: ${_this.creditorName}, amountFcfa: ${_this.amountFcfa})';
}


}

/// @nodoc
abstract mixin class $PlannedReminderCopyWith<$Res>  {
  factory $PlannedReminderCopyWith(PlannedReminder value, $Res Function(PlannedReminder) _then) = _$PlannedReminderCopyWithImpl;
@useResult
$Res call({
 int id, ReminderKind kind, DateTime at, DateTime dueDate, String? creditorId, String? creditorName, int? amountFcfa
});




}
/// @nodoc
class _$PlannedReminderCopyWithImpl<$Res>
    implements $PlannedReminderCopyWith<$Res> {
  _$PlannedReminderCopyWithImpl(this._self, this._then);

  final PlannedReminder _self;
  final $Res Function(PlannedReminder) _then;

/// Create a copy of PlannedReminder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? at = null,Object? dueDate = null,Object? creditorId = freezed,Object? creditorName = freezed,Object? amountFcfa = freezed,}) {
  return _then(PlannedReminder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ReminderKind,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,creditorId: freezed == creditorId ? _self.creditorId : creditorId // ignore: cast_nullable_to_non_nullable
as String?,creditorName: freezed == creditorName ? _self.creditorName : creditorName // ignore: cast_nullable_to_non_nullable
as String?,amountFcfa: freezed == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlannedReminder].
extension PlannedReminderPatterns on PlannedReminder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlannedReminder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlannedReminder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlannedReminder value)  $default,){
final _that = this;
switch (_that) {
case _PlannedReminder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlannedReminder value)?  $default,){
final _that = this;
switch (_that) {
case _PlannedReminder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  ReminderKind kind,  DateTime at,  DateTime dueDate,  String? creditorId,  String? creditorName,  int? amountFcfa)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlannedReminder() when $default != null:
return $default(_that.id,_that.kind,_that.at,_that.dueDate,_that.creditorId,_that.creditorName,_that.amountFcfa);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  ReminderKind kind,  DateTime at,  DateTime dueDate,  String? creditorId,  String? creditorName,  int? amountFcfa)  $default,) {final _that = this;
switch (_that) {
case _PlannedReminder():
return $default(_that.id,_that.kind,_that.at,_that.dueDate,_that.creditorId,_that.creditorName,_that.amountFcfa);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  ReminderKind kind,  DateTime at,  DateTime dueDate,  String? creditorId,  String? creditorName,  int? amountFcfa)?  $default,) {final _that = this;
switch (_that) {
case _PlannedReminder() when $default != null:
return $default(_that.id,_that.kind,_that.at,_that.dueDate,_that.creditorId,_that.creditorName,_that.amountFcfa);case _:
  return null;

}
}

}

/// @nodoc


class _PlannedReminder implements PlannedReminder {
  const _PlannedReminder({required this.id, required this.kind, required this.at, required this.dueDate, this.creditorId, this.creditorName, this.amountFcfa});
  

@override final  int id;
@override final  ReminderKind kind;
@override final  DateTime at;
@override final  DateTime dueDate;
@override final  String? creditorId;
@override final  String? creditorName;
@override final  int? amountFcfa;

/// Create a copy of PlannedReminder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlannedReminderCopyWith<_PlannedReminder> get copyWith => __$PlannedReminderCopyWithImpl<_PlannedReminder>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlannedReminder&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.at, at) || other.at == at)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.creditorId, creditorId) || other.creditorId == creditorId)&&(identical(other.creditorName, creditorName) || other.creditorName == creditorName)&&(identical(other.amountFcfa, amountFcfa) || other.amountFcfa == amountFcfa));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,at,dueDate,creditorId,creditorName,amountFcfa);
}

@override
String toString() {
    return 'PlannedReminder(id: $id, kind: $kind, at: $at, dueDate: $dueDate, creditorId: $creditorId, creditorName: $creditorName, amountFcfa: $amountFcfa)';
}


}

/// @nodoc
abstract mixin class _$PlannedReminderCopyWith<$Res> implements $PlannedReminderCopyWith<$Res> {
  factory _$PlannedReminderCopyWith(_PlannedReminder value, $Res Function(_PlannedReminder) _then) = __$PlannedReminderCopyWithImpl;
@override @useResult
$Res call({
 int id, ReminderKind kind, DateTime at, DateTime dueDate, String? creditorId, String? creditorName, int? amountFcfa
});




}
/// @nodoc
class __$PlannedReminderCopyWithImpl<$Res>
    implements _$PlannedReminderCopyWith<$Res> {
  __$PlannedReminderCopyWithImpl(this._self, this._then);

  final _PlannedReminder _self;
  final $Res Function(_PlannedReminder) _then;

/// Create a copy of PlannedReminder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? at = null,Object? dueDate = null,Object? creditorId = freezed,Object? creditorName = freezed,Object? amountFcfa = freezed,}) {
  return _then(_PlannedReminder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ReminderKind,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,creditorId: freezed == creditorId ? _self.creditorId : creditorId // ignore: cast_nullable_to_non_nullable
as String?,creditorName: freezed == creditorName ? _self.creditorName : creditorName // ignore: cast_nullable_to_non_nullable
as String?,amountFcfa: freezed == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$ScheduledReminder {

 int get id; DateTime get at; String get title; String get body;
/// Create a copy of ScheduledReminder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduledReminderCopyWith<ScheduledReminder> get copyWith => _$ScheduledReminderCopyWithImpl<ScheduledReminder>(this as ScheduledReminder, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ScheduledReminder;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduledReminder&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body));
}


@override
int get hashCode {
  final _this = this as ScheduledReminder;
  return Object.hash(runtimeType,_this.id,_this.at,_this.title,_this.body);
}

@override
String toString() {
  final _this = this as ScheduledReminder;
  return 'ScheduledReminder(id: ${_this.id}, at: ${_this.at}, title: ${_this.title}, body: ${_this.body})';
}


}

/// @nodoc
abstract mixin class $ScheduledReminderCopyWith<$Res>  {
  factory $ScheduledReminderCopyWith(ScheduledReminder value, $Res Function(ScheduledReminder) _then) = _$ScheduledReminderCopyWithImpl;
@useResult
$Res call({
 int id, DateTime at, String title, String body
});




}
/// @nodoc
class _$ScheduledReminderCopyWithImpl<$Res>
    implements $ScheduledReminderCopyWith<$Res> {
  _$ScheduledReminderCopyWithImpl(this._self, this._then);

  final ScheduledReminder _self;
  final $Res Function(ScheduledReminder) _then;

/// Create a copy of ScheduledReminder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? at = null,Object? title = null,Object? body = null,}) {
  return _then(ScheduledReminder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduledReminder].
extension ScheduledReminderPatterns on ScheduledReminder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduledReminder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduledReminder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduledReminder value)  $default,){
final _that = this;
switch (_that) {
case _ScheduledReminder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduledReminder value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduledReminder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime at,  String title,  String body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduledReminder() when $default != null:
return $default(_that.id,_that.at,_that.title,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime at,  String title,  String body)  $default,) {final _that = this;
switch (_that) {
case _ScheduledReminder():
return $default(_that.id,_that.at,_that.title,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime at,  String title,  String body)?  $default,) {final _that = this;
switch (_that) {
case _ScheduledReminder() when $default != null:
return $default(_that.id,_that.at,_that.title,_that.body);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduledReminder implements ScheduledReminder {
  const _ScheduledReminder({required this.id, required this.at, required this.title, required this.body});
  

@override final  int id;
@override final  DateTime at;
@override final  String title;
@override final  String body;

/// Create a copy of ScheduledReminder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduledReminderCopyWith<_ScheduledReminder> get copyWith => __$ScheduledReminderCopyWithImpl<_ScheduledReminder>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduledReminder&&(identical(other.id, id) || other.id == id)&&(identical(other.at, at) || other.at == at)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,at,title,body);
}

@override
String toString() {
    return 'ScheduledReminder(id: $id, at: $at, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class _$ScheduledReminderCopyWith<$Res> implements $ScheduledReminderCopyWith<$Res> {
  factory _$ScheduledReminderCopyWith(_ScheduledReminder value, $Res Function(_ScheduledReminder) _then) = __$ScheduledReminderCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime at, String title, String body
});




}
/// @nodoc
class __$ScheduledReminderCopyWithImpl<$Res>
    implements _$ScheduledReminderCopyWith<$Res> {
  __$ScheduledReminderCopyWithImpl(this._self, this._then);

  final _ScheduledReminder _self;
  final $Res Function(_ScheduledReminder) _then;

/// Create a copy of ScheduledReminder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? at = null,Object? title = null,Object? body = null,}) {
  return _then(_ScheduledReminder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
