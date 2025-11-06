import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_registration_response_model.freezed.dart';
part 'get_registration_response_model.g.dart';

@freezed
abstract class GetRegistrationResponseModel with _$GetRegistrationResponseModel {
  const factory GetRegistrationResponseModel({
    @JsonKey(name: 'CustomerId') required int customerId,
    @JsonKey(name: 'OTP') required String otp,
    @JsonKey(name: 'MobileNbr') required String mobileNbr,
    @JsonKey(name: 'CustomerName') required String customerName,
    @JsonKey(name: 'Password') required String password,
    @JsonKey(name: 'LocationId') required int locationId,
    @JsonKey(name: 'LicenseNbr') required String licenseNbr,
    @JsonKey(name: 'Address') required String address,
    @JsonKey(name: 'LicenseExpiryDate') required DateTime licenseExpiryDate,
  }) = _GetRegistrationResponseModel;

  factory GetRegistrationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetRegistrationResponseModelFromJson(json);
}
