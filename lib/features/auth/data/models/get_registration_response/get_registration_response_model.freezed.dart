// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_registration_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetRegistrationResponseModel {

@JsonKey(name: 'CustomerId') int get customerId;@JsonKey(name: 'OTP') String get otp;@JsonKey(name: 'MobileNbr') String get mobileNbr;@JsonKey(name: 'CustomerName') String get customerName;@JsonKey(name: 'Password') String get password;@JsonKey(name: 'LocationId') int get locationId;@JsonKey(name: 'LicenseNbr') String get licenseNbr;@JsonKey(name: 'Address') String get address;@JsonKey(name: 'LicenseExpiryDate') DateTime get licenseExpiryDate;
/// Create a copy of GetRegistrationResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetRegistrationResponseModelCopyWith<GetRegistrationResponseModel> get copyWith => _$GetRegistrationResponseModelCopyWithImpl<GetRegistrationResponseModel>(this as GetRegistrationResponseModel, _$identity);

  /// Serializes this GetRegistrationResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetRegistrationResponseModel&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.mobileNbr, mobileNbr) || other.mobileNbr == mobileNbr)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.password, password) || other.password == password)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.licenseNbr, licenseNbr) || other.licenseNbr == licenseNbr)&&(identical(other.address, address) || other.address == address)&&(identical(other.licenseExpiryDate, licenseExpiryDate) || other.licenseExpiryDate == licenseExpiryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,otp,mobileNbr,customerName,password,locationId,licenseNbr,address,licenseExpiryDate);

@override
String toString() {
  return 'GetRegistrationResponseModel(customerId: $customerId, otp: $otp, mobileNbr: $mobileNbr, customerName: $customerName, password: $password, locationId: $locationId, licenseNbr: $licenseNbr, address: $address, licenseExpiryDate: $licenseExpiryDate)';
}


}

