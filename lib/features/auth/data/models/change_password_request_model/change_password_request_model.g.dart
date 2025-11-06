// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChangePasswordRequestModel _$ChangePasswordRequestModelFromJson(
  Map<String, dynamic> json,
) => _ChangePasswordRequestModel(
  password: json['Password'] as String,
  confirmPassword: json['ConfirmPassword'] as String,
  customerId: (json['CustomerId'] as num).toInt(),
);

Map<String, dynamic> _$ChangePasswordRequestModelToJson(
  _ChangePasswordRequestModel instance,
) => <String, dynamic>{
  'Password': instance.password,
  'ConfirmPassword': instance.confirmPassword,
  'CustomerId': instance.customerId,
};
