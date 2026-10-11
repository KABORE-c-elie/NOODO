// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profits_period_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfitsPeriod {

 PeriodUnit get unit; DateTime get reference; DateTime get today;
/// Create a copy of ProfitsPeriod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitsPeriodCopyWith<ProfitsPeriod> get copyWith => _$ProfitsPeriodCopyWithImpl<ProfitsPeriod>(this as ProfitsPeriod, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProfitsPeriod;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitsPeriod&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&(identical(other.reference, _this.reference) || other.reference == _this.reference)&&(identical(other.today, _this.today) || other.today == _this.today));
}


@override
int get hashCode {
  final _this = this as ProfitsPeriod;
  return Object.hash(runtimeType,_this.unit,_this.reference,_this.today);
}

@override
String toString() {
  final _this = this as ProfitsPeriod;
  return 'ProfitsPeriod(unit: ${_this.unit}, reference: ${_this.reference}, today: ${_this.today})';
}


}

/// @nodoc
abstract mixin class $ProfitsPeriodCopyWith<$Res>  {
  factory $ProfitsPeriodCopyWith(ProfitsPeriod value, $Res Function(ProfitsPeriod) _then) = _$ProfitsPeriodCopyWithImpl;
@useResult
$Res call({
 PeriodUnit unit, DateTime reference, DateTime today
});




}
/// @nodoc
class _$ProfitsPeriodCopyWithImpl<$Res>
    implements $ProfitsPeriodCopyWith<$Res> {
  _$ProfitsPeriodCopyWithImpl(this._self, this._then);

  final ProfitsPeriod _self;
  final $Res Function(ProfitsPeriod) _then;

/// Create a copy of ProfitsPeriod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unit = null,Object? reference = null,Object? today = null,}) {
  return _then(ProfitsPeriod(
unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as PeriodUnit,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as DateTime,today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfitsPeriod].
extension ProfitsPeriodPatterns on ProfitsPeriod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitsPeriod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitsPeriod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitsPeriod value)  $default,){
final _that = this;
switch (_that) {
case _ProfitsPeriod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitsPeriod value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitsPeriod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PeriodUnit unit,  DateTime reference,  DateTime today)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitsPeriod() when $default != null:
return $default(_that.unit,_that.reference,_that.today);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PeriodUnit unit,  DateTime reference,  DateTime today)  $default,) {final _that = this;
switch (_that) {
case _ProfitsPeriod():
return $default(_that.unit,_that.reference,_that.today);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PeriodUnit unit,  DateTime reference,  DateTime today)?  $default,) {final _that = this;
switch (_that) {
case _ProfitsPeriod() when $default != null:
return $default(_that.unit,_that.reference,_that.today);case _:
  return null;

}
}

}

/// @nodoc


class _ProfitsPeriod extends ProfitsPeriod {
  const _ProfitsPeriod({required this.unit, required this.reference, required this.today}): super._();
  

@override final  PeriodUnit unit;
@override final  DateTime reference;
@override final  DateTime today;

/// Create a copy of ProfitsPeriod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitsPeriodCopyWith<_ProfitsPeriod> get copyWith => __$ProfitsPeriodCopyWithImpl<_ProfitsPeriod>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitsPeriod&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.today, today) || other.today == today));
}


@override
int get hashCode {
    return Object.hash(runtimeType,unit,reference,today);
}

@override
String toString() {
    return 'ProfitsPeriod(unit: $unit, reference: $reference, today: $today)';
}


}

/// @nodoc
abstract mixin class _$ProfitsPeriodCopyWith<$Res> implements $ProfitsPeriodCopyWith<$Res> {
  factory _$ProfitsPeriodCopyWith(_ProfitsPeriod value, $Res Function(_ProfitsPeriod) _then) = __$ProfitsPeriodCopyWithImpl;
@override @useResult
$Res call({
 PeriodUnit unit, DateTime reference, DateTime today
});




}
/// @nodoc
class __$ProfitsPeriodCopyWithImpl<$Res>
    implements _$ProfitsPeriodCopyWith<$Res> {
  __$ProfitsPeriodCopyWithImpl(this._self, this._then);

  final _ProfitsPeriod _self;
  final $Res Function(_ProfitsPeriod) _then;

/// Create a copy of ProfitsPeriod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unit = null,Object? reference = null,Object? today = null,}) {
  return _then(_ProfitsPeriod(
unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as PeriodUnit,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as DateTime,today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
