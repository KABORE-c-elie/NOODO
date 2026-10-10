// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionDraft {

 String get rawText; TransactionType? get type; int? get amountFcfa; double? get quantity; LocalUnit? get unit; String? get unknownUnitText; String? get product; TransactionCategory get category; double get confidence; int get revision;
/// Create a copy of TransactionDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionDraftCopyWith<TransactionDraft> get copyWith => _$TransactionDraftCopyWithImpl<TransactionDraft>(this as TransactionDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TransactionDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionDraft&&(identical(other.rawText, _this.rawText) || other.rawText == _this.rawText)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.amountFcfa, _this.amountFcfa) || other.amountFcfa == _this.amountFcfa)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&(identical(other.unknownUnitText, _this.unknownUnitText) || other.unknownUnitText == _this.unknownUnitText)&&(identical(other.product, _this.product) || other.product == _this.product)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.confidence, _this.confidence) || other.confidence == _this.confidence)&&(identical(other.revision, _this.revision) || other.revision == _this.revision));
}


@override
int get hashCode {
  final _this = this as TransactionDraft;
  return Object.hash(runtimeType,_this.rawText,_this.type,_this.amountFcfa,_this.quantity,_this.unit,_this.unknownUnitText,_this.product,_this.category,_this.confidence,_this.revision);
}

@override
String toString() {
  final _this = this as TransactionDraft;
  return 'TransactionDraft(rawText: ${_this.rawText}, type: ${_this.type}, amountFcfa: ${_this.amountFcfa}, quantity: ${_this.quantity}, unit: ${_this.unit}, unknownUnitText: ${_this.unknownUnitText}, product: ${_this.product}, category: ${_this.category}, confidence: ${_this.confidence}, revision: ${_this.revision})';
}


}