/// @nodoc
abstract mixin class $GetRegistrationResponseModelCopyWith<$Res>  {
  factory $GetRegistrationResponseModelCopyWith(GetRegistrationResponseModel value, $Res Function(GetRegistrationResponseModel) _then) = _$GetRegistrationResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'CustomerId') int customerId,@JsonKey(name: 'OTP') String otp,@JsonKey(name: 'MobileNbr') String mobileNbr,@JsonKey(name: 'CustomerName') String customerName,@JsonKey(name: 'Password') String password,@JsonKey(name: 'LocationId') int locationId,@JsonKey(name: 'LicenseNbr') String licenseNbr,@JsonKey(name: 'Address') String address,@JsonKey(name: 'LicenseExpiryDate') DateTime licenseExpiryDate
});




}
/// @nodoc
class _$GetRegistrationResponseModelCopyWithImpl<$Res>
    implements $GetRegistrationResponseModelCopyWith<$Res> {
  _$GetRegistrationResponseModelCopyWithImpl(this._self, this._then);

  final GetRegistrationResponseModel _self;
  final $Res Function(GetRegistrationResponseModel) _then;

/// Create a copy of GetRegistrationResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerId = null,Object? otp = null,Object? mobileNbr = null,Object? customerName = null,Object? password = null,Object? locationId = null,Object? licenseNbr = null,Object? address = null,Object? licenseExpiryDate = null,}) {
  return _then(_self.copyWith(
customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,mobileNbr: null == mobileNbr ? _self.mobileNbr : mobileNbr // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,licenseNbr: null == licenseNbr ? _self.licenseNbr : licenseNbr // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,licenseExpiryDate: null == licenseExpiryDate ? _self.licenseExpiryDate : licenseExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [GetRegistrationResponseModel].
extension GetRegistrationResponseModelPatterns on GetRegistrationResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetRegistrationResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetRegistrationResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetRegistrationResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _GetRegistrationResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetRegistrationResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _GetRegistrationResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'CustomerId')  int customerId, @JsonKey(name: 'OTP')  String otp, @JsonKey(name: 'MobileNbr')  String mobileNbr, @JsonKey(name: 'CustomerName')  String customerName, @JsonKey(name: 'Password')  String password, @JsonKey(name: 'LocationId')  int locationId, @JsonKey(name: 'LicenseNbr')  String licenseNbr, @JsonKey(name: 'Address')  String address, @JsonKey(name: 'LicenseExpiryDate')  DateTime licenseExpiryDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetRegistrationResponseModel() when $default != null:
return $default(_that.customerId,_that.otp,_that.mobileNbr,_that.customerName,_that.password,_that.locationId,_that.licenseNbr,_that.address,_that.licenseExpiryDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'CustomerId')  int customerId, @JsonKey(name: 'OTP')  String otp, @JsonKey(name: 'MobileNbr')  String mobileNbr, @JsonKey(name: 'CustomerName')  String customerName, @JsonKey(name: 'Password')  String password, @JsonKey(name: 'LocationId')  int locationId, @JsonKey(name: 'LicenseNbr')  String licenseNbr, @JsonKey(name: 'Address')  String address, @JsonKey(name: 'LicenseExpiryDate')  DateTime licenseExpiryDate)  $default,) {final _that = this;
switch (_that) {
case _GetRegistrationResponseModel():
return $default(_that.customerId,_that.otp,_that.mobileNbr,_that.customerName,_that.password,_that.locationId,_that.licenseNbr,_that.address,_that.licenseExpiryDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'CustomerId')  int customerId, @JsonKey(name: 'OTP')  String otp, @JsonKey(name: 'MobileNbr')  String mobileNbr, @JsonKey(name: 'CustomerName')  String customerName, @JsonKey(name: 'Password')  String password, @JsonKey(name: 'LocationId')  int locationId, @JsonKey(name: 'LicenseNbr')  String licenseNbr, @JsonKey(name: 'Address')  String address, @JsonKey(name: 'LicenseExpiryDate')  DateTime licenseExpiryDate)?  $default,) {final _that = this;
switch (_that) {
case _GetRegistrationResponseModel() when $default != null:
return $default(_that.customerId,_that.otp,_that.mobileNbr,_that.customerName,_that.password,_that.locationId,_that.licenseNbr,_that.address,_that.licenseExpiryDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetRegistrationResponseModel implements GetRegistrationResponseModel {
  const _GetRegistrationResponseModel({@JsonKey(name: 'CustomerId') required this.customerId, @JsonKey(name: 'OTP') required this.otp, @JsonKey(name: 'MobileNbr') required this.mobileNbr, @JsonKey(name: 'CustomerName') required this.customerName, @JsonKey(name: 'Password') required this.password, @JsonKey(name: 'LocationId') required this.locationId, @JsonKey(name: 'LicenseNbr') required this.licenseNbr, @JsonKey(name: 'Address') required this.address, @JsonKey(name: 'LicenseExpiryDate') required this.licenseExpiryDate});
  factory _GetRegistrationResponseModel.fromJson(Map<String, dynamic> json) => _$GetRegistrationResponseModelFromJson(json);

@override@JsonKey(name: 'CustomerId') final  int customerId;
@override@JsonKey(name: 'OTP') final  String otp;
@override@JsonKey(name: 'MobileNbr') final  String mobileNbr;
@override@JsonKey(name: 'CustomerName') final  String customerName;
@override@JsonKey(name: 'Password') final  String password;
@override@JsonKey(name: 'LocationId') final  int locationId;
@override@JsonKey(name: 'LicenseNbr') final  String licenseNbr;
@override@JsonKey(name: 'Address') final  String address;
@override@JsonKey(name: 'LicenseExpiryDate') final  DateTime licenseExpiryDate;

/// Create a copy of GetRegistrationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetRegistrationResponseModelCopyWith<_GetRegistrationResponseModel> get copyWith => __$GetRegistrationResponseModelCopyWithImpl<_GetRegistrationResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetRegistrationResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetRegistrationResponseModel&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.mobileNbr, mobileNbr) || other.mobileNbr == mobileNbr)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.password, password) || other.password == password)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.licenseNbr, licenseNbr) || other.licenseNbr == licenseNbr)&&(identical(other.address, address) || other.address == address)&&(identical(other.licenseExpiryDate, licenseExpiryDate) || other.licenseExpiryDate == licenseExpiryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,otp,mobileNbr,customerName,password,locationId,licenseNbr,address,licenseExpiryDate);

@override
String toString() {
  return 'GetRegistrationResponseModel(customerId: $customerId, otp: $otp, mobileNbr: $mobileNbr, customerName: $customerName, password: $password, locationId: $locationId, licenseNbr: $licenseNbr, address: $address, licenseExpiryDate: $licenseExpiryDate)';
}


}

/// @nodoc
abstract mixin class _$GetRegistrationResponseModelCopyWith<$Res> implements $GetRegistrationResponseModelCopyWith<$Res> {
  factory _$GetRegistrationResponseModelCopyWith(_GetRegistrationResponseModel value, $Res Function(_GetRegistrationResponseModel) _then) = __$GetRegistrationResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'CustomerId') int customerId,@JsonKey(name: 'OTP') String otp,@JsonKey(name: 'MobileNbr') String mobileNbr,@JsonKey(name: 'CustomerName') String customerName,@JsonKey(name: 'Password') String password,@JsonKey(name: 'LocationId') int locationId,@JsonKey(name: 'LicenseNbr') String licenseNbr,@JsonKey(name: 'Address') String address,@JsonKey(name: 'LicenseExpiryDate') DateTime licenseExpiryDate
});




}
/// @nodoc
class __$GetRegistrationResponseModelCopyWithImpl<$Res>
    implements _$GetRegistrationResponseModelCopyWith<$Res> {
  __$GetRegistrationResponseModelCopyWithImpl(this._self, this._then);

  final _GetRegistrationResponseModel _self;
  final $Res Function(_GetRegistrationResponseModel) _then;

/// Create a copy of GetRegistrationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerId = null,Object? otp = null,Object? mobileNbr = null,Object? customerName = null,Object? password = null,Object? locationId = null,Object? licenseNbr = null,Object? address = null,Object? licenseExpiryDate = null,}) {
  return _then(_GetRegistrationResponseModel(
customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,mobileNbr: null == mobileNbr ? _self.mobileNbr : mobileNbr // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,licenseNbr: null == licenseNbr ? _self.licenseNbr : licenseNbr // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,licenseExpiryDate: null == licenseExpiryDate ? _self.licenseExpiryDate : licenseExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
