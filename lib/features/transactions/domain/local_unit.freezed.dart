// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocalUnit {

 String get id; String get name; bool get isCustom;
/// Create a copy of LocalUnit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalUnitCopyWith<LocalUnit> get copyWith => _$LocalUnitCopyWithImpl<LocalUnit>(this as LocalUnit, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LocalUnit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalUnit&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.isCustom, _this.isCustom) || other.isCustom == _this.isCustom));
}


@override
int get hashCode {
  final _this = this as LocalUnit;
  return Object.hash(runtimeType,_this.id,_this.name,_this.isCustom);
}

@override
String toString() {
  final _this = this as LocalUnit;
  return 'LocalUnit(id: ${_this.id}, name: ${_this.name}, isCustom: ${_this.isCustom})';
}


}

/// @nodoc
abstract mixin class $LocalUnitCopyWith<$Res>  {
  factory $LocalUnitCopyWith(LocalUnit value, $Res Function(LocalUnit) _then) = _$LocalUnitCopyWithImpl;
@useResult
$Res call({
 String id, String name, bool isCustom
});




}
/// @nodoc
class _$LocalUnitCopyWithImpl<$Res>
    implements $LocalUnitCopyWith<$Res> {
  _$LocalUnitCopyWithImpl(this._self, this._then);

  final LocalUnit _self;
  final $Res Function(LocalUnit) _then;

/// Create a copy of LocalUnit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? isCustom = null,}) {
  return _then(LocalUnit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalUnit].
extension LocalUnitPatterns on LocalUnit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalUnit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalUnit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalUnit value)  $default,){
final _that = this;
switch (_that) {
case _LocalUnit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalUnit value)?  $default,){
final _that = this;
switch (_that) {
case _LocalUnit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  bool isCustom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalUnit() when $default != null:
return $default(_that.id,_that.name,_that.isCustom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  bool isCustom)  $default,) {final _that = this;
switch (_that) {
case _LocalUnit():
return $default(_that.id,_that.name,_that.isCustom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  bool isCustom)?  $default,) {final _that = this;
switch (_that) {
case _LocalUnit() when $default != null:
return $default(_that.id,_that.name,_that.isCustom);case _:
  return null;

}
}

}

/// @nodoc


class _LocalUnit implements LocalUnit {
  const _LocalUnit({required this.id, required this.name, this.isCustom = false});
  

@override final  String id;
@override final  String name;
@override@JsonKey() final  bool isCustom;

/// Create a copy of LocalUnit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalUnitCopyWith<_LocalUnit> get copyWith => __$LocalUnitCopyWithImpl<_LocalUnit>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalUnit&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,isCustom);
}

@override
String toString() {
    return 'LocalUnit(id: $id, name: $name, isCustom: $isCustom)';
}


}

/// @nodoc
abstract mixin class _$LocalUnitCopyWith<$Res> implements $LocalUnitCopyWith<$Res> {
  factory _$LocalUnitCopyWith(_LocalUnit value, $Res Function(_LocalUnit) _then) = __$LocalUnitCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, bool isCustom
});




}
/// @nodoc
class __$LocalUnitCopyWithImpl<$Res>
    implements _$LocalUnitCopyWith<$Res> {
  __$LocalUnitCopyWithImpl(this._self, this._then);

  final _LocalUnit _self;
  final $Res Function(_LocalUnit) _then;

/// Create a copy of LocalUnit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? isCustom = null,}) {
  return _then(_LocalUnit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
