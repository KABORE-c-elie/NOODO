// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfitSummary {

 DateRange get range; int get salesFcfa; int get expensesFcfa;
/// Create a copy of ProfitSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitSummaryCopyWith<ProfitSummary> get copyWith => _$ProfitSummaryCopyWithImpl<ProfitSummary>(this as ProfitSummary, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProfitSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitSummary&&(identical(other.range, _this.range) || other.range == _this.range)&&(identical(other.salesFcfa, _this.salesFcfa) || other.salesFcfa == _this.salesFcfa)&&(identical(other.expensesFcfa, _this.expensesFcfa) || other.expensesFcfa == _this.expensesFcfa));
}


@override
int get hashCode {
  final _this = this as ProfitSummary;
  return Object.hash(runtimeType,_this.range,_this.salesFcfa,_this.expensesFcfa);
}

@override
String toString() {
  final _this = this as ProfitSummary;
  return 'ProfitSummary(range: ${_this.range}, salesFcfa: ${_this.salesFcfa}, expensesFcfa: ${_this.expensesFcfa})';
}


}

/// @nodoc
abstract mixin class $ProfitSummaryCopyWith<$Res>  {
  factory $ProfitSummaryCopyWith(ProfitSummary value, $Res Function(ProfitSummary) _then) = _$ProfitSummaryCopyWithImpl;
@useResult
$Res call({
 DateRange range, int salesFcfa, int expensesFcfa
});


$DateRangeCopyWith<$Res> get range;

}
/// @nodoc
class _$ProfitSummaryCopyWithImpl<$Res>
    implements $ProfitSummaryCopyWith<$Res> {
  _$ProfitSummaryCopyWithImpl(this._self, this._then);

  final ProfitSummary _self;
  final $Res Function(ProfitSummary) _then;

/// Create a copy of ProfitSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? range = null,Object? salesFcfa = null,Object? expensesFcfa = null,}) {
  return _then(ProfitSummary(
range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as DateRange,salesFcfa: null == salesFcfa ? _self.salesFcfa : salesFcfa // ignore: cast_nullable_to_non_nullable
as int,expensesFcfa: null == expensesFcfa ? _self.expensesFcfa : expensesFcfa // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ProfitSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DateRangeCopyWith<$Res> get range {
  
  return $DateRangeCopyWith<$Res>(_self.range, (value) {
    return _then(_self.copyWith(range: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfitSummary].
extension ProfitSummaryPatterns on ProfitSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitSummary value)  $default,){
final _that = this;
switch (_that) {
case _ProfitSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateRange range,  int salesFcfa,  int expensesFcfa)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitSummary() when $default != null:
return $default(_that.range,_that.salesFcfa,_that.expensesFcfa);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateRange range,  int salesFcfa,  int expensesFcfa)  $default,) {final _that = this;
switch (_that) {
case _ProfitSummary():
return $default(_that.range,_that.salesFcfa,_that.expensesFcfa);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateRange range,  int salesFcfa,  int expensesFcfa)?  $default,) {final _that = this;
switch (_that) {
case _ProfitSummary() when $default != null:
return $default(_that.range,_that.salesFcfa,_that.expensesFcfa);case _:
  return null;

}
}

}

/// @nodoc


class _ProfitSummary extends ProfitSummary {
  const _ProfitSummary({required this.range, required this.salesFcfa, required this.expensesFcfa}): super._();
  

@override final  DateRange range;
@override final  int salesFcfa;
@override final  int expensesFcfa;

/// Create a copy of ProfitSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitSummaryCopyWith<_ProfitSummary> get copyWith => __$ProfitSummaryCopyWithImpl<_ProfitSummary>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitSummary&&(identical(other.range, range) || other.range == range)&&(identical(other.salesFcfa, salesFcfa) || other.salesFcfa == salesFcfa)&&(identical(other.expensesFcfa, expensesFcfa) || other.expensesFcfa == expensesFcfa));
}


@override
int get hashCode {
    return Object.hash(runtimeType,range,salesFcfa,expensesFcfa);
}

@override
String toString() {
    return 'ProfitSummary(range: $range, salesFcfa: $salesFcfa, expensesFcfa: $expensesFcfa)';
}


}

/// @nodoc
abstract mixin class _$ProfitSummaryCopyWith<$Res> implements $ProfitSummaryCopyWith<$Res> {
  factory _$ProfitSummaryCopyWith(_ProfitSummary value, $Res Function(_ProfitSummary) _then) = __$ProfitSummaryCopyWithImpl;
@override @useResult
$Res call({
 DateRange range, int salesFcfa, int expensesFcfa
});


@override $DateRangeCopyWith<$Res> get range;

}
/// @nodoc
class __$ProfitSummaryCopyWithImpl<$Res>
    implements _$ProfitSummaryCopyWith<$Res> {
  __$ProfitSummaryCopyWithImpl(this._self, this._then);

  final _ProfitSummary _self;
  final $Res Function(_ProfitSummary) _then;

/// Create a copy of ProfitSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? range = null,Object? salesFcfa = null,Object? expensesFcfa = null,}) {
  return _then(_ProfitSummary(
range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as DateRange,salesFcfa: null == salesFcfa ? _self.salesFcfa : salesFcfa // ignore: cast_nullable_to_non_nullable
as int,expensesFcfa: null == expensesFcfa ? _self.expensesFcfa : expensesFcfa // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ProfitSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DateRangeCopyWith<$Res> get range {
  
  return $DateRangeCopyWith<$Res>(_self.range, (value) {
    return _then(_self.copyWith(range: value));
  });
}
}

/// @nodoc
mixin _$ProfitComparison {

 ProfitSummary get current; ProfitSummary get previous;
/// Create a copy of ProfitComparison
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitComparisonCopyWith<ProfitComparison> get copyWith => _$ProfitComparisonCopyWithImpl<ProfitComparison>(this as ProfitComparison, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProfitComparison;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitComparison&&(identical(other.current, _this.current) || other.current == _this.current)&&(identical(other.previous, _this.previous) || other.previous == _this.previous));
}


@override
int get hashCode {
  final _this = this as ProfitComparison;
  return Object.hash(runtimeType,_this.current,_this.previous);
}

@override
String toString() {
  final _this = this as ProfitComparison;
  return 'ProfitComparison(current: ${_this.current}, previous: ${_this.previous})';
}


}

/// @nodoc
abstract mixin class $ProfitComparisonCopyWith<$Res>  {
  factory $ProfitComparisonCopyWith(ProfitComparison value, $Res Function(ProfitComparison) _then) = _$ProfitComparisonCopyWithImpl;
@useResult
$Res call({
 ProfitSummary current, ProfitSummary previous
});


$ProfitSummaryCopyWith<$Res> get current;$ProfitSummaryCopyWith<$Res> get previous;

}
/// @nodoc
class _$ProfitComparisonCopyWithImpl<$Res>
    implements $ProfitComparisonCopyWith<$Res> {
  _$ProfitComparisonCopyWithImpl(this._self, this._then);

  final ProfitComparison _self;
  final $Res Function(ProfitComparison) _then;

/// Create a copy of ProfitComparison
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = null,Object? previous = null,}) {
  return _then(ProfitComparison(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as ProfitSummary,previous: null == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as ProfitSummary,
  ));
}
/// Create a copy of ProfitComparison
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitSummaryCopyWith<$Res> get current {
  
  return $ProfitSummaryCopyWith<$Res>(_self.current, (value) {
    return _then(_self.copyWith(current: value));
  });
}/// Create a copy of ProfitComparison
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitSummaryCopyWith<$Res> get previous {
  
  return $ProfitSummaryCopyWith<$Res>(_self.previous, (value) {
    return _then(_self.copyWith(previous: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfitComparison].
extension ProfitComparisonPatterns on ProfitComparison {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitComparison value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitComparison() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitComparison value)  $default,){
final _that = this;
switch (_that) {
case _ProfitComparison():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitComparison value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitComparison() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProfitSummary current,  ProfitSummary previous)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitComparison() when $default != null:
return $default(_that.current,_that.previous);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProfitSummary current,  ProfitSummary previous)  $default,) {final _that = this;
switch (_that) {
case _ProfitComparison():
return $default(_that.current,_that.previous);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProfitSummary current,  ProfitSummary previous)?  $default,) {final _that = this;
switch (_that) {
case _ProfitComparison() when $default != null:
return $default(_that.current,_that.previous);case _:
  return null;

}
}

}

/// @nodoc


class _ProfitComparison extends ProfitComparison {
  const _ProfitComparison({required this.current, required this.previous}): super._();
  

@override final  ProfitSummary current;
@override final  ProfitSummary previous;

/// Create a copy of ProfitComparison
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitComparisonCopyWith<_ProfitComparison> get copyWith => __$ProfitComparisonCopyWithImpl<_ProfitComparison>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitComparison&&(identical(other.current, current) || other.current == current)&&(identical(other.previous, previous) || other.previous == previous));
}


