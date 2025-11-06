// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterUserModel _$RegisterUserModelFromJson(Map<String, dynamic> json) =>
    _RegisterUserModel(
      customerName: json['CustomerName'] as String,
      mobileNbr: json['MobileNbr'] as String,
      password: json['Password'] as String,
      locationId: (json['LocationId'] as num).toInt(),
      licenseNbr: json['LicenseNbr'] as String,
      owerName: json['OwerName'] as String?,
      address: json['Address'] as String?,
      licenseExpiryDate: json['LicenseExpiryDate'] as String?,
    );

Map<String, dynamic> _$RegisterUserModelToJson(_RegisterUserModel instance) =>
    <String, dynamic>{
      'CustomerName': instance.customerName,
      'MobileNbr': instance.mobileNbr,
      'Password': instance.password,
      'LocationId': instance.locationId,
      'LicenseNbr': instance.licenseNbr,
      'OwerName': instance.owerName,
      'Address': instance.address,
      'LicenseExpiryDate': instance.licenseExpiryDate,
    };
