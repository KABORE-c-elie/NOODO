// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_chart_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChartBar {

 DateTime get day; int get netFcfa; double get ratio;
/// Create a copy of ChartBar
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartBarCopyWith<ChartBar> get copyWith => _$ChartBarCopyWithImpl<ChartBar>(this as ChartBar, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChartBar;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartBar&&(identical(other.day, _this.day) || other.day == _this.day)&&(identical(other.netFcfa, _this.netFcfa) || other.netFcfa == _this.netFcfa)&&(identical(other.ratio, _this.ratio) || other.ratio == _this.ratio));
}


@override
int get hashCode {
  final _this = this as ChartBar;
  return Object.hash(runtimeType,_this.day,_this.netFcfa,_this.ratio);
}

@override
String toString() {
  final _this = this as ChartBar;
  return 'ChartBar(day: ${_this.day}, netFcfa: ${_this.netFcfa}, ratio: ${_this.ratio})';
}


}

/// @nodoc
abstract mixin class $ChartBarCopyWith<$Res>  {
  factory $ChartBarCopyWith(ChartBar value, $Res Function(ChartBar) _then) = _$ChartBarCopyWithImpl;
@useResult
$Res call({
 DateTime day, int netFcfa, double ratio
});




}
/// @nodoc
class _$ChartBarCopyWithImpl<$Res>
    implements $ChartBarCopyWith<$Res> {
  _$ChartBarCopyWithImpl(this._self, this._then);

  final ChartBar _self;
  final $Res Function(ChartBar) _then;

/// Create a copy of ChartBar
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? netFcfa = null,Object? ratio = null,}) {
  return _then(ChartBar(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DateTime,netFcfa: null == netFcfa ? _self.netFcfa : netFcfa // ignore: cast_nullable_to_non_nullable
as int,ratio: null == ratio ? _self.ratio : ratio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartBar].
extension ChartBarPatterns on ChartBar {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartBar value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartBar() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartBar value)  $default,){
final _that = this;
switch (_that) {
case _ChartBar():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartBar value)?  $default,){
final _that = this;
switch (_that) {
case _ChartBar() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime day,  int netFcfa,  double ratio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartBar() when $default != null:
return $default(_that.day,_that.netFcfa,_that.ratio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime day,  int netFcfa,  double ratio)  $default,) {final _that = this;
switch (_that) {
case _ChartBar():
return $default(_that.day,_that.netFcfa,_that.ratio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime day,  int netFcfa,  double ratio)?  $default,) {final _that = this;
switch (_that) {
case _ChartBar() when $default != null:
return $default(_that.day,_that.netFcfa,_that.ratio);case _:
  return null;

}
}

}

/// @nodoc


class _ChartBar implements ChartBar {
  const _ChartBar({required this.day, required this.netFcfa, required this.ratio});
  

@override final  DateTime day;
@override final  int netFcfa;
@override final  double ratio;

/// Create a copy of ChartBar
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartBarCopyWith<_ChartBar> get copyWith => __$ChartBarCopyWithImpl<_ChartBar>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartBar&&(identical(other.day, day) || other.day == day)&&(identical(other.netFcfa, netFcfa) || other.netFcfa == netFcfa)&&(identical(other.ratio, ratio) || other.ratio == ratio));
}


@override
int get hashCode {
    return Object.hash(runtimeType,day,netFcfa,ratio);
}

@override
String toString() {
    return 'ChartBar(day: $day, netFcfa: $netFcfa, ratio: $ratio)';
}


}

/// @nodoc
abstract mixin class _$ChartBarCopyWith<$Res> implements $ChartBarCopyWith<$Res> {
  factory _$ChartBarCopyWith(_ChartBar value, $Res Function(_ChartBar) _then) = __$ChartBarCopyWithImpl;
@override @useResult
$Res call({
 DateTime day, int netFcfa, double ratio
});




}
/// @nodoc
class __$ChartBarCopyWithImpl<$Res>
    implements _$ChartBarCopyWith<$Res> {
  __$ChartBarCopyWithImpl(this._self, this._then);

  final _ChartBar _self;
  final $Res Function(_ChartBar) _then;

/// Create a copy of ChartBar
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? netFcfa = null,Object? ratio = null,}) {
  return _then(_ChartBar(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DateTime,netFcfa: null == netFcfa ? _self.netFcfa : netFcfa // ignore: cast_nullable_to_non_nullable
as int,ratio: null == ratio ? _self.ratio : ratio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$ProfitChartData {

 List<ChartBar> get bars; double get zeroLine;
/// Create a copy of ProfitChartData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitChartDataCopyWith<ProfitChartData> get copyWith => _$ProfitChartDataCopyWithImpl<ProfitChartData>(this as ProfitChartData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProfitChartData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitChartData&&const DeepCollectionEquality().equals(other.bars, _this.bars)&&(identical(other.zeroLine, _this.zeroLine) || other.zeroLine == _this.zeroLine));
}


@override
int get hashCode {
  final _this = this as ProfitChartData;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.bars),_this.zeroLine);
}

@override
String toString() {
  final _this = this as ProfitChartData;
  return 'ProfitChartData(bars: ${_this.bars}, zeroLine: ${_this.zeroLine})';
}


}

