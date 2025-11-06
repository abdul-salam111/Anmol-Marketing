// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MobileLoginModel _$MobileLoginModelFromJson(Map<String, dynamic> json) =>
    _MobileLoginModel(
      email: json['email'] as String? ?? "anmolmobileapp@gmail.com",
      password: json['password'] as String? ?? "SIsdXbkiLo",
      tokenExpiry: (json['tokenExpiry'] as num?)?.toInt() ?? 1000,
    );

Map<String, dynamic> _$MobileLoginModelToJson(_MobileLoginModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'tokenExpiry': instance.tokenExpiry,
    };
