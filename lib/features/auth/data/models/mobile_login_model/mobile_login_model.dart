import 'package:freezed_annotation/freezed_annotation.dart';

part 'mobile_login_model.freezed.dart';
part 'mobile_login_model.g.dart';

@freezed
abstract class MobileLoginModel with _$MobileLoginModel {
  const factory MobileLoginModel({
    @Default("anmolmobileapp@gmail.com") String? email,
    @Default("SIsdXbkiLo") String? password,
    @Default(1000) int? tokenExpiry,
  }) = _MobileLoginModel;

  factory MobileLoginModel.fromJson(Map<String, dynamic> json) =>
      _$MobileLoginModelFromJson(json);
}