@override
int get hashCode {
    return Object.hash(runtimeType,current,previous);
}

@override
String toString() {
    return 'ProfitComparison(current: $current, previous: $previous)';
}


}

/// @nodoc
abstract mixin class _$ProfitComparisonCopyWith<$Res> implements $ProfitComparisonCopyWith<$Res> {
  factory _$ProfitComparisonCopyWith(_ProfitComparison value, $Res Function(_ProfitComparison) _then) = __$ProfitComparisonCopyWithImpl;
@override @useResult
$Res call({
 ProfitSummary current, ProfitSummary previous
});


@override $ProfitSummaryCopyWith<$Res> get current;@override $ProfitSummaryCopyWith<$Res> get previous;

}
/// @nodoc
class __$ProfitComparisonCopyWithImpl<$Res>
    implements _$ProfitComparisonCopyWith<$Res> {
  __$ProfitComparisonCopyWithImpl(this._self, this._then);

  final _ProfitComparison _self;
  final $Res Function(_ProfitComparison) _then;

/// Create a copy of ProfitComparison
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = null,Object? previous = null,}) {
  return _then(_ProfitComparison(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as ProfitSummary,previous: null == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as ProfitSummary,
  ));
}

/// Create a copy of ProfitComparison
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitSummaryCopyWith<$Res> get current {
  
  return $ProfitSummaryCopyWith<$Res>(_self.current, (value) {
    return _then(_self.copyWith(current: value));
  });
}/// Create a copy of ProfitComparison
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitSummaryCopyWith<$Res> get previous {
  
  return $ProfitSummaryCopyWith<$Res>(_self.previous, (value) {
    return _then(_self.copyWith(previous: value));
  });
}
}

