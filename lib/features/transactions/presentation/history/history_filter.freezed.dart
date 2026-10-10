// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryFilter {

 HistoryPeriod get period; TransactionType? get type; TransactionCategory? get category;
/// Create a copy of HistoryFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryFilterCopyWith<HistoryFilter> get copyWith => _$HistoryFilterCopyWithImpl<HistoryFilter>(this as HistoryFilter, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HistoryFilter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryFilter&&(identical(other.period, _this.period) || other.period == _this.period)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.category, _this.category) || other.category == _this.category));
}


@override
int get hashCode {
  final _this = this as HistoryFilter;
  return Object.hash(runtimeType,_this.period,_this.type,_this.category);
}

@override
String toString() {
  final _this = this as HistoryFilter;
  return 'HistoryFilter(period: ${_this.period}, type: ${_this.type}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $HistoryFilterCopyWith<$Res>  {
  factory $HistoryFilterCopyWith(HistoryFilter value, $Res Function(HistoryFilter) _then) = _$HistoryFilterCopyWithImpl;
@useResult
$Res call({
 HistoryPeriod period, TransactionType? type, TransactionCategory? category
});




}
/// @nodoc
class _$HistoryFilterCopyWithImpl<$Res>
    implements $HistoryFilterCopyWith<$Res> {
  _$HistoryFilterCopyWithImpl(this._self, this._then);

  final HistoryFilter _self;
  final $Res Function(HistoryFilter) _then;

/// Create a copy of HistoryFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? type = freezed,Object? category = freezed,}) {
  return _then(HistoryFilter(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as HistoryPeriod,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryFilter].
extension HistoryFilterPatterns on HistoryFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryFilter value)  $default,){
final _that = this;
switch (_that) {
case _HistoryFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryFilter value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HistoryPeriod period,  TransactionType? type,  TransactionCategory? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryFilter() when $default != null:
return $default(_that.period,_that.type,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HistoryPeriod period,  TransactionType? type,  TransactionCategory? category)  $default,) {final _that = this;
switch (_that) {
case _HistoryFilter():
return $default(_that.period,_that.type,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HistoryPeriod period,  TransactionType? type,  TransactionCategory? category)?  $default,) {final _that = this;
switch (_that) {
case _HistoryFilter() when $default != null:
return $default(_that.period,_that.type,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryFilter extends HistoryFilter {
  const _HistoryFilter({this.period = HistoryPeriod.all, this.type, this.category}): super._();
  

@override@JsonKey() final  HistoryPeriod period;
@override final  TransactionType? type;
@override final  TransactionCategory? category;

/// Create a copy of HistoryFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryFilterCopyWith<_HistoryFilter> get copyWith => __$HistoryFilterCopyWithImpl<_HistoryFilter>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryFilter&&(identical(other.period, period) || other.period == period)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode {
    return Object.hash(runtimeType,period,type,category);
}

@override
String toString() {
    return 'HistoryFilter(period: $period, type: $type, category: $category)';
}


}

/// @nodoc
abstract mixin class _$HistoryFilterCopyWith<$Res> implements $HistoryFilterCopyWith<$Res> {
  factory _$HistoryFilterCopyWith(_HistoryFilter value, $Res Function(_HistoryFilter) _then) = __$HistoryFilterCopyWithImpl;
@override @useResult
$Res call({
 HistoryPeriod period, TransactionType? type, TransactionCategory? category
});




}
/// @nodoc
class __$HistoryFilterCopyWithImpl<$Res>
    implements _$HistoryFilterCopyWith<$Res> {
  __$HistoryFilterCopyWithImpl(this._self, this._then);

  final _HistoryFilter _self;
  final $Res Function(_HistoryFilter) _then;

/// Create a copy of HistoryFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? type = freezed,Object? category = freezed,}) {
  return _then(_HistoryFilter(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as HistoryPeriod,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory?,
  ));
}


}

// dart format on
