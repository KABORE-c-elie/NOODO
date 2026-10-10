// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listening_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListeningState {

 ListeningPhase get phase; String get partialText; String? get finalText; SpeechFailure? get failure;
/// Create a copy of ListeningState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListeningStateCopyWith<ListeningState> get copyWith => _$ListeningStateCopyWithImpl<ListeningState>(this as ListeningState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ListeningState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListeningState&&(identical(other.phase, _this.phase) || other.phase == _this.phase)&&(identical(other.partialText, _this.partialText) || other.partialText == _this.partialText)&&(identical(other.finalText, _this.finalText) || other.finalText == _this.finalText)&&(identical(other.failure, _this.failure) || other.failure == _this.failure));
}


@override
int get hashCode {
  final _this = this as ListeningState;
  return Object.hash(runtimeType,_this.phase,_this.partialText,_this.finalText,_this.failure);
}

@override
String toString() {
  final _this = this as ListeningState;
  return 'ListeningState(phase: ${_this.phase}, partialText: ${_this.partialText}, finalText: ${_this.finalText}, failure: ${_this.failure})';
}


}

/// @nodoc
abstract mixin class $ListeningStateCopyWith<$Res>  {
  factory $ListeningStateCopyWith(ListeningState value, $Res Function(ListeningState) _then) = _$ListeningStateCopyWithImpl;
@useResult
$Res call({
 ListeningPhase phase, String partialText, String? finalText, SpeechFailure? failure
});




}
/// @nodoc
class _$ListeningStateCopyWithImpl<$Res>
    implements $ListeningStateCopyWith<$Res> {
  _$ListeningStateCopyWithImpl(this._self, this._then);

  final ListeningState _self;
  final $Res Function(ListeningState) _then;

/// Create a copy of ListeningState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phase = null,Object? partialText = null,Object? finalText = freezed,Object? failure = freezed,}) {
  return _then(ListeningState(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ListeningPhase,partialText: null == partialText ? _self.partialText : partialText // ignore: cast_nullable_to_non_nullable
as String,finalText: freezed == finalText ? _self.finalText : finalText // ignore: cast_nullable_to_non_nullable
as String?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as SpeechFailure?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListeningState].
extension ListeningStatePatterns on ListeningState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListeningState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListeningState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListeningState value)  $default,){
final _that = this;
switch (_that) {
case _ListeningState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListeningState value)?  $default,){
final _that = this;
switch (_that) {
case _ListeningState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListeningPhase phase,  String partialText,  String? finalText,  SpeechFailure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListeningState() when $default != null:
return $default(_that.phase,_that.partialText,_that.finalText,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListeningPhase phase,  String partialText,  String? finalText,  SpeechFailure? failure)  $default,) {final _that = this;
switch (_that) {
case _ListeningState():
return $default(_that.phase,_that.partialText,_that.finalText,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListeningPhase phase,  String partialText,  String? finalText,  SpeechFailure? failure)?  $default,) {final _that = this;
switch (_that) {
case _ListeningState() when $default != null:
return $default(_that.phase,_that.partialText,_that.finalText,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _ListeningState extends ListeningState {
  const _ListeningState({this.phase = ListeningPhase.idle, this.partialText = '', this.finalText, this.failure}): super._();
  

@override@JsonKey() final  ListeningPhase phase;
@override@JsonKey() final  String partialText;
@override final  String? finalText;
@override final  SpeechFailure? failure;

/// Create a copy of ListeningState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListeningStateCopyWith<_ListeningState> get copyWith => __$ListeningStateCopyWithImpl<_ListeningState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListeningState&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.partialText, partialText) || other.partialText == partialText)&&(identical(other.finalText, finalText) || other.finalText == finalText)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,phase,partialText,finalText,failure);
}

@override
String toString() {
    return 'ListeningState(phase: $phase, partialText: $partialText, finalText: $finalText, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ListeningStateCopyWith<$Res> implements $ListeningStateCopyWith<$Res> {
  factory _$ListeningStateCopyWith(_ListeningState value, $Res Function(_ListeningState) _then) = __$ListeningStateCopyWithImpl;
@override @useResult
$Res call({
 ListeningPhase phase, String partialText, String? finalText, SpeechFailure? failure
});




}
/// @nodoc
class __$ListeningStateCopyWithImpl<$Res>
    implements _$ListeningStateCopyWith<$Res> {
  __$ListeningStateCopyWithImpl(this._self, this._then);

  final _ListeningState _self;
  final $Res Function(_ListeningState) _then;

/// Create a copy of ListeningState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? partialText = null,Object? finalText = freezed,Object? failure = freezed,}) {
  return _then(_ListeningState(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ListeningPhase,partialText: null == partialText ? _self.partialText : partialText // ignore: cast_nullable_to_non_nullable
as String,finalText: freezed == finalText ? _self.finalText : finalText // ignore: cast_nullable_to_non_nullable
as String?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as SpeechFailure?,
  ));
}


}

// dart format on
