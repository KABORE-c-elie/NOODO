// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creditor_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreditorPayment {

 String get id; String get creditorId; String get receiptNumber; int get amountFcfa; PaymentMethod get method; String? get reason; DateTime get date; int get remainingAfterFcfa; String get creditorName; String? get creditorPhone;
/// Create a copy of CreditorPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditorPaymentCopyWith<CreditorPayment> get copyWith => _$CreditorPaymentCopyWithImpl<CreditorPayment>(this as CreditorPayment, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CreditorPayment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditorPayment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.creditorId, _this.creditorId) || other.creditorId == _this.creditorId)&&(identical(other.receiptNumber, _this.receiptNumber) || other.receiptNumber == _this.receiptNumber)&&(identical(other.amountFcfa, _this.amountFcfa) || other.amountFcfa == _this.amountFcfa)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.remainingAfterFcfa, _this.remainingAfterFcfa) || other.remainingAfterFcfa == _this.remainingAfterFcfa)&&(identical(other.creditorName, _this.creditorName) || other.creditorName == _this.creditorName)&&(identical(other.creditorPhone, _this.creditorPhone) || other.creditorPhone == _this.creditorPhone));
}


@override
int get hashCode {
  final _this = this as CreditorPayment;
  return Object.hash(runtimeType,_this.id,_this.creditorId,_this.receiptNumber,_this.amountFcfa,_this.method,_this.reason,_this.date,_this.remainingAfterFcfa,_this.creditorName,_this.creditorPhone);
}

@override
String toString() {
  final _this = this as CreditorPayment;
  return 'CreditorPayment(id: ${_this.id}, creditorId: ${_this.creditorId}, receiptNumber: ${_this.receiptNumber}, amountFcfa: ${_this.amountFcfa}, method: ${_this.method}, reason: ${_this.reason}, date: ${_this.date}, remainingAfterFcfa: ${_this.remainingAfterFcfa}, creditorName: ${_this.creditorName}, creditorPhone: ${_this.creditorPhone})';
}


}

