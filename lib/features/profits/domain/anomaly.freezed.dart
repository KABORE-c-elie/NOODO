// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anomaly.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Anomaly {

 AnomalyType get type; DateTime get day; int get amountFcfa; int get averageFcfa; TransactionCategory? get category; String? get label;
/// Create a copy of Anomaly
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnomalyCopyWith<Anomaly> get copyWith => _$AnomalyCopyWithImpl<Anomaly>(this as Anomaly, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Anomaly;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Anomaly&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.day, _this.day) || other.day == _this.day)&&(identical(other.amountFcfa, _this.amountFcfa) || other.amountFcfa == _this.amountFcfa)&&(identical(other.averageFcfa, _this.averageFcfa) || other.averageFcfa == _this.averageFcfa)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.label, _this.label) || other.label == _this.label));
}


@override
int get hashCode {
  final _this = this as Anomaly;
  return Object.hash(runtimeType,_this.type,_this.day,_this.amountFcfa,_this.averageFcfa,_this.category,_this.label);
}

@override
String toString() {
  final _this = this as Anomaly;
  return 'Anomaly(type: ${_this.type}, day: ${_this.day}, amountFcfa: ${_this.amountFcfa}, averageFcfa: ${_this.averageFcfa}, category: ${_this.category}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $AnomalyCopyWith<$Res>  {
  factory $AnomalyCopyWith(Anomaly value, $Res Function(Anomaly) _then) = _$AnomalyCopyWithImpl;
@useResult
$Res call({
 AnomalyType type, DateTime day, int amountFcfa, int averageFcfa, TransactionCategory? category, String? label
});




}
/// @nodoc
class _$AnomalyCopyWithImpl<$Res>
    implements $AnomalyCopyWith<$Res> {
  _$AnomalyCopyWithImpl(this._self, this._then);

  final Anomaly _self;
  final $Res Function(Anomaly) _then;

/// Create a copy of Anomaly
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? day = null,Object? amountFcfa = null,Object? averageFcfa = null,Object? category = freezed,Object? label = freezed,}) {
  return _then(Anomaly(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnomalyType,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DateTime,amountFcfa: null == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int,averageFcfa: null == averageFcfa ? _self.averageFcfa : averageFcfa // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Anomaly].
extension AnomalyPatterns on Anomaly {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Anomaly value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Anomaly() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Anomaly value)  $default,){
final _that = this;
switch (_that) {
case _Anomaly():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Anomaly value)?  $default,){
final _that = this;
switch (_that) {
case _Anomaly() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnomalyType type,  DateTime day,  int amountFcfa,  int averageFcfa,  TransactionCategory? category,  String? label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Anomaly() when $default != null:
return $default(_that.type,_that.day,_that.amountFcfa,_that.averageFcfa,_that.category,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnomalyType type,  DateTime day,  int amountFcfa,  int averageFcfa,  TransactionCategory? category,  String? label)  $default,) {final _that = this;
switch (_that) {
case _Anomaly():
return $default(_that.type,_that.day,_that.amountFcfa,_that.averageFcfa,_that.category,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnomalyType type,  DateTime day,  int amountFcfa,  int averageFcfa,  TransactionCategory? category,  String? label)?  $default,) {final _that = this;
switch (_that) {
case _Anomaly() when $default != null:
return $default(_that.type,_that.day,_that.amountFcfa,_that.averageFcfa,_that.category,_that.label);case _:
  return null;

}
}

}

/// @nodoc


class _Anomaly implements Anomaly {
  const _Anomaly({required this.type, required this.day, required this.amountFcfa, required this.averageFcfa, this.category, this.label});
  

@override final  AnomalyType type;
@override final  DateTime day;
@override final  int amountFcfa;
@override final  int averageFcfa;
@override final  TransactionCategory? category;
@override final  String? label;

/// Create a copy of Anomaly
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnomalyCopyWith<_Anomaly> get copyWith => __$AnomalyCopyWithImpl<_Anomaly>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Anomaly&&(identical(other.type, type) || other.type == type)&&(identical(other.day, day) || other.day == day)&&(identical(other.amountFcfa, amountFcfa) || other.amountFcfa == amountFcfa)&&(identical(other.averageFcfa, averageFcfa) || other.averageFcfa == averageFcfa)&&(identical(other.category, category) || other.category == category)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode {
    return Object.hash(runtimeType,type,day,amountFcfa,averageFcfa,category,label);
}

@override
String toString() {
    return 'Anomaly(type: $type, day: $day, amountFcfa: $amountFcfa, averageFcfa: $averageFcfa, category: $category, label: $label)';
}


}

/// @nodoc
abstract mixin class _$AnomalyCopyWith<$Res> implements $AnomalyCopyWith<$Res> {
  factory _$AnomalyCopyWith(_Anomaly value, $Res Function(_Anomaly) _then) = __$AnomalyCopyWithImpl;
@override @useResult
$Res call({
 AnomalyType type, DateTime day, int amountFcfa, int averageFcfa, TransactionCategory? category, String? label
});




}
/// @nodoc
class __$AnomalyCopyWithImpl<$Res>
    implements _$AnomalyCopyWith<$Res> {
  __$AnomalyCopyWithImpl(this._self, this._then);

  final _Anomaly _self;
  final $Res Function(_Anomaly) _then;

/// Create a copy of Anomaly
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? day = null,Object? amountFcfa = null,Object? averageFcfa = null,Object? category = freezed,Object? label = freezed,}) {
  return _then(_Anomaly(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnomalyType,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DateTime,amountFcfa: null == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int,averageFcfa: null == averageFcfa ? _self.averageFcfa : averageFcfa // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
