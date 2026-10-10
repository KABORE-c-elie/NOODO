// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speech_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SpeechEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeechEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SpeechEvent()';
}


}

/// @nodoc
class $SpeechEventCopyWith<$Res>  {
$SpeechEventCopyWith(SpeechEvent _, $Res Function(SpeechEvent) __);
}


/// Adds pattern-matching-related methods to [SpeechEvent].
extension SpeechEventPatterns on SpeechEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SpeechPartial value)?  partial,TResult Function( SpeechFinal value)?  finalResult,TResult Function( SpeechFailed value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SpeechPartial() when partial != null:
return partial(_that);case SpeechFinal() when finalResult != null:
return finalResult(_that);case SpeechFailed() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SpeechPartial value)  partial,required TResult Function( SpeechFinal value)  finalResult,required TResult Function( SpeechFailed value)  failure,}){
final _that = this;
switch (_that) {
case SpeechPartial():
return partial(_that);case SpeechFinal():
return finalResult(_that);case SpeechFailed():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SpeechPartial value)?  partial,TResult? Function( SpeechFinal value)?  finalResult,TResult? Function( SpeechFailed value)?  failure,}){
final _that = this;
switch (_that) {
case SpeechPartial() when partial != null:
return partial(_that);case SpeechFinal() when finalResult != null:
return finalResult(_that);case SpeechFailed() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text)?  partial,TResult Function( String text)?  finalResult,TResult Function( SpeechFailure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SpeechPartial() when partial != null:
return partial(_that.text);case SpeechFinal() when finalResult != null:
return finalResult(_that.text);case SpeechFailed() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text)  partial,required TResult Function( String text)  finalResult,required TResult Function( SpeechFailure failure)  failure,}) {final _that = this;
switch (_that) {
case SpeechPartial():
return partial(_that.text);case SpeechFinal():
return finalResult(_that.text);case SpeechFailed():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text)?  partial,TResult? Function( String text)?  finalResult,TResult? Function( SpeechFailure failure)?  failure,}) {final _that = this;
switch (_that) {
case SpeechPartial() when partial != null:
return partial(_that.text);case SpeechFinal() when finalResult != null:
return finalResult(_that.text);case SpeechFailed() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class SpeechPartial implements SpeechEvent {
  const SpeechPartial(this.text);
  

 final  String text;

/// Create a copy of SpeechEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeechPartialCopyWith<SpeechPartial> get copyWith => _$SpeechPartialCopyWithImpl<SpeechPartial>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeechPartial&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'SpeechEvent.partial(text: $text)';
}


}

/// @nodoc
abstract mixin class $SpeechPartialCopyWith<$Res> implements $SpeechEventCopyWith<$Res> {
  factory $SpeechPartialCopyWith(SpeechPartial value, $Res Function(SpeechPartial) _then) = _$SpeechPartialCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$SpeechPartialCopyWithImpl<$Res>
    implements $SpeechPartialCopyWith<$Res> {
  _$SpeechPartialCopyWithImpl(this._self, this._then);

  final SpeechPartial _self;
  final $Res Function(SpeechPartial) _then;

/// Create a copy of SpeechEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(SpeechPartial(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SpeechFinal implements SpeechEvent {
  const SpeechFinal(this.text);
  

 final  String text;

/// Create a copy of SpeechEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeechFinalCopyWith<SpeechFinal> get copyWith => _$SpeechFinalCopyWithImpl<SpeechFinal>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeechFinal&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'SpeechEvent.finalResult(text: $text)';
}


}

/// @nodoc
abstract mixin class $SpeechFinalCopyWith<$Res> implements $SpeechEventCopyWith<$Res> {
  factory $SpeechFinalCopyWith(SpeechFinal value, $Res Function(SpeechFinal) _then) = _$SpeechFinalCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$SpeechFinalCopyWithImpl<$Res>
    implements $SpeechFinalCopyWith<$Res> {
  _$SpeechFinalCopyWithImpl(this._self, this._then);

  final SpeechFinal _self;
  final $Res Function(SpeechFinal) _then;

/// Create a copy of SpeechEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(SpeechFinal(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SpeechFailed implements SpeechEvent {
  const SpeechFailed(this.failure);
  

 final  SpeechFailure failure;

/// Create a copy of SpeechEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeechFailedCopyWith<SpeechFailed> get copyWith => _$SpeechFailedCopyWithImpl<SpeechFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeechFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'SpeechEvent.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SpeechFailedCopyWith<$Res> implements $SpeechEventCopyWith<$Res> {
  factory $SpeechFailedCopyWith(SpeechFailed value, $Res Function(SpeechFailed) _then) = _$SpeechFailedCopyWithImpl;
@useResult
$Res call({
 SpeechFailure failure
});




}
/// @nodoc
class _$SpeechFailedCopyWithImpl<$Res>
    implements $SpeechFailedCopyWith<$Res> {
  _$SpeechFailedCopyWithImpl(this._self, this._then);

  final SpeechFailed _self;
  final $Res Function(SpeechFailed) _then;

/// Create a copy of SpeechEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(SpeechFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as SpeechFailure,
  ));
}


}

// dart format on