/// @nodoc
abstract mixin class $CreditorPaymentCopyWith<$Res>  {
  factory $CreditorPaymentCopyWith(CreditorPayment value, $Res Function(CreditorPayment) _then) = _$CreditorPaymentCopyWithImpl;
@useResult
$Res call({
 String id, String creditorId, String receiptNumber, int amountFcfa, PaymentMethod method, String? reason, DateTime date, int remainingAfterFcfa, String creditorName, String? creditorPhone
});




}
/// @nodoc
class _$CreditorPaymentCopyWithImpl<$Res>
    implements $CreditorPaymentCopyWith<$Res> {
  _$CreditorPaymentCopyWithImpl(this._self, this._then);

  final CreditorPayment _self;
  final $Res Function(CreditorPayment) _then;

/// Create a copy of CreditorPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creditorId = null,Object? receiptNumber = null,Object? amountFcfa = null,Object? method = null,Object? reason = freezed,Object? date = null,Object? remainingAfterFcfa = null,Object? creditorName = null,Object? creditorPhone = freezed,}) {
  return _then(CreditorPayment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creditorId: null == creditorId ? _self.creditorId : creditorId // ignore: cast_nullable_to_non_nullable
as String,receiptNumber: null == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String,amountFcfa: null == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,remainingAfterFcfa: null == remainingAfterFcfa ? _self.remainingAfterFcfa : remainingAfterFcfa // ignore: cast_nullable_to_non_nullable
as int,creditorName: null == creditorName ? _self.creditorName : creditorName // ignore: cast_nullable_to_non_nullable
as String,creditorPhone: freezed == creditorPhone ? _self.creditorPhone : creditorPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditorPayment].
extension CreditorPaymentPatterns on CreditorPayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditorPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditorPayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditorPayment value)  $default,){
final _that = this;
switch (_that) {
case _CreditorPayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditorPayment value)?  $default,){
final _that = this;
switch (_that) {
case _CreditorPayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String creditorId,  String receiptNumber,  int amountFcfa,  PaymentMethod method,  String? reason,  DateTime date,  int remainingAfterFcfa,  String creditorName,  String? creditorPhone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditorPayment() when $default != null:
return $default(_that.id,_that.creditorId,_that.receiptNumber,_that.amountFcfa,_that.method,_that.reason,_that.date,_that.remainingAfterFcfa,_that.creditorName,_that.creditorPhone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String creditorId,  String receiptNumber,  int amountFcfa,  PaymentMethod method,  String? reason,  DateTime date,  int remainingAfterFcfa,  String creditorName,  String? creditorPhone)  $default,) {final _that = this;
switch (_that) {
case _CreditorPayment():
return $default(_that.id,_that.creditorId,_that.receiptNumber,_that.amountFcfa,_that.method,_that.reason,_that.date,_that.remainingAfterFcfa,_that.creditorName,_that.creditorPhone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String creditorId,  String receiptNumber,  int amountFcfa,  PaymentMethod method,  String? reason,  DateTime date,  int remainingAfterFcfa,  String creditorName,  String? creditorPhone)?  $default,) {final _that = this;
switch (_that) {
case _CreditorPayment() when $default != null:
return $default(_that.id,_that.creditorId,_that.receiptNumber,_that.amountFcfa,_that.method,_that.reason,_that.date,_that.remainingAfterFcfa,_that.creditorName,_that.creditorPhone);case _:
  return null;

}
}

}

/// @nodoc


class _CreditorPayment implements CreditorPayment {
  const _CreditorPayment({required this.id, required this.creditorId, required this.receiptNumber, required this.amountFcfa, required this.method, this.reason, required this.date, required this.remainingAfterFcfa, required this.creditorName, this.creditorPhone});
  

@override final  String id;
@override final  String creditorId;
@override final  String receiptNumber;
@override final  int amountFcfa;
@override final  PaymentMethod method;
@override final  String? reason;
@override final  DateTime date;
@override final  int remainingAfterFcfa;
@override final  String creditorName;
@override final  String? creditorPhone;

/// Create a copy of CreditorPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditorPaymentCopyWith<_CreditorPayment> get copyWith => __$CreditorPaymentCopyWithImpl<_CreditorPayment>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditorPayment&&(identical(other.id, id) || other.id == id)&&(identical(other.creditorId, creditorId) || other.creditorId == creditorId)&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.amountFcfa, amountFcfa) || other.amountFcfa == amountFcfa)&&(identical(other.method, method) || other.method == method)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.date, date) || other.date == date)&&(identical(other.remainingAfterFcfa, remainingAfterFcfa) || other.remainingAfterFcfa == remainingAfterFcfa)&&(identical(other.creditorName, creditorName) || other.creditorName == creditorName)&&(identical(other.creditorPhone, creditorPhone) || other.creditorPhone == creditorPhone));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,creditorId,receiptNumber,amountFcfa,method,reason,date,remainingAfterFcfa,creditorName,creditorPhone);
}

@override
String toString() {
    return 'CreditorPayment(id: $id, creditorId: $creditorId, receiptNumber: $receiptNumber, amountFcfa: $amountFcfa, method: $method, reason: $reason, date: $date, remainingAfterFcfa: $remainingAfterFcfa, creditorName: $creditorName, creditorPhone: $creditorPhone)';
}


}

