// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_registration_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetRegistrationResponseModel _$GetRegistrationResponseModelFromJson(
  Map<String, dynamic> json,
) => _GetRegistrationResponseModel(
  customerId: (json['CustomerId'] as num).toInt(),
  otp: json['OTP'] as String,
  mobileNbr: json['MobileNbr'] as String,
  customerName: json['CustomerName'] as String,
  password: json['Password'] as String,
  locationId: (json['LocationId'] as num).toInt(),
  licenseNbr: json['LicenseNbr'] as String,
  address: json['Address'] as String,
  licenseExpiryDate: DateTime.parse(json['LicenseExpiryDate'] as String),
);

Map<String, dynamic> _$GetRegistrationResponseModelToJson(
  _GetRegistrationResponseModel instance,
) => <String, dynamic>{
  'CustomerId': instance.customerId,
  'OTP': instance.otp,
  'MobileNbr': instance.mobileNbr,
  'CustomerName': instance.customerName,
  'Password': instance.password,
  'LocationId': instance.locationId,
  'LicenseNbr': instance.licenseNbr,
  'Address': instance.address,
  'LicenseExpiryDate': instance.licenseExpiryDate.toIso8601String(),
};
