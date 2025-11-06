import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_model.freezed.dart';
part 'verify_otp_model.g.dart';

@freezed
abstract class VerifyOtpModel with _$VerifyOtpModel {
  const factory VerifyOtpModel({
    @JsonKey(name: 'CustomerId') required String customerId,
    @JsonKey(name: 'Otp') required String otp,
  }) = _VerifyOtpModel;

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpModelFromJson(json);
}
