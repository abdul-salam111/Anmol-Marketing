import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_login_response_model.freezed.dart';
part 'get_login_response_model.g.dart';

@freezed
 abstract class GetLoginResponse with _$GetLoginResponse {
  const factory GetLoginResponse({
    @JsonKey(name: 'Customer') Customer? customer,
    @JsonKey(name: 'AuthToken') AuthToken? authToken,
  }) = _GetLoginResponse;

  factory GetLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLoginResponseFromJson(json);
}

@freezed
abstract class AuthToken with _$AuthToken {
  const factory AuthToken({
    @JsonKey(name: 'AccessToken') String? accessToken,
    @JsonKey(name: 'Expiration') DateTime? expiration,
    @JsonKey(name: 'RefreshToken') String? refreshToken,
  }) = _AuthToken;

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);
}

@freezed
 abstract class Customer with _$Customer {
  const factory Customer({
    @JsonKey(name: 'CustomerId') int? customerId,
    @JsonKey(name: 'CustomerName') String? customerName,
    @JsonKey(name: 'LocationId') int? locationId,
    @JsonKey(name: 'LocationName') String? locationName,
    @JsonKey(name: 'Balance') double? balance,
    @JsonKey(name: 'Logo') String? logo,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
