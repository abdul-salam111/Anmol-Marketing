// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterUserModel {

@JsonKey(name: 'CustomerName') String get customerName;@JsonKey(name: 'MobileNbr') String get mobileNbr;@JsonKey(name: 'Password') String get password;@JsonKey(name: 'LocationId') int get locationId;@JsonKey(name: 'LicenseNbr') String get licenseNbr;@JsonKey(name: 'OwerName') String? get owerName;@JsonKey(name: 'Address') String? get address;@JsonKey(name: 'LicenseExpiryDate') String? get licenseExpiryDate;
/// Create a copy of RegisterUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterUserModelCopyWith<RegisterUserModel> get copyWith => _$RegisterUserModelCopyWithImpl<RegisterUserModel>(this as RegisterUserModel, _$identity);

  /// Serializes this RegisterUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterUserModel&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.mobileNbr, mobileNbr) || other.mobileNbr == mobileNbr)&&(identical(other.password, password) || other.password == password)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.licenseNbr, licenseNbr) || other.licenseNbr == licenseNbr)&&(identical(other.owerName, owerName) || other.owerName == owerName)&&(identical(other.address, address) || other.address == address)&&(identical(other.licenseExpiryDate, licenseExpiryDate) || other.licenseExpiryDate == licenseExpiryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerName,mobileNbr,password,locationId,licenseNbr,owerName,address,licenseExpiryDate);

@override
String toString() {
  return 'RegisterUserModel(customerName: $customerName, mobileNbr: $mobileNbr, password: $password, locationId: $locationId, licenseNbr: $licenseNbr, owerName: $owerName, address: $address, licenseExpiryDate: $licenseExpiryDate)';
}


}

