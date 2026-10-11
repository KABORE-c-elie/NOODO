// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parse_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParseResult {

 TransactionType? get type; int? get amountFcfa; double? get quantity; LocalUnit? get unit; String? get unknownUnitText; String? get product; TransactionCategory get category; double get confidence; int? get statedPriceFcfa; PriceBasis get priceBasis;
/// Create a copy of ParseResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParseResultCopyWith<ParseResult> get copyWith => _$ParseResultCopyWithImpl<ParseResult>(this as ParseResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ParseResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParseResult&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.amountFcfa, _this.amountFcfa) || other.amountFcfa == _this.amountFcfa)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&(identical(other.unknownUnitText, _this.unknownUnitText) || other.unknownUnitText == _this.unknownUnitText)&&(identical(other.product, _this.product) || other.product == _this.product)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.confidence, _this.confidence) || other.confidence == _this.confidence)&&(identical(other.statedPriceFcfa, _this.statedPriceFcfa) || other.statedPriceFcfa == _this.statedPriceFcfa)&&(identical(other.priceBasis, _this.priceBasis) || other.priceBasis == _this.priceBasis));
}


@override
int get hashCode {
  final _this = this as ParseResult;
  return Object.hash(runtimeType,_this.type,_this.amountFcfa,_this.quantity,_this.unit,_this.unknownUnitText,_this.product,_this.category,_this.confidence,_this.statedPriceFcfa,_this.priceBasis);
}

@override
String toString() {
  final _this = this as ParseResult;
  return 'ParseResult(type: ${_this.type}, amountFcfa: ${_this.amountFcfa}, quantity: ${_this.quantity}, unit: ${_this.unit}, unknownUnitText: ${_this.unknownUnitText}, product: ${_this.product}, category: ${_this.category}, confidence: ${_this.confidence}, statedPriceFcfa: ${_this.statedPriceFcfa}, priceBasis: ${_this.priceBasis})';
}


}

/// @nodoc
abstract mixin class $ParseResultCopyWith<$Res>  {
  factory $ParseResultCopyWith(ParseResult value, $Res Function(ParseResult) _then) = _$ParseResultCopyWithImpl;
@useResult
$Res call({
 TransactionType? type, int? amountFcfa, double? quantity, LocalUnit? unit, String? unknownUnitText, String? product, TransactionCategory category, double confidence, int? statedPriceFcfa, PriceBasis priceBasis
});


$LocalUnitCopyWith<$Res>? get unit;

}
/// @nodoc
class _$ParseResultCopyWithImpl<$Res>
    implements $ParseResultCopyWith<$Res> {
  _$ParseResultCopyWithImpl(this._self, this._then);

  final ParseResult _self;
  final $Res Function(ParseResult) _then;

/// Create a copy of ParseResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? amountFcfa = freezed,Object? quantity = freezed,Object? unit = freezed,Object? unknownUnitText = freezed,Object? product = freezed,Object? category = null,Object? confidence = null,Object? statedPriceFcfa = freezed,Object? priceBasis = null,}) {
  return _then(ParseResult(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,amountFcfa: freezed == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as LocalUnit?,unknownUnitText: freezed == unknownUnitText ? _self.unknownUnitText : unknownUnitText // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,statedPriceFcfa: freezed == statedPriceFcfa ? _self.statedPriceFcfa : statedPriceFcfa // ignore: cast_nullable_to_non_nullable
as int?,priceBasis: null == priceBasis ? _self.priceBasis : priceBasis // ignore: cast_nullable_to_non_nullable
as PriceBasis,
  ));
}
/// Create a copy of ParseResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalUnitCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $LocalUnitCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// Adds pattern-matching-related methods to [ParseResult].
extension ParseResultPatterns on ParseResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParseResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParseResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParseResult value)  $default,){
final _that = this;
switch (_that) {
case _ParseResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParseResult value)?  $default,){
final _that = this;
switch (_that) {
case _ParseResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TransactionType? type,  int? amountFcfa,  double? quantity,  LocalUnit? unit,  String? unknownUnitText,  String? product,  TransactionCategory category,  double confidence,  int? statedPriceFcfa,  PriceBasis priceBasis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParseResult() when $default != null:
return $default(_that.type,_that.amountFcfa,_that.quantity,_that.unit,_that.unknownUnitText,_that.product,_that.category,_that.confidence,_that.statedPriceFcfa,_that.priceBasis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TransactionType? type,  int? amountFcfa,  double? quantity,  LocalUnit? unit,  String? unknownUnitText,  String? product,  TransactionCategory category,  double confidence,  int? statedPriceFcfa,  PriceBasis priceBasis)  $default,) {final _that = this;
switch (_that) {
case _ParseResult():
return $default(_that.type,_that.amountFcfa,_that.quantity,_that.unit,_that.unknownUnitText,_that.product,_that.category,_that.confidence,_that.statedPriceFcfa,_that.priceBasis);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TransactionType? type,  int? amountFcfa,  double? quantity,  LocalUnit? unit,  String? unknownUnitText,  String? product,  TransactionCategory category,  double confidence,  int? statedPriceFcfa,  PriceBasis priceBasis)?  $default,) {final _that = this;
switch (_that) {
case _ParseResult() when $default != null:
return $default(_that.type,_that.amountFcfa,_that.quantity,_that.unit,_that.unknownUnitText,_that.product,_that.category,_that.confidence,_that.statedPriceFcfa,_that.priceBasis);case _:
  return null;

}
}

}

