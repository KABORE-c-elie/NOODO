// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creditor_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreditorNode {

 String get id; String get supplierName; String? get phone; int get balanceDueFcfa; DateTime? get dueDate;
/// Create a copy of CreditorNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditorNodeCopyWith<CreditorNode> get copyWith => _$CreditorNodeCopyWithImpl<CreditorNode>(this as CreditorNode, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CreditorNode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditorNode&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.supplierName, _this.supplierName) || other.supplierName == _this.supplierName)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.balanceDueFcfa, _this.balanceDueFcfa) || other.balanceDueFcfa == _this.balanceDueFcfa)&&(identical(other.dueDate, _this.dueDate) || other.dueDate == _this.dueDate));
}


@override
int get hashCode {
  final _this = this as CreditorNode;
  return Object.hash(runtimeType,_this.id,_this.supplierName,_this.phone,_this.balanceDueFcfa,_this.dueDate);
}

@override
String toString() {
  final _this = this as CreditorNode;
  return 'CreditorNode(id: ${_this.id}, supplierName: ${_this.supplierName}, phone: ${_this.phone}, balanceDueFcfa: ${_this.balanceDueFcfa}, dueDate: ${_this.dueDate})';
}


}

/// @nodoc
abstract mixin class $CreditorNodeCopyWith<$Res>  {
  factory $CreditorNodeCopyWith(CreditorNode value, $Res Function(CreditorNode) _then) = _$CreditorNodeCopyWithImpl;
@useResult
$Res call({
 String id, String supplierName, String? phone, int balanceDueFcfa, DateTime? dueDate
});




}
/// @nodoc
class _$CreditorNodeCopyWithImpl<$Res>
    implements $CreditorNodeCopyWith<$Res> {
  _$CreditorNodeCopyWithImpl(this._self, this._then);

  final CreditorNode _self;
  final $Res Function(CreditorNode) _then;

/// Create a copy of CreditorNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? supplierName = null,Object? phone = freezed,Object? balanceDueFcfa = null,Object? dueDate = freezed,}) {
  return _then(CreditorNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,supplierName: null == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,balanceDueFcfa: null == balanceDueFcfa ? _self.balanceDueFcfa : balanceDueFcfa // ignore: cast_nullable_to_non_nullable
as int,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditorNode].
extension CreditorNodePatterns on CreditorNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditorNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditorNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditorNode value)  $default,){
final _that = this;
switch (_that) {
case _CreditorNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditorNode value)?  $default,){
final _that = this;
switch (_that) {
case _CreditorNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String supplierName,  String? phone,  int balanceDueFcfa,  DateTime? dueDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditorNode() when $default != null:
return $default(_that.id,_that.supplierName,_that.phone,_that.balanceDueFcfa,_that.dueDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String supplierName,  String? phone,  int balanceDueFcfa,  DateTime? dueDate)  $default,) {final _that = this;
switch (_that) {
case _CreditorNode():
return $default(_that.id,_that.supplierName,_that.phone,_that.balanceDueFcfa,_that.dueDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String supplierName,  String? phone,  int balanceDueFcfa,  DateTime? dueDate)?  $default,) {final _that = this;
switch (_that) {
case _CreditorNode() when $default != null:
return $default(_that.id,_that.supplierName,_that.phone,_that.balanceDueFcfa,_that.dueDate);case _:
  return null;

}
}

}

/// @nodoc


class _CreditorNode implements CreditorNode {
  const _CreditorNode({required this.id, required this.supplierName, this.phone, required this.balanceDueFcfa, this.dueDate});
  

@override final  String id;
@override final  String supplierName;
@override final  String? phone;
@override final  int balanceDueFcfa;
@override final  DateTime? dueDate;

/// Create a copy of CreditorNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditorNodeCopyWith<_CreditorNode> get copyWith => __$CreditorNodeCopyWithImpl<_CreditorNode>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditorNode&&(identical(other.id, id) || other.id == id)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.balanceDueFcfa, balanceDueFcfa) || other.balanceDueFcfa == balanceDueFcfa)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,supplierName,phone,balanceDueFcfa,dueDate);
}

@override
String toString() {
    return 'CreditorNode(id: $id, supplierName: $supplierName, phone: $phone, balanceDueFcfa: $balanceDueFcfa, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class _$CreditorNodeCopyWith<$Res> implements $CreditorNodeCopyWith<$Res> {
  factory _$CreditorNodeCopyWith(_CreditorNode value, $Res Function(_CreditorNode) _then) = __$CreditorNodeCopyWithImpl;
@override @useResult
$Res call({
 String id, String supplierName, String? phone, int balanceDueFcfa, DateTime? dueDate
});




}
/// @nodoc
class __$CreditorNodeCopyWithImpl<$Res>
    implements _$CreditorNodeCopyWith<$Res> {
  __$CreditorNodeCopyWithImpl(this._self, this._then);

  final _CreditorNode _self;
  final $Res Function(_CreditorNode) _then;

/// Create a copy of CreditorNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? supplierName = null,Object? phone = freezed,Object? balanceDueFcfa = null,Object? dueDate = freezed,}) {
  return _then(_CreditorNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,supplierName: null == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,balanceDueFcfa: null == balanceDueFcfa ? _self.balanceDueFcfa : balanceDueFcfa // ignore: cast_nullable_to_non_nullable
as int,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