/// @nodoc
abstract mixin class $RegisterUserModelCopyWith<$Res>  {
  factory $RegisterUserModelCopyWith(RegisterUserModel value, $Res Function(RegisterUserModel) _then) = _$RegisterUserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'CustomerName') String customerName,@JsonKey(name: 'MobileNbr') String mobileNbr,@JsonKey(name: 'Password') String password,@JsonKey(name: 'LocationId') int locationId,@JsonKey(name: 'LicenseNbr') String licenseNbr,@JsonKey(name: 'OwerName') String? owerName,@JsonKey(name: 'Address') String? address,@JsonKey(name: 'LicenseExpiryDate') String? licenseExpiryDate
});




}
/// @nodoc
class _$RegisterUserModelCopyWithImpl<$Res>
    implements $RegisterUserModelCopyWith<$Res> {
  _$RegisterUserModelCopyWithImpl(this._self, this._then);

  final RegisterUserModel _self;
  final $Res Function(RegisterUserModel) _then;

/// Create a copy of RegisterUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerName = null,Object? mobileNbr = null,Object? password = null,Object? locationId = null,Object? licenseNbr = null,Object? owerName = freezed,Object? address = freezed,Object? licenseExpiryDate = freezed,}) {
  return _then(_self.copyWith(
customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,mobileNbr: null == mobileNbr ? _self.mobileNbr : mobileNbr // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,licenseNbr: null == licenseNbr ? _self.licenseNbr : licenseNbr // ignore: cast_nullable_to_non_nullable
as String,owerName: freezed == owerName ? _self.owerName : owerName // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,licenseExpiryDate: freezed == licenseExpiryDate ? _self.licenseExpiryDate : licenseExpiryDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterUserModel].
extension RegisterUserModelPatterns on RegisterUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterUserModel value)  $default,){
final _that = this;
switch (_that) {
case _RegisterUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'CustomerName')  String customerName, @JsonKey(name: 'MobileNbr')  String mobileNbr, @JsonKey(name: 'Password')  String password, @JsonKey(name: 'LocationId')  int locationId, @JsonKey(name: 'LicenseNbr')  String licenseNbr, @JsonKey(name: 'OwerName')  String? owerName, @JsonKey(name: 'Address')  String? address, @JsonKey(name: 'LicenseExpiryDate')  String? licenseExpiryDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterUserModel() when $default != null:
return $default(_that.customerName,_that.mobileNbr,_that.password,_that.locationId,_that.licenseNbr,_that.owerName,_that.address,_that.licenseExpiryDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'CustomerName')  String customerName, @JsonKey(name: 'MobileNbr')  String mobileNbr, @JsonKey(name: 'Password')  String password, @JsonKey(name: 'LocationId')  int locationId, @JsonKey(name: 'LicenseNbr')  String licenseNbr, @JsonKey(name: 'OwerName')  String? owerName, @JsonKey(name: 'Address')  String? address, @JsonKey(name: 'LicenseExpiryDate')  String? licenseExpiryDate)  $default,) {final _that = this;
switch (_that) {
case _RegisterUserModel():
return $default(_that.customerName,_that.mobileNbr,_that.password,_that.locationId,_that.licenseNbr,_that.owerName,_that.address,_that.licenseExpiryDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'CustomerName')  String customerName, @JsonKey(name: 'MobileNbr')  String mobileNbr, @JsonKey(name: 'Password')  String password, @JsonKey(name: 'LocationId')  int locationId, @JsonKey(name: 'LicenseNbr')  String licenseNbr, @JsonKey(name: 'OwerName')  String? owerName, @JsonKey(name: 'Address')  String? address, @JsonKey(name: 'LicenseExpiryDate')  String? licenseExpiryDate)?  $default,) {final _that = this;
switch (_that) {
case _RegisterUserModel() when $default != null:
return $default(_that.customerName,_that.mobileNbr,_that.password,_that.locationId,_that.licenseNbr,_that.owerName,_that.address,_that.licenseExpiryDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterUserModel implements RegisterUserModel {
  const _RegisterUserModel({@JsonKey(name: 'CustomerName') required this.customerName, @JsonKey(name: 'MobileNbr') required this.mobileNbr, @JsonKey(name: 'Password') required this.password, @JsonKey(name: 'LocationId') required this.locationId, @JsonKey(name: 'LicenseNbr') required this.licenseNbr, @JsonKey(name: 'OwerName') this.owerName, @JsonKey(name: 'Address') this.address, @JsonKey(name: 'LicenseExpiryDate') this.licenseExpiryDate});
  factory _RegisterUserModel.fromJson(Map<String, dynamic> json) => _$RegisterUserModelFromJson(json);

@override@JsonKey(name: 'CustomerName') final  String customerName;
@override@JsonKey(name: 'MobileNbr') final  String mobileNbr;
@override@JsonKey(name: 'Password') final  String password;
@override@JsonKey(name: 'LocationId') final  int locationId;
@override@JsonKey(name: 'LicenseNbr') final  String licenseNbr;
@override@JsonKey(name: 'OwerName') final  String? owerName;
@override@JsonKey(name: 'Address') final  String? address;
@override@JsonKey(name: 'LicenseExpiryDate') final  String? licenseExpiryDate;

/// Create a copy of RegisterUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterUserModelCopyWith<_RegisterUserModel> get copyWith => __$RegisterUserModelCopyWithImpl<_RegisterUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterUserModel&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.mobileNbr, mobileNbr) || other.mobileNbr == mobileNbr)&&(identical(other.password, password) || other.password == password)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.licenseNbr, licenseNbr) || other.licenseNbr == licenseNbr)&&(identical(other.owerName, owerName) || other.owerName == owerName)&&(identical(other.address, address) || other.address == address)&&(identical(other.licenseExpiryDate, licenseExpiryDate) || other.licenseExpiryDate == licenseExpiryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerName,mobileNbr,password,locationId,licenseNbr,owerName,address,licenseExpiryDate);

@override
String toString() {
  return 'RegisterUserModel(customerName: $customerName, mobileNbr: $mobileNbr, password: $password, locationId: $locationId, licenseNbr: $licenseNbr, owerName: $owerName, address: $address, licenseExpiryDate: $licenseExpiryDate)';
}


}

/// @nodoc
abstract mixin class _$RegisterUserModelCopyWith<$Res> implements $RegisterUserModelCopyWith<$Res> {
  factory _$RegisterUserModelCopyWith(_RegisterUserModel value, $Res Function(_RegisterUserModel) _then) = __$RegisterUserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'CustomerName') String customerName,@JsonKey(name: 'MobileNbr') String mobileNbr,@JsonKey(name: 'Password') String password,@JsonKey(name: 'LocationId') int locationId,@JsonKey(name: 'LicenseNbr') String licenseNbr,@JsonKey(name: 'OwerName') String? owerName,@JsonKey(name: 'Address') String? address,@JsonKey(name: 'LicenseExpiryDate') String? licenseExpiryDate
});




}
/// @nodoc
class __$RegisterUserModelCopyWithImpl<$Res>
    implements _$RegisterUserModelCopyWith<$Res> {
  __$RegisterUserModelCopyWithImpl(this._self, this._then);

  final _RegisterUserModel _self;
  final $Res Function(_RegisterUserModel) _then;

/// Create a copy of RegisterUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerName = null,Object? mobileNbr = null,Object? password = null,Object? locationId = null,Object? licenseNbr = null,Object? owerName = freezed,Object? address = freezed,Object? licenseExpiryDate = freezed,}) {
  return _then(_RegisterUserModel(
customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,mobileNbr: null == mobileNbr ? _self.mobileNbr : mobileNbr // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,licenseNbr: null == licenseNbr ? _self.licenseNbr : licenseNbr // ignore: cast_nullable_to_non_nullable
as String,owerName: freezed == owerName ? _self.owerName : owerName // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,licenseExpiryDate: freezed == licenseExpiryDate ? _self.licenseExpiryDate : licenseExpiryDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
