// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_report_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfitReport {

 ProfitComparison get comparison; List<CategoryProfit> get categories; List<DailyProfit> get daily;
/// Create a copy of ProfitReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitReportCopyWith<ProfitReport> get copyWith => _$ProfitReportCopyWithImpl<ProfitReport>(this as ProfitReport, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProfitReport;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitReport&&(identical(other.comparison, _this.comparison) || other.comparison == _this.comparison)&&const DeepCollectionEquality().equals(other.categories, _this.categories)&&const DeepCollectionEquality().equals(other.daily, _this.daily));
}


@override
int get hashCode {
  final _this = this as ProfitReport;
  return Object.hash(runtimeType,_this.comparison,const DeepCollectionEquality().hash(_this.categories),const DeepCollectionEquality().hash(_this.daily));
}

@override
String toString() {
  final _this = this as ProfitReport;
  return 'ProfitReport(comparison: ${_this.comparison}, categories: ${_this.categories}, daily: ${_this.daily})';
}


}

/// @nodoc
abstract mixin class $ProfitReportCopyWith<$Res>  {
  factory $ProfitReportCopyWith(ProfitReport value, $Res Function(ProfitReport) _then) = _$ProfitReportCopyWithImpl;
@useResult
$Res call({
 ProfitComparison comparison, List<CategoryProfit> categories, List<DailyProfit> daily
});


$ProfitComparisonCopyWith<$Res> get comparison;

}
/// @nodoc
class _$ProfitReportCopyWithImpl<$Res>
    implements $ProfitReportCopyWith<$Res> {
  _$ProfitReportCopyWithImpl(this._self, this._then);

  final ProfitReport _self;
  final $Res Function(ProfitReport) _then;

/// Create a copy of ProfitReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comparison = null,Object? categories = null,Object? daily = null,}) {
  return _then(ProfitReport(
comparison: null == comparison ? _self.comparison : comparison // ignore: cast_nullable_to_non_nullable
as ProfitComparison,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryProfit>,daily: null == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as List<DailyProfit>,
  ));
}
/// Create a copy of ProfitReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitComparisonCopyWith<$Res> get comparison {
  
  return $ProfitComparisonCopyWith<$Res>(_self.comparison, (value) {
    return _then(_self.copyWith(comparison: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfitReport].
extension ProfitReportPatterns on ProfitReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitReport value)  $default,){
final _that = this;
switch (_that) {
case _ProfitReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitReport value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProfitComparison comparison,  List<CategoryProfit> categories,  List<DailyProfit> daily)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitReport() when $default != null:
return $default(_that.comparison,_that.categories,_that.daily);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProfitComparison comparison,  List<CategoryProfit> categories,  List<DailyProfit> daily)  $default,) {final _that = this;
switch (_that) {
case _ProfitReport():
return $default(_that.comparison,_that.categories,_that.daily);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProfitComparison comparison,  List<CategoryProfit> categories,  List<DailyProfit> daily)?  $default,) {final _that = this;
switch (_that) {
case _ProfitReport() when $default != null:
return $default(_that.comparison,_that.categories,_that.daily);case _:
  return null;

}
}

}

/// @nodoc


class _ProfitReport implements ProfitReport {
  const _ProfitReport({required this.comparison, required  List<CategoryProfit> categories, required  List<DailyProfit> daily}): _categories = categories,_daily = daily;
  

@override final  ProfitComparison comparison;
 final  List<CategoryProfit> _categories;
@override List<CategoryProfit> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<DailyProfit> _daily;
@override List<DailyProfit> get daily {
  if (_daily is EqualUnmodifiableListView) return _daily;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_daily);
}


/// Create a copy of ProfitReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitReportCopyWith<_ProfitReport> get copyWith => __$ProfitReportCopyWithImpl<_ProfitReport>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitReport&&(identical(other.comparison, comparison) || other.comparison == comparison)&&const DeepCollectionEquality().equals(other.categories, _categories)&&const DeepCollectionEquality().equals(other.daily, _daily));
}


@override
int get hashCode {
    return Object.hash(runtimeType,comparison,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_daily));
}

@override
String toString() {
    return 'ProfitReport(comparison: $comparison, categories: $categories, daily: $daily)';
}


}

/// @nodoc
abstract mixin class _$ProfitReportCopyWith<$Res> implements $ProfitReportCopyWith<$Res> {
  factory _$ProfitReportCopyWith(_ProfitReport value, $Res Function(_ProfitReport) _then) = __$ProfitReportCopyWithImpl;
@override @useResult
$Res call({
 ProfitComparison comparison, List<CategoryProfit> categories, List<DailyProfit> daily
});


@override $ProfitComparisonCopyWith<$Res> get comparison;

}
/// @nodoc
class __$ProfitReportCopyWithImpl<$Res>
    implements _$ProfitReportCopyWith<$Res> {
  __$ProfitReportCopyWithImpl(this._self, this._then);

  final _ProfitReport _self;
  final $Res Function(_ProfitReport) _then;

/// Create a copy of ProfitReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comparison = null,Object? categories = null,Object? daily = null,}) {
  return _then(_ProfitReport(
comparison: null == comparison ? _self.comparison : comparison // ignore: cast_nullable_to_non_nullable
as ProfitComparison,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryProfit>,daily: null == daily ? _self._daily : daily // ignore: cast_nullable_to_non_nullable
as List<DailyProfit>,
  ));
}

/// Create a copy of ProfitReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitComparisonCopyWith<$Res> get comparison {
  
  return $ProfitComparisonCopyWith<$Res>(_self.comparison, (value) {
    return _then(_self.copyWith(comparison: value));
  });
}
}

// dart format on
