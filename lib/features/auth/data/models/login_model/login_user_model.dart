import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_user_model.freezed.dart';
part 'login_user_model.g.dart';

@freezed
abstract class LoginUserModel with _$LoginUserModel {
  const factory LoginUserModel({
    required String loginId,
    required String password,
  }) = _LoginUserModel;

  factory LoginUserModel.fromJson(Map<String, dynamic> json) =>
      _$LoginUserModelFromJson(json);
}
