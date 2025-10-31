import 'package:anmol_marketing/core/barrel.dart';
import 'package:anmol_marketing/features/auth/data/models/get_app_token_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/change_password_request_model.dart';
import '../../data/models/mobile_login_model.dart';

abstract interface class AbstractAuthRepository {
  Future<Either<AppException, GetAppToken>> getAppTokenMethod({
    required MobileLoginModel mobileLoginModel,
  });
  Future<Either<AppException, GetLoginResponse>> loginUser(
   {required LoginUserModel loginUserModel,}
  );
  Future<Either<AppException, GetRegistrationResponseModel>> signupUser(
   {required RegisterUserModel registerUserModel,}
  );
  Future<Either<AppException, bool>> verifyOtp({required VerifyOtpModel verifyOtp});
  Future<Either<AppException, dynamic>> sendOtp({required String mobile});
  Future<Either<AppException, bool>> changePassword({
    required ChangePasswordRequestModel changePassword,
  });
}