/// @nodoc
abstract mixin class $TransactionDraftCopyWith<$Res>  {
  factory $TransactionDraftCopyWith(TransactionDraft value, $Res Function(TransactionDraft) _then) = _$TransactionDraftCopyWithImpl;
@useResult
$Res call({
 String rawText, TransactionType? type, int? amountFcfa, double? quantity, LocalUnit? unit, String? unknownUnitText, String? product, TransactionCategory category, double confidence, int revision
});


$LocalUnitCopyWith<$Res>? get unit;

}
/// @nodoc
class _$TransactionDraftCopyWithImpl<$Res>
    implements $TransactionDraftCopyWith<$Res> {
  _$TransactionDraftCopyWithImpl(this._self, this._then);

  final TransactionDraft _self;
  final $Res Function(TransactionDraft) _then;

/// Create a copy of TransactionDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rawText = null,Object? type = freezed,Object? amountFcfa = freezed,Object? quantity = freezed,Object? unit = freezed,Object? unknownUnitText = freezed,Object? product = freezed,Object? category = null,Object? confidence = null,Object? revision = null,}) {
  return _then(TransactionDraft(
rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,amountFcfa: freezed == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as LocalUnit?,unknownUnitText: freezed == unknownUnitText ? _self.unknownUnitText : unknownUnitText // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of TransactionDraft
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


/// Adds pattern-matching-related methods to [TransactionDraft].
extension TransactionDraftPatterns on TransactionDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionDraft value)  $default,){
final _that = this;
switch (_that) {
case _TransactionDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionDraft value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String rawText,  TransactionType? type,  int? amountFcfa,  double? quantity,  LocalUnit? unit,  String? unknownUnitText,  String? product,  TransactionCategory category,  double confidence,  int revision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionDraft() when $default != null:
return $default(_that.rawText,_that.type,_that.amountFcfa,_that.quantity,_that.unit,_that.unknownUnitText,_that.product,_that.category,_that.confidence,_that.revision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String rawText,  TransactionType? type,  int? amountFcfa,  double? quantity,  LocalUnit? unit,  String? unknownUnitText,  String? product,  TransactionCategory category,  double confidence,  int revision)  $default,) {final _that = this;
switch (_that) {
case _TransactionDraft():
return $default(_that.rawText,_that.type,_that.amountFcfa,_that.quantity,_that.unit,_that.unknownUnitText,_that.product,_that.category,_that.confidence,_that.revision);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String rawText,  TransactionType? type,  int? amountFcfa,  double? quantity,  LocalUnit? unit,  String? unknownUnitText,  String? product,  TransactionCategory category,  double confidence,  int revision)?  $default,) {final _that = this;
switch (_that) {
case _TransactionDraft() when $default != null:
return $default(_that.rawText,_that.type,_that.amountFcfa,_that.quantity,_that.unit,_that.unknownUnitText,_that.product,_that.category,_that.confidence,_that.revision);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionDraft extends TransactionDraft {
  const _TransactionDraft({this.rawText = '', this.type, this.amountFcfa, this.quantity, this.unit, this.unknownUnitText, this.product, this.category = TransactionCategory.other, this.confidence = 1.0, this.revision = 0}): super._();
  

@override@JsonKey() final  String rawText;
@override final  TransactionType? type;
@override final  int? amountFcfa;
@override final  double? quantity;
@override final  LocalUnit? unit;
@override final  String? unknownUnitText;
@override final  String? product;
@override@JsonKey() final  TransactionCategory category;
@override@JsonKey() final  double confidence;
@override@JsonKey() final  int revision;

/// Create a copy of TransactionDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionDraftCopyWith<_TransactionDraft> get copyWith => __$TransactionDraftCopyWithImpl<_TransactionDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionDraft&&(identical(other.rawText, rawText) || other.rawText == rawText)&&(identical(other.type, type) || other.type == type)&&(identical(other.amountFcfa, amountFcfa) || other.amountFcfa == amountFcfa)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unknownUnitText, unknownUnitText) || other.unknownUnitText == unknownUnitText)&&(identical(other.product, product) || other.product == product)&&(identical(other.category, category) || other.category == category)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.revision, revision) || other.revision == revision));
}


@override
int get hashCode {
    return Object.hash(runtimeType,rawText,type,amountFcfa,quantity,unit,unknownUnitText,product,category,confidence,revision);
}

@override
String toString() {
    return 'TransactionDraft(rawText: $rawText, type: $type, amountFcfa: $amountFcfa, quantity: $quantity, unit: $unit, unknownUnitText: $unknownUnitText, product: $product, category: $category, confidence: $confidence, revision: $revision)';
}


}

/// @nodoc
abstract mixin class _$TransactionDraftCopyWith<$Res> implements $TransactionDraftCopyWith<$Res> {
  factory _$TransactionDraftCopyWith(_TransactionDraft value, $Res Function(_TransactionDraft) _then) = __$TransactionDraftCopyWithImpl;
@override @useResult
$Res call({
 String rawText, TransactionType? type, int? amountFcfa, double? quantity, LocalUnit? unit, String? unknownUnitText, String? product, TransactionCategory category, double confidence, int revision
});


@override $LocalUnitCopyWith<$Res>? get unit;

}
/// @nodoc
class __$TransactionDraftCopyWithImpl<$Res>
    implements _$TransactionDraftCopyWith<$Res> {
  __$TransactionDraftCopyWithImpl(this._self, this._then);

  final _TransactionDraft _self;
  final $Res Function(_TransactionDraft) _then;

/// Create a copy of TransactionDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rawText = null,Object? type = freezed,Object? amountFcfa = freezed,Object? quantity = freezed,Object? unit = freezed,Object? unknownUnitText = freezed,Object? product = freezed,Object? category = null,Object? confidence = null,Object? revision = null,}) {
  return _then(_TransactionDraft(
rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,amountFcfa: freezed == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as LocalUnit?,unknownUnitText: freezed == unknownUnitText ? _self.unknownUnitText : unknownUnitText // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of TransactionDraft
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
