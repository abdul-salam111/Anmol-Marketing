// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyOtpModel {

@JsonKey(name: 'CustomerId') String get customerId;@JsonKey(name: 'Otp') String get otp;
/// Create a copy of VerifyOtpModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpModelCopyWith<VerifyOtpModel> get copyWith => _$VerifyOtpModelCopyWithImpl<VerifyOtpModel>(this as VerifyOtpModel, _$identity);

  /// Serializes this VerifyOtpModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpModel&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,otp);

@override
String toString() {
  return 'VerifyOtpModel(customerId: $customerId, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpModelCopyWith<$Res>  {
  factory $VerifyOtpModelCopyWith(VerifyOtpModel value, $Res Function(VerifyOtpModel) _then) = _$VerifyOtpModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'CustomerId') String customerId,@JsonKey(name: 'Otp') String otp
});




}
/// @nodoc
class _$VerifyOtpModelCopyWithImpl<$Res>
    implements $VerifyOtpModelCopyWith<$Res> {
  _$VerifyOtpModelCopyWithImpl(this._self, this._then);

  final VerifyOtpModel _self;
  final $Res Function(VerifyOtpModel) _then;

/// Create a copy of VerifyOtpModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerId = null,Object? otp = null,}) {
  return _then(_self.copyWith(
customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyOtpModel].
extension VerifyOtpModelPatterns on VerifyOtpModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'CustomerId')  String customerId, @JsonKey(name: 'Otp')  String otp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpModel() when $default != null:
return $default(_that.customerId,_that.otp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'CustomerId')  String customerId, @JsonKey(name: 'Otp')  String otp)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpModel():
return $default(_that.customerId,_that.otp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'CustomerId')  String customerId, @JsonKey(name: 'Otp')  String otp)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpModel() when $default != null:
return $default(_that.customerId,_that.otp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpModel implements VerifyOtpModel {
  const _VerifyOtpModel({@JsonKey(name: 'CustomerId') required this.customerId, @JsonKey(name: 'Otp') required this.otp});
  factory _VerifyOtpModel.fromJson(Map<String, dynamic> json) => _$VerifyOtpModelFromJson(json);

@override@JsonKey(name: 'CustomerId') final  String customerId;
@override@JsonKey(name: 'Otp') final  String otp;

/// Create a copy of VerifyOtpModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpModelCopyWith<_VerifyOtpModel> get copyWith => __$VerifyOtpModelCopyWithImpl<_VerifyOtpModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpModel&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,otp);

@override
String toString() {
  return 'VerifyOtpModel(customerId: $customerId, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpModelCopyWith<$Res> implements $VerifyOtpModelCopyWith<$Res> {
  factory _$VerifyOtpModelCopyWith(_VerifyOtpModel value, $Res Function(_VerifyOtpModel) _then) = __$VerifyOtpModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'CustomerId') String customerId,@JsonKey(name: 'Otp') String otp
});




}
/// @nodoc
class __$VerifyOtpModelCopyWithImpl<$Res>
    implements _$VerifyOtpModelCopyWith<$Res> {
  __$VerifyOtpModelCopyWithImpl(this._self, this._then);

  final _VerifyOtpModel _self;
  final $Res Function(_VerifyOtpModel) _then;

/// Create a copy of VerifyOtpModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerId = null,Object? otp = null,}) {
  return _then(_VerifyOtpModel(
customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
