import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_user_model.freezed.dart';
part 'register_user_model.g.dart';

@freezed
abstract class RegisterUserModel with _$RegisterUserModel {
  const factory RegisterUserModel({
    @JsonKey(name: 'CustomerName') required String customerName,
    @JsonKey(name: 'MobileNbr') required String mobileNbr,
    @JsonKey(name: 'Password') required String password,
    @JsonKey(name: 'LocationId') required int locationId,
    @JsonKey(name: 'LicenseNbr') required String licenseNbr,
    @JsonKey(name: 'OwerName') String? owerName,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'LicenseExpiryDate') String? licenseExpiryDate,
  }) = _RegisterUserModel;

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserModelFromJson(json);
}