/// @nodoc
mixin _$CategoryProfit {

 TransactionCategory get category; int get salesFcfa; int get expensesFcfa;
/// Create a copy of CategoryProfit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryProfitCopyWith<CategoryProfit> get copyWith => _$CategoryProfitCopyWithImpl<CategoryProfit>(this as CategoryProfit, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CategoryProfit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryProfit&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.salesFcfa, _this.salesFcfa) || other.salesFcfa == _this.salesFcfa)&&(identical(other.expensesFcfa, _this.expensesFcfa) || other.expensesFcfa == _this.expensesFcfa));
}


@override
int get hashCode {
  final _this = this as CategoryProfit;
  return Object.hash(runtimeType,_this.category,_this.salesFcfa,_this.expensesFcfa);
}

@override
String toString() {
  final _this = this as CategoryProfit;
  return 'CategoryProfit(category: ${_this.category}, salesFcfa: ${_this.salesFcfa}, expensesFcfa: ${_this.expensesFcfa})';
}


}

/// @nodoc
abstract mixin class $CategoryProfitCopyWith<$Res>  {
  factory $CategoryProfitCopyWith(CategoryProfit value, $Res Function(CategoryProfit) _then) = _$CategoryProfitCopyWithImpl;
@useResult
$Res call({
 TransactionCategory category, int salesFcfa, int expensesFcfa
});




}
/// @nodoc
class _$CategoryProfitCopyWithImpl<$Res>
    implements $CategoryProfitCopyWith<$Res> {
  _$CategoryProfitCopyWithImpl(this._self, this._then);

  final CategoryProfit _self;
  final $Res Function(CategoryProfit) _then;

/// Create a copy of CategoryProfit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? salesFcfa = null,Object? expensesFcfa = null,}) {
  return _then(CategoryProfit(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory,salesFcfa: null == salesFcfa ? _self.salesFcfa : salesFcfa // ignore: cast_nullable_to_non_nullable
as int,expensesFcfa: null == expensesFcfa ? _self.expensesFcfa : expensesFcfa // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryProfit].
extension CategoryProfitPatterns on CategoryProfit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryProfit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryProfit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryProfit value)  $default,){
final _that = this;
switch (_that) {
case _CategoryProfit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryProfit value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryProfit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TransactionCategory category,  int salesFcfa,  int expensesFcfa)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryProfit() when $default != null:
return $default(_that.category,_that.salesFcfa,_that.expensesFcfa);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TransactionCategory category,  int salesFcfa,  int expensesFcfa)  $default,) {final _that = this;
switch (_that) {
case _CategoryProfit():
return $default(_that.category,_that.salesFcfa,_that.expensesFcfa);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TransactionCategory category,  int salesFcfa,  int expensesFcfa)?  $default,) {final _that = this;
switch (_that) {
case _CategoryProfit() when $default != null:
return $default(_that.category,_that.salesFcfa,_that.expensesFcfa);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryProfit extends CategoryProfit {
  const _CategoryProfit({required this.category, required this.salesFcfa, required this.expensesFcfa}): super._();
  

@override final  TransactionCategory category;
@override final  int salesFcfa;
@override final  int expensesFcfa;

/// Create a copy of CategoryProfit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryProfitCopyWith<_CategoryProfit> get copyWith => __$CategoryProfitCopyWithImpl<_CategoryProfit>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryProfit&&(identical(other.category, category) || other.category == category)&&(identical(other.salesFcfa, salesFcfa) || other.salesFcfa == salesFcfa)&&(identical(other.expensesFcfa, expensesFcfa) || other.expensesFcfa == expensesFcfa));
}


@override
int get hashCode {
    return Object.hash(runtimeType,category,salesFcfa,expensesFcfa);
}

@override
String toString() {
    return 'CategoryProfit(category: $category, salesFcfa: $salesFcfa, expensesFcfa: $expensesFcfa)';
}


}

/// @nodoc
abstract mixin class _$CategoryProfitCopyWith<$Res> implements $CategoryProfitCopyWith<$Res> {
  factory _$CategoryProfitCopyWith(_CategoryProfit value, $Res Function(_CategoryProfit) _then) = __$CategoryProfitCopyWithImpl;
@override @useResult
$Res call({
 TransactionCategory category, int salesFcfa, int expensesFcfa
});




}
/// @nodoc
class __$CategoryProfitCopyWithImpl<$Res>
    implements _$CategoryProfitCopyWith<$Res> {
  __$CategoryProfitCopyWithImpl(this._self, this._then);

  final _CategoryProfit _self;
  final $Res Function(_CategoryProfit) _then;

/// Create a copy of CategoryProfit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? salesFcfa = null,Object? expensesFcfa = null,}) {
  return _then(_CategoryProfit(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory,salesFcfa: null == salesFcfa ? _self.salesFcfa : salesFcfa // ignore: cast_nullable_to_non_nullable
as int,expensesFcfa: null == expensesFcfa ? _self.expensesFcfa : expensesFcfa // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$DailyProfit {

 DateTime get day; int get salesFcfa; int get expensesFcfa;
/// Create a copy of DailyProfit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyProfitCopyWith<DailyProfit> get copyWith => _$DailyProfitCopyWithImpl<DailyProfit>(this as DailyProfit, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DailyProfit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyProfit&&(identical(other.day, _this.day) || other.day == _this.day)&&(identical(other.salesFcfa, _this.salesFcfa) || other.salesFcfa == _this.salesFcfa)&&(identical(other.expensesFcfa, _this.expensesFcfa) || other.expensesFcfa == _this.expensesFcfa));
}


@override
int get hashCode {
  final _this = this as DailyProfit;
  return Object.hash(runtimeType,_this.day,_this.salesFcfa,_this.expensesFcfa);
}

@override
String toString() {
  final _this = this as DailyProfit;
  return 'DailyProfit(day: ${_this.day}, salesFcfa: ${_this.salesFcfa}, expensesFcfa: ${_this.expensesFcfa})';
}


}

/// @nodoc
abstract mixin class $DailyProfitCopyWith<$Res>  {
  factory $DailyProfitCopyWith(DailyProfit value, $Res Function(DailyProfit) _then) = _$DailyProfitCopyWithImpl;
@useResult
$Res call({
 DateTime day, int salesFcfa, int expensesFcfa
});




}
/// @nodoc
class _$DailyProfitCopyWithImpl<$Res>
    implements $DailyProfitCopyWith<$Res> {
  _$DailyProfitCopyWithImpl(this._self, this._then);

  final DailyProfit _self;
  final $Res Function(DailyProfit) _then;

/// Create a copy of DailyProfit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? salesFcfa = null,Object? expensesFcfa = null,}) {
  return _then(DailyProfit(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DateTime,salesFcfa: null == salesFcfa ? _self.salesFcfa : salesFcfa // ignore: cast_nullable_to_non_nullable
as int,expensesFcfa: null == expensesFcfa ? _self.expensesFcfa : expensesFcfa // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyProfit].
extension DailyProfitPatterns on DailyProfit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyProfit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyProfit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyProfit value)  $default,){
final _that = this;
switch (_that) {
case _DailyProfit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyProfit value)?  $default,){
final _that = this;
switch (_that) {
case _DailyProfit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime day,  int salesFcfa,  int expensesFcfa)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyProfit() when $default != null:
return $default(_that.day,_that.salesFcfa,_that.expensesFcfa);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime day,  int salesFcfa,  int expensesFcfa)  $default,) {final _that = this;
switch (_that) {
case _DailyProfit():
return $default(_that.day,_that.salesFcfa,_that.expensesFcfa);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime day,  int salesFcfa,  int expensesFcfa)?  $default,) {final _that = this;
switch (_that) {
case _DailyProfit() when $default != null:
return $default(_that.day,_that.salesFcfa,_that.expensesFcfa);case _:
  return null;

}
}

}

/// @nodoc


class _DailyProfit extends DailyProfit {
  const _DailyProfit({required this.day, required this.salesFcfa, required this.expensesFcfa}): super._();
  

@override final  DateTime day;
@override final  int salesFcfa;
@override final  int expensesFcfa;

/// Create a copy of DailyProfit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyProfitCopyWith<_DailyProfit> get copyWith => __$DailyProfitCopyWithImpl<_DailyProfit>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyProfit&&(identical(other.day, day) || other.day == day)&&(identical(other.salesFcfa, salesFcfa) || other.salesFcfa == salesFcfa)&&(identical(other.expensesFcfa, expensesFcfa) || other.expensesFcfa == expensesFcfa));
}


@override
int get hashCode {
    return Object.hash(runtimeType,day,salesFcfa,expensesFcfa);
}

@override
String toString() {
    return 'DailyProfit(day: $day, salesFcfa: $salesFcfa, expensesFcfa: $expensesFcfa)';
}


}

/// @nodoc
abstract mixin class _$DailyProfitCopyWith<$Res> implements $DailyProfitCopyWith<$Res> {
  factory _$DailyProfitCopyWith(_DailyProfit value, $Res Function(_DailyProfit) _then) = __$DailyProfitCopyWithImpl;
@override @useResult
$Res call({
 DateTime day, int salesFcfa, int expensesFcfa
});




}
/// @nodoc
class __$DailyProfitCopyWithImpl<$Res>
    implements _$DailyProfitCopyWith<$Res> {
  __$DailyProfitCopyWithImpl(this._self, this._then);

  final _DailyProfit _self;
  final $Res Function(_DailyProfit) _then;

/// Create a copy of DailyProfit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? salesFcfa = null,Object? expensesFcfa = null,}) {
  return _then(_DailyProfit(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DateTime,salesFcfa: null == salesFcfa ? _self.salesFcfa : salesFcfa // ignore: cast_nullable_to_non_nullable
as int,expensesFcfa: null == expensesFcfa ? _self.expensesFcfa : expensesFcfa // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
