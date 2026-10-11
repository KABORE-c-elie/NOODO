// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaxNode {

 String get id; int get rateBasisPoints; int get savedBalanceFcfa; DateTime? get nextDueDate;
/// Create a copy of TaxNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaxNodeCopyWith<TaxNode> get copyWith => _$TaxNodeCopyWithImpl<TaxNode>(this as TaxNode, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TaxNode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaxNode&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.rateBasisPoints, _this.rateBasisPoints) || other.rateBasisPoints == _this.rateBasisPoints)&&(identical(other.savedBalanceFcfa, _this.savedBalanceFcfa) || other.savedBalanceFcfa == _this.savedBalanceFcfa)&&(identical(other.nextDueDate, _this.nextDueDate) || other.nextDueDate == _this.nextDueDate));
}


@override
int get hashCode {
  final _this = this as TaxNode;
  return Object.hash(runtimeType,_this.id,_this.rateBasisPoints,_this.savedBalanceFcfa,_this.nextDueDate);
}

@override
String toString() {
  final _this = this as TaxNode;
  return 'TaxNode(id: ${_this.id}, rateBasisPoints: ${_this.rateBasisPoints}, savedBalanceFcfa: ${_this.savedBalanceFcfa}, nextDueDate: ${_this.nextDueDate})';
}


}

/// @nodoc
abstract mixin class $TaxNodeCopyWith<$Res>  {
  factory $TaxNodeCopyWith(TaxNode value, $Res Function(TaxNode) _then) = _$TaxNodeCopyWithImpl;
@useResult
$Res call({
 String id, int rateBasisPoints, int savedBalanceFcfa, DateTime? nextDueDate
});




}
/// @nodoc
class _$TaxNodeCopyWithImpl<$Res>
    implements $TaxNodeCopyWith<$Res> {
  _$TaxNodeCopyWithImpl(this._self, this._then);

  final TaxNode _self;
  final $Res Function(TaxNode) _then;

/// Create a copy of TaxNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rateBasisPoints = null,Object? savedBalanceFcfa = null,Object? nextDueDate = freezed,}) {
  return _then(TaxNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rateBasisPoints: null == rateBasisPoints ? _self.rateBasisPoints : rateBasisPoints // ignore: cast_nullable_to_non_nullable
as int,savedBalanceFcfa: null == savedBalanceFcfa ? _self.savedBalanceFcfa : savedBalanceFcfa // ignore: cast_nullable_to_non_nullable
as int,nextDueDate: freezed == nextDueDate ? _self.nextDueDate : nextDueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaxNode].
extension TaxNodePatterns on TaxNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaxNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaxNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaxNode value)  $default,){
final _that = this;
switch (_that) {
case _TaxNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaxNode value)?  $default,){
final _that = this;
switch (_that) {
case _TaxNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int rateBasisPoints,  int savedBalanceFcfa,  DateTime? nextDueDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaxNode() when $default != null:
return $default(_that.id,_that.rateBasisPoints,_that.savedBalanceFcfa,_that.nextDueDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int rateBasisPoints,  int savedBalanceFcfa,  DateTime? nextDueDate)  $default,) {final _that = this;
switch (_that) {
case _TaxNode():
return $default(_that.id,_that.rateBasisPoints,_that.savedBalanceFcfa,_that.nextDueDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int rateBasisPoints,  int savedBalanceFcfa,  DateTime? nextDueDate)?  $default,) {final _that = this;
switch (_that) {
case _TaxNode() when $default != null:
return $default(_that.id,_that.rateBasisPoints,_that.savedBalanceFcfa,_that.nextDueDate);case _:
  return null;

}
}

}

/// @nodoc


class _TaxNode extends TaxNode {
  const _TaxNode({required this.id, required this.rateBasisPoints, required this.savedBalanceFcfa, this.nextDueDate}): super._();
  

@override final  String id;
@override final  int rateBasisPoints;
@override final  int savedBalanceFcfa;
@override final  DateTime? nextDueDate;

/// Create a copy of TaxNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaxNodeCopyWith<_TaxNode> get copyWith => __$TaxNodeCopyWithImpl<_TaxNode>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaxNode&&(identical(other.id, id) || other.id == id)&&(identical(other.rateBasisPoints, rateBasisPoints) || other.rateBasisPoints == rateBasisPoints)&&(identical(other.savedBalanceFcfa, savedBalanceFcfa) || other.savedBalanceFcfa == savedBalanceFcfa)&&(identical(other.nextDueDate, nextDueDate) || other.nextDueDate == nextDueDate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,rateBasisPoints,savedBalanceFcfa,nextDueDate);
}

@override
String toString() {
    return 'TaxNode(id: $id, rateBasisPoints: $rateBasisPoints, savedBalanceFcfa: $savedBalanceFcfa, nextDueDate: $nextDueDate)';
}


}

/// @nodoc
abstract mixin class _$TaxNodeCopyWith<$Res> implements $TaxNodeCopyWith<$Res> {
  factory _$TaxNodeCopyWith(_TaxNode value, $Res Function(_TaxNode) _then) = __$TaxNodeCopyWithImpl;
@override @useResult
$Res call({
 String id, int rateBasisPoints, int savedBalanceFcfa, DateTime? nextDueDate
});




}
/// @nodoc
class __$TaxNodeCopyWithImpl<$Res>
    implements _$TaxNodeCopyWith<$Res> {
  __$TaxNodeCopyWithImpl(this._self, this._then);

  final _TaxNode _self;
  final $Res Function(_TaxNode) _then;

/// Create a copy of TaxNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rateBasisPoints = null,Object? savedBalanceFcfa = null,Object? nextDueDate = freezed,}) {
  return _then(_TaxNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rateBasisPoints: null == rateBasisPoints ? _self.rateBasisPoints : rateBasisPoints // ignore: cast_nullable_to_non_nullable
as int,savedBalanceFcfa: null == savedBalanceFcfa ? _self.savedBalanceFcfa : savedBalanceFcfa // ignore: cast_nullable_to_non_nullable
as int,nextDueDate: freezed == nextDueDate ? _self.nextDueDate : nextDueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
