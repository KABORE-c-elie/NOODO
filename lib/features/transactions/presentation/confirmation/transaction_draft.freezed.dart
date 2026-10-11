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

 int get id; TransactionType? get type; int? get amountFcfa; double? get quantity; LocalUnit? get unit; String? get unknownUnitText; String? get product; TransactionCategory get category; double get confidence; int? get statedPriceFcfa; PriceBasis get priceBasis; String? get editingId; DateTime? get originalDate;
/// Create a copy of TransactionDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionDraftCopyWith<TransactionDraft> get copyWith => _$TransactionDraftCopyWithImpl<TransactionDraft>(this as TransactionDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TransactionDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionDraft&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.amountFcfa, _this.amountFcfa) || other.amountFcfa == _this.amountFcfa)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&(identical(other.unknownUnitText, _this.unknownUnitText) || other.unknownUnitText == _this.unknownUnitText)&&(identical(other.product, _this.product) || other.product == _this.product)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.confidence, _this.confidence) || other.confidence == _this.confidence)&&(identical(other.statedPriceFcfa, _this.statedPriceFcfa) || other.statedPriceFcfa == _this.statedPriceFcfa)&&(identical(other.priceBasis, _this.priceBasis) || other.priceBasis == _this.priceBasis)&&(identical(other.editingId, _this.editingId) || other.editingId == _this.editingId)&&(identical(other.originalDate, _this.originalDate) || other.originalDate == _this.originalDate));
}


@override
int get hashCode {
  final _this = this as TransactionDraft;
  return Object.hash(runtimeType,_this.id,_this.type,_this.amountFcfa,_this.quantity,_this.unit,_this.unknownUnitText,_this.product,_this.category,_this.confidence,_this.statedPriceFcfa,_this.priceBasis,_this.editingId,_this.originalDate);
}

@override
String toString() {
  final _this = this as TransactionDraft;
  return 'TransactionDraft(id: ${_this.id}, type: ${_this.type}, amountFcfa: ${_this.amountFcfa}, quantity: ${_this.quantity}, unit: ${_this.unit}, unknownUnitText: ${_this.unknownUnitText}, product: ${_this.product}, category: ${_this.category}, confidence: ${_this.confidence}, statedPriceFcfa: ${_this.statedPriceFcfa}, priceBasis: ${_this.priceBasis}, editingId: ${_this.editingId}, originalDate: ${_this.originalDate})';
}


}