/// @nodoc
abstract mixin class _$CreditorPaymentCopyWith<$Res> implements $CreditorPaymentCopyWith<$Res> {
  factory _$CreditorPaymentCopyWith(_CreditorPayment value, $Res Function(_CreditorPayment) _then) = __$CreditorPaymentCopyWithImpl;
@override @useResult
$Res call({
 String id, String creditorId, String receiptNumber, int amountFcfa, PaymentMethod method, String? reason, DateTime date, int remainingAfterFcfa, String creditorName, String? creditorPhone
});




}
/// @nodoc
class __$CreditorPaymentCopyWithImpl<$Res>
    implements _$CreditorPaymentCopyWith<$Res> {
  __$CreditorPaymentCopyWithImpl(this._self, this._then);

  final _CreditorPayment _self;
  final $Res Function(_CreditorPayment) _then;

/// Create a copy of CreditorPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creditorId = null,Object? receiptNumber = null,Object? amountFcfa = null,Object? method = null,Object? reason = freezed,Object? date = null,Object? remainingAfterFcfa = null,Object? creditorName = null,Object? creditorPhone = freezed,}) {
  return _then(_CreditorPayment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creditorId: null == creditorId ? _self.creditorId : creditorId // ignore: cast_nullable_to_non_nullable
as String,receiptNumber: null == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String,amountFcfa: null == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,remainingAfterFcfa: null == remainingAfterFcfa ? _self.remainingAfterFcfa : remainingAfterFcfa // ignore: cast_nullable_to_non_nullable
as int,creditorName: null == creditorName ? _self.creditorName : creditorName // ignore: cast_nullable_to_non_nullable
as String,creditorPhone: freezed == creditorPhone ? _self.creditorPhone : creditorPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PaymentRequest {

 String get paymentId; String get transactionId; String get creditorId; int get amountFcfa; PaymentMethod get method; String? get reason; DateTime get date; String get expenseText;
/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentRequestCopyWith<PaymentRequest> get copyWith => _$PaymentRequestCopyWithImpl<PaymentRequest>(this as PaymentRequest, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PaymentRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentRequest&&(identical(other.paymentId, _this.paymentId) || other.paymentId == _this.paymentId)&&(identical(other.transactionId, _this.transactionId) || other.transactionId == _this.transactionId)&&(identical(other.creditorId, _this.creditorId) || other.creditorId == _this.creditorId)&&(identical(other.amountFcfa, _this.amountFcfa) || other.amountFcfa == _this.amountFcfa)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.expenseText, _this.expenseText) || other.expenseText == _this.expenseText));
}


@override
int get hashCode {
  final _this = this as PaymentRequest;
  return Object.hash(runtimeType,_this.paymentId,_this.transactionId,_this.creditorId,_this.amountFcfa,_this.method,_this.reason,_this.date,_this.expenseText);
}

@override
String toString() {
  final _this = this as PaymentRequest;
  return 'PaymentRequest(paymentId: ${_this.paymentId}, transactionId: ${_this.transactionId}, creditorId: ${_this.creditorId}, amountFcfa: ${_this.amountFcfa}, method: ${_this.method}, reason: ${_this.reason}, date: ${_this.date}, expenseText: ${_this.expenseText})';
}


}