/// @nodoc


class _ParseResult implements ParseResult {
  const _ParseResult({this.type, this.amountFcfa, this.quantity, this.unit, this.unknownUnitText, this.product, this.category = TransactionCategory.other, required this.confidence, this.statedPriceFcfa, this.priceBasis = PriceBasis.total});
  

@override final  TransactionType? type;
@override final  int? amountFcfa;
@override final  double? quantity;
@override final  LocalUnit? unit;
@override final  String? unknownUnitText;
@override final  String? product;
@override@JsonKey() final  TransactionCategory category;
@override final  double confidence;
@override final  int? statedPriceFcfa;
@override@JsonKey() final  PriceBasis priceBasis;

/// Create a copy of ParseResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParseResultCopyWith<_ParseResult> get copyWith => __$ParseResultCopyWithImpl<_ParseResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParseResult&&(identical(other.type, type) || other.type == type)&&(identical(other.amountFcfa, amountFcfa) || other.amountFcfa == amountFcfa)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unknownUnitText, unknownUnitText) || other.unknownUnitText == unknownUnitText)&&(identical(other.product, product) || other.product == product)&&(identical(other.category, category) || other.category == category)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.statedPriceFcfa, statedPriceFcfa) || other.statedPriceFcfa == statedPriceFcfa)&&(identical(other.priceBasis, priceBasis) || other.priceBasis == priceBasis));
}


@override
int get hashCode {
    return Object.hash(runtimeType,type,amountFcfa,quantity,unit,unknownUnitText,product,category,confidence,statedPriceFcfa,priceBasis);
}

@override
String toString() {
    return 'ParseResult(type: $type, amountFcfa: $amountFcfa, quantity: $quantity, unit: $unit, unknownUnitText: $unknownUnitText, product: $product, category: $category, confidence: $confidence, statedPriceFcfa: $statedPriceFcfa, priceBasis: $priceBasis)';
}


}

/// @nodoc
abstract mixin class _$ParseResultCopyWith<$Res> implements $ParseResultCopyWith<$Res> {
  factory _$ParseResultCopyWith(_ParseResult value, $Res Function(_ParseResult) _then) = __$ParseResultCopyWithImpl;
@override @useResult
$Res call({
 TransactionType? type, int? amountFcfa, double? quantity, LocalUnit? unit, String? unknownUnitText, String? product, TransactionCategory category, double confidence, int? statedPriceFcfa, PriceBasis priceBasis
});


@override $LocalUnitCopyWith<$Res>? get unit;

}
/// @nodoc
class __$ParseResultCopyWithImpl<$Res>
    implements _$ParseResultCopyWith<$Res> {
  __$ParseResultCopyWithImpl(this._self, this._then);

  final _ParseResult _self;
  final $Res Function(_ParseResult) _then;

/// Create a copy of ParseResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? amountFcfa = freezed,Object? quantity = freezed,Object? unit = freezed,Object? unknownUnitText = freezed,Object? product = freezed,Object? category = null,Object? confidence = null,Object? statedPriceFcfa = freezed,Object? priceBasis = null,}) {
  return _then(_ParseResult(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,amountFcfa: freezed == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as LocalUnit?,unknownUnitText: freezed == unknownUnitText ? _self.unknownUnitText : unknownUnitText // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,statedPriceFcfa: freezed == statedPriceFcfa ? _self.statedPriceFcfa : statedPriceFcfa // ignore: cast_nullable_to_non_nullable
as int?,priceBasis: null == priceBasis ? _self.priceBasis : priceBasis // ignore: cast_nullable_to_non_nullable
as PriceBasis,
  ));
}

/// Create a copy of ParseResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalUnitCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $LocalUnitCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}

// dart format on