/// @nodoc
abstract mixin class $TransactionDraftCopyWith<$Res>  {
  factory $TransactionDraftCopyWith(TransactionDraft value, $Res Function(TransactionDraft) _then) = _$TransactionDraftCopyWithImpl;
@useResult
$Res call({
 int id, TransactionType? type, int? amountFcfa, double? quantity, LocalUnit? unit, String? unknownUnitText, String? product, TransactionCategory category, double confidence, int? statedPriceFcfa, PriceBasis priceBasis, String? editingId, DateTime? originalDate
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = freezed,Object? amountFcfa = freezed,Object? quantity = freezed,Object? unit = freezed,Object? unknownUnitText = freezed,Object? product = freezed,Object? category = null,Object? confidence = null,Object? statedPriceFcfa = freezed,Object? priceBasis = null,Object? editingId = freezed,Object? originalDate = freezed,}) {
  return _then(TransactionDraft(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,amountFcfa: freezed == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as LocalUnit?,unknownUnitText: freezed == unknownUnitText ? _self.unknownUnitText : unknownUnitText // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,statedPriceFcfa: freezed == statedPriceFcfa ? _self.statedPriceFcfa : statedPriceFcfa // ignore: cast_nullable_to_non_nullable
as int?,priceBasis: null == priceBasis ? _self.priceBasis : priceBasis // ignore: cast_nullable_to_non_nullable
as PriceBasis,editingId: freezed == editingId ? _self.editingId : editingId // ignore: cast_nullable_to_non_nullable
as String?,originalDate: freezed == originalDate ? _self.originalDate : originalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  TransactionType? type,  int? amountFcfa,  double? quantity,  LocalUnit? unit,  String? unknownUnitText,  String? product,  TransactionCategory category,  double confidence,  int? statedPriceFcfa,  PriceBasis priceBasis,  String? editingId,  DateTime? originalDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionDraft() when $default != null:
return $default(_that.id,_that.type,_that.amountFcfa,_that.quantity,_that.unit,_that.unknownUnitText,_that.product,_that.category,_that.confidence,_that.statedPriceFcfa,_that.priceBasis,_that.editingId,_that.originalDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  TransactionType? type,  int? amountFcfa,  double? quantity,  LocalUnit? unit,  String? unknownUnitText,  String? product,  TransactionCategory category,  double confidence,  int? statedPriceFcfa,  PriceBasis priceBasis,  String? editingId,  DateTime? originalDate)  $default,) {final _that = this;
switch (_that) {
case _TransactionDraft():
return $default(_that.id,_that.type,_that.amountFcfa,_that.quantity,_that.unit,_that.unknownUnitText,_that.product,_that.category,_that.confidence,_that.statedPriceFcfa,_that.priceBasis,_that.editingId,_that.originalDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  TransactionType? type,  int? amountFcfa,  double? quantity,  LocalUnit? unit,  String? unknownUnitText,  String? product,  TransactionCategory category,  double confidence,  int? statedPriceFcfa,  PriceBasis priceBasis,  String? editingId,  DateTime? originalDate)?  $default,) {final _that = this;
switch (_that) {
case _TransactionDraft() when $default != null:
return $default(_that.id,_that.type,_that.amountFcfa,_that.quantity,_that.unit,_that.unknownUnitText,_that.product,_that.category,_that.confidence,_that.statedPriceFcfa,_that.priceBasis,_that.editingId,_that.originalDate);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionDraft extends TransactionDraft {
  const _TransactionDraft({required this.id, this.type, this.amountFcfa, this.quantity, this.unit, this.unknownUnitText, this.product, this.category = TransactionCategory.other, this.confidence = 1.0, this.statedPriceFcfa, this.priceBasis = PriceBasis.total, this.editingId, this.originalDate}): super._();
  

@override final  int id;
@override final  TransactionType? type;
@override final  int? amountFcfa;
@override final  double? quantity;
@override final  LocalUnit? unit;
@override final  String? unknownUnitText;
@override final  String? product;
@override@JsonKey() final  TransactionCategory category;
@override@JsonKey() final  double confidence;
@override final  int? statedPriceFcfa;
@override@JsonKey() final  PriceBasis priceBasis;
@override final  String? editingId;
@override final  DateTime? originalDate;

/// Create a copy of TransactionDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionDraftCopyWith<_TransactionDraft> get copyWith => __$TransactionDraftCopyWithImpl<_TransactionDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amountFcfa, amountFcfa) || other.amountFcfa == amountFcfa)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unknownUnitText, unknownUnitText) || other.unknownUnitText == unknownUnitText)&&(identical(other.product, product) || other.product == product)&&(identical(other.category, category) || other.category == category)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.statedPriceFcfa, statedPriceFcfa) || other.statedPriceFcfa == statedPriceFcfa)&&(identical(other.priceBasis, priceBasis) || other.priceBasis == priceBasis)&&(identical(other.editingId, editingId) || other.editingId == editingId)&&(identical(other.originalDate, originalDate) || other.originalDate == originalDate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,type,amountFcfa,quantity,unit,unknownUnitText,product,category,confidence,statedPriceFcfa,priceBasis,editingId,originalDate);
}

@override
String toString() {
    return 'TransactionDraft(id: $id, type: $type, amountFcfa: $amountFcfa, quantity: $quantity, unit: $unit, unknownUnitText: $unknownUnitText, product: $product, category: $category, confidence: $confidence, statedPriceFcfa: $statedPriceFcfa, priceBasis: $priceBasis, editingId: $editingId, originalDate: $originalDate)';
}


}

/// @nodoc
abstract mixin class _$TransactionDraftCopyWith<$Res> implements $TransactionDraftCopyWith<$Res> {
  factory _$TransactionDraftCopyWith(_TransactionDraft value, $Res Function(_TransactionDraft) _then) = __$TransactionDraftCopyWithImpl;
@override @useResult
$Res call({
 int id, TransactionType? type, int? amountFcfa, double? quantity, LocalUnit? unit, String? unknownUnitText, String? product, TransactionCategory category, double confidence, int? statedPriceFcfa, PriceBasis priceBasis, String? editingId, DateTime? originalDate
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = freezed,Object? amountFcfa = freezed,Object? quantity = freezed,Object? unit = freezed,Object? unknownUnitText = freezed,Object? product = freezed,Object? category = null,Object? confidence = null,Object? statedPriceFcfa = freezed,Object? priceBasis = null,Object? editingId = freezed,Object? originalDate = freezed,}) {
  return _then(_TransactionDraft(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,amountFcfa: freezed == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as LocalUnit?,unknownUnitText: freezed == unknownUnitText ? _self.unknownUnitText : unknownUnitText // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,statedPriceFcfa: freezed == statedPriceFcfa ? _self.statedPriceFcfa : statedPriceFcfa // ignore: cast_nullable_to_non_nullable
as int?,priceBasis: null == priceBasis ? _self.priceBasis : priceBasis // ignore: cast_nullable_to_non_nullable
as PriceBasis,editingId: freezed == editingId ? _self.editingId : editingId // ignore: cast_nullable_to_non_nullable
as String?,originalDate: freezed == originalDate ? _self.originalDate : originalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

/// @nodoc
mixin _$ConfirmationState {

 String get rawText; List<TransactionDraft> get items; int get revision;
/// Create a copy of ConfirmationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmationStateCopyWith<ConfirmationState> get copyWith => _$ConfirmationStateCopyWithImpl<ConfirmationState>(this as ConfirmationState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ConfirmationState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmationState&&(identical(other.rawText, _this.rawText) || other.rawText == _this.rawText)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.revision, _this.revision) || other.revision == _this.revision));
}


@override
int get hashCode {
  final _this = this as ConfirmationState;
  return Object.hash(runtimeType,_this.rawText,const DeepCollectionEquality().hash(_this.items),_this.revision);
}

@override
String toString() {
  final _this = this as ConfirmationState;
  return 'ConfirmationState(rawText: ${_this.rawText}, items: ${_this.items}, revision: ${_this.revision})';
}


}

/// @nodoc
abstract mixin class $ConfirmationStateCopyWith<$Res>  {
  factory $ConfirmationStateCopyWith(ConfirmationState value, $Res Function(ConfirmationState) _then) = _$ConfirmationStateCopyWithImpl;
@useResult
$Res call({
 String rawText, List<TransactionDraft> items, int revision
});




}
/// @nodoc
class _$ConfirmationStateCopyWithImpl<$Res>
    implements $ConfirmationStateCopyWith<$Res> {
  _$ConfirmationStateCopyWithImpl(this._self, this._then);

  final ConfirmationState _self;
  final $Res Function(ConfirmationState) _then;

/// Create a copy of ConfirmationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rawText = null,Object? items = null,Object? revision = null,}) {
  return _then(ConfirmationState(
rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<TransactionDraft>,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfirmationState].
extension ConfirmationStatePatterns on ConfirmationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfirmationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfirmationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfirmationState value)  $default,){
final _that = this;
switch (_that) {
case _ConfirmationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfirmationState value)?  $default,){
final _that = this;
switch (_that) {
case _ConfirmationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String rawText,  List<TransactionDraft> items,  int revision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfirmationState() when $default != null:
return $default(_that.rawText,_that.items,_that.revision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String rawText,  List<TransactionDraft> items,  int revision)  $default,) {final _that = this;
switch (_that) {
case _ConfirmationState():
return $default(_that.rawText,_that.items,_that.revision);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String rawText,  List<TransactionDraft> items,  int revision)?  $default,) {final _that = this;
switch (_that) {
case _ConfirmationState() when $default != null:
return $default(_that.rawText,_that.items,_that.revision);case _:
  return null;

}
}

}

/// @nodoc


class _ConfirmationState extends ConfirmationState {
  const _ConfirmationState({this.rawText = '',  List<TransactionDraft> items = const <TransactionDraft>[], this.revision = 0}): _items = items,super._();
  

@override@JsonKey() final  String rawText;
 final  List<TransactionDraft> _items;
@override@JsonKey() List<TransactionDraft> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int revision;

/// Create a copy of ConfirmationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmationStateCopyWith<_ConfirmationState> get copyWith => __$ConfirmationStateCopyWithImpl<_ConfirmationState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmationState&&(identical(other.rawText, rawText) || other.rawText == rawText)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.revision, revision) || other.revision == revision));
}


@override
int get hashCode {
    return Object.hash(runtimeType,rawText,const DeepCollectionEquality().hash(_items),revision);
}

@override
String toString() {
    return 'ConfirmationState(rawText: $rawText, items: $items, revision: $revision)';
}


}

/// @nodoc
abstract mixin class _$ConfirmationStateCopyWith<$Res> implements $ConfirmationStateCopyWith<$Res> {
  factory _$ConfirmationStateCopyWith(_ConfirmationState value, $Res Function(_ConfirmationState) _then) = __$ConfirmationStateCopyWithImpl;
@override @useResult
$Res call({
 String rawText, List<TransactionDraft> items, int revision
});




}
/// @nodoc
class __$ConfirmationStateCopyWithImpl<$Res>
    implements _$ConfirmationStateCopyWith<$Res> {
  __$ConfirmationStateCopyWithImpl(this._self, this._then);

  final _ConfirmationState _self;
  final $Res Function(_ConfirmationState) _then;

/// Create a copy of ConfirmationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rawText = null,Object? items = null,Object? revision = null,}) {
  return _then(_ConfirmationState(
rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TransactionDraft>,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
