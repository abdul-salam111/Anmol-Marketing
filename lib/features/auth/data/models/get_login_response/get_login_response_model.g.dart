// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetLoginResponse _$GetLoginResponseFromJson(Map<String, dynamic> json) =>
    _GetLoginResponse(
      customer: json['Customer'] == null
          ? null
          : Customer.fromJson(json['Customer'] as Map<String, dynamic>),
      authToken: json['AuthToken'] == null
          ? null
          : AuthToken.fromJson(json['AuthToken'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetLoginResponseToJson(_GetLoginResponse instance) =>
    <String, dynamic>{
      'Customer': instance.customer,
      'AuthToken': instance.authToken,
    };

_AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => _AuthToken(
  accessToken: json['AccessToken'] as String?,
  expiration: json['Expiration'] == null
      ? null
      : DateTime.parse(json['Expiration'] as String),
  refreshToken: json['RefreshToken'] as String?,
);

Map<String, dynamic> _$AuthTokenToJson(_AuthToken instance) =>
    <String, dynamic>{
      'AccessToken': instance.accessToken,
      'Expiration': instance.expiration?.toIso8601String(),
      'RefreshToken': instance.refreshToken,
    };

_Customer _$CustomerFromJson(Map<String, dynamic> json) => _Customer(
  customerId: (json['CustomerId'] as num?)?.toInt(),
  customerName: json['CustomerName'] as String?,
  locationId: (json['LocationId'] as num?)?.toInt(),
  locationName: json['LocationName'] as String?,
  balance: (json['Balance'] as num?)?.toDouble(),
  logo: json['Logo'] as String?,
);

Map<String, dynamic> _$CustomerToJson(_Customer instance) => <String, dynamic>{
  'CustomerId': instance.customerId,
  'CustomerName': instance.customerName,
  'LocationId': instance.locationId,
  'LocationName': instance.locationName,
  'Balance': instance.balance,
  'Logo': instance.logo,
};