/// @nodoc
abstract mixin class $PaymentRequestCopyWith<$Res>  {
  factory $PaymentRequestCopyWith(PaymentRequest value, $Res Function(PaymentRequest) _then) = _$PaymentRequestCopyWithImpl;
@useResult
$Res call({
 String paymentId, String transactionId, String creditorId, int amountFcfa, PaymentMethod method, String? reason, DateTime date, String expenseText
});




}
/// @nodoc
class _$PaymentRequestCopyWithImpl<$Res>
    implements $PaymentRequestCopyWith<$Res> {
  _$PaymentRequestCopyWithImpl(this._self, this._then);

  final PaymentRequest _self;
  final $Res Function(PaymentRequest) _then;

/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentId = null,Object? transactionId = null,Object? creditorId = null,Object? amountFcfa = null,Object? method = null,Object? reason = freezed,Object? date = null,Object? expenseText = null,}) {
  return _then(PaymentRequest(
paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,creditorId: null == creditorId ? _self.creditorId : creditorId // ignore: cast_nullable_to_non_nullable
as String,amountFcfa: null == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,expenseText: null == expenseText ? _self.expenseText : expenseText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentRequest].
extension PaymentRequestPatterns on PaymentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentRequest value)  $default,){
final _that = this;
switch (_that) {
case _PaymentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String paymentId,  String transactionId,  String creditorId,  int amountFcfa,  PaymentMethod method,  String? reason,  DateTime date,  String expenseText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentRequest() when $default != null:
return $default(_that.paymentId,_that.transactionId,_that.creditorId,_that.amountFcfa,_that.method,_that.reason,_that.date,_that.expenseText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String paymentId,  String transactionId,  String creditorId,  int amountFcfa,  PaymentMethod method,  String? reason,  DateTime date,  String expenseText)  $default,) {final _that = this;
switch (_that) {
case _PaymentRequest():
return $default(_that.paymentId,_that.transactionId,_that.creditorId,_that.amountFcfa,_that.method,_that.reason,_that.date,_that.expenseText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String paymentId,  String transactionId,  String creditorId,  int amountFcfa,  PaymentMethod method,  String? reason,  DateTime date,  String expenseText)?  $default,) {final _that = this;
switch (_that) {
case _PaymentRequest() when $default != null:
return $default(_that.paymentId,_that.transactionId,_that.creditorId,_that.amountFcfa,_that.method,_that.reason,_that.date,_that.expenseText);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentRequest implements PaymentRequest {
  const _PaymentRequest({required this.paymentId, required this.transactionId, required this.creditorId, required this.amountFcfa, required this.method, this.reason, required this.date, required this.expenseText});
  

@override final  String paymentId;
@override final  String transactionId;
@override final  String creditorId;
@override final  int amountFcfa;
@override final  PaymentMethod method;
@override final  String? reason;
@override final  DateTime date;
@override final  String expenseText;

/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentRequestCopyWith<_PaymentRequest> get copyWith => __$PaymentRequestCopyWithImpl<_PaymentRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentRequest&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.creditorId, creditorId) || other.creditorId == creditorId)&&(identical(other.amountFcfa, amountFcfa) || other.amountFcfa == amountFcfa)&&(identical(other.method, method) || other.method == method)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.date, date) || other.date == date)&&(identical(other.expenseText, expenseText) || other.expenseText == expenseText));
}


@override
int get hashCode {
    return Object.hash(runtimeType,paymentId,transactionId,creditorId,amountFcfa,method,reason,date,expenseText);
}

@override
String toString() {
    return 'PaymentRequest(paymentId: $paymentId, transactionId: $transactionId, creditorId: $creditorId, amountFcfa: $amountFcfa, method: $method, reason: $reason, date: $date, expenseText: $expenseText)';
}


}

/// @nodoc
abstract mixin class _$PaymentRequestCopyWith<$Res> implements $PaymentRequestCopyWith<$Res> {
  factory _$PaymentRequestCopyWith(_PaymentRequest value, $Res Function(_PaymentRequest) _then) = __$PaymentRequestCopyWithImpl;
@override @useResult
$Res call({
 String paymentId, String transactionId, String creditorId, int amountFcfa, PaymentMethod method, String? reason, DateTime date, String expenseText
});




}
/// @nodoc
class __$PaymentRequestCopyWithImpl<$Res>
    implements _$PaymentRequestCopyWith<$Res> {
  __$PaymentRequestCopyWithImpl(this._self, this._then);

  final _PaymentRequest _self;
  final $Res Function(_PaymentRequest) _then;

/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentId = null,Object? transactionId = null,Object? creditorId = null,Object? amountFcfa = null,Object? method = null,Object? reason = freezed,Object? date = null,Object? expenseText = null,}) {
  return _then(_PaymentRequest(
paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,creditorId: null == creditorId ? _self.creditorId : creditorId // ignore: cast_nullable_to_non_nullable
as String,amountFcfa: null == amountFcfa ? _self.amountFcfa : amountFcfa // ignore: cast_nullable_to_non_nullable
as int,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,expenseText: null == expenseText ? _self.expenseText : expenseText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