/// @nodoc
abstract mixin class $ProfitChartDataCopyWith<$Res>  {
  factory $ProfitChartDataCopyWith(ProfitChartData value, $Res Function(ProfitChartData) _then) = _$ProfitChartDataCopyWithImpl;
@useResult
$Res call({
 List<ChartBar> bars, double zeroLine
});




}
/// @nodoc
class _$ProfitChartDataCopyWithImpl<$Res>
    implements $ProfitChartDataCopyWith<$Res> {
  _$ProfitChartDataCopyWithImpl(this._self, this._then);

  final ProfitChartData _self;
  final $Res Function(ProfitChartData) _then;

/// Create a copy of ProfitChartData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bars = null,Object? zeroLine = null,}) {
  return _then(ProfitChartData(
bars: null == bars ? _self.bars : bars // ignore: cast_nullable_to_non_nullable
as List<ChartBar>,zeroLine: null == zeroLine ? _self.zeroLine : zeroLine // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfitChartData].
extension ProfitChartDataPatterns on ProfitChartData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitChartData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitChartData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitChartData value)  $default,){
final _that = this;
switch (_that) {
case _ProfitChartData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitChartData value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitChartData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChartBar> bars,  double zeroLine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitChartData() when $default != null:
return $default(_that.bars,_that.zeroLine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChartBar> bars,  double zeroLine)  $default,) {final _that = this;
switch (_that) {
case _ProfitChartData():
return $default(_that.bars,_that.zeroLine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChartBar> bars,  double zeroLine)?  $default,) {final _that = this;
switch (_that) {
case _ProfitChartData() when $default != null:
return $default(_that.bars,_that.zeroLine);case _:
  return null;

}
}

}

/// @nodoc


class _ProfitChartData extends ProfitChartData {
  const _ProfitChartData({required  List<ChartBar> bars, required this.zeroLine}): _bars = bars,super._();
  

 final  List<ChartBar> _bars;
@override List<ChartBar> get bars {
  if (_bars is EqualUnmodifiableListView) return _bars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bars);
}

@override final  double zeroLine;

/// Create a copy of ProfitChartData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitChartDataCopyWith<_ProfitChartData> get copyWith => __$ProfitChartDataCopyWithImpl<_ProfitChartData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitChartData&&const DeepCollectionEquality().equals(other.bars, _bars)&&(identical(other.zeroLine, zeroLine) || other.zeroLine == zeroLine));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_bars),zeroLine);
}

@override
String toString() {
    return 'ProfitChartData(bars: $bars, zeroLine: $zeroLine)';
}


}

/// @nodoc
abstract mixin class _$ProfitChartDataCopyWith<$Res> implements $ProfitChartDataCopyWith<$Res> {
  factory _$ProfitChartDataCopyWith(_ProfitChartData value, $Res Function(_ProfitChartData) _then) = __$ProfitChartDataCopyWithImpl;
@override @useResult
$Res call({
 List<ChartBar> bars, double zeroLine
});




}
/// @nodoc
class __$ProfitChartDataCopyWithImpl<$Res>
    implements _$ProfitChartDataCopyWith<$Res> {
  __$ProfitChartDataCopyWithImpl(this._self, this._then);

  final _ProfitChartData _self;
  final $Res Function(_ProfitChartData) _then;

/// Create a copy of ProfitChartData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bars = null,Object? zeroLine = null,}) {
  return _then(_ProfitChartData(
bars: null == bars ? _self._bars : bars // ignore: cast_nullable_to_non_nullable
as List<ChartBar>,zeroLine: null == zeroLine ? _self.zeroLine : zeroLine // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
