import 'package:anmol_marketing/core/barrel.dart';
import 'package:anmol_marketing/features/auth/data/models/get_app_token_model/get_app_token_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/change_password_request_model/change_password_request_model.dart';
import '../../data/models/mobile_login_model/mobile_login_model.dart';

// ================================
// AUTH REPOSITORY ABSTRACT INTERFACE
// ================================
abstract interface class AbstractAuthRepository {
  // ================================
  // TOKEN MANAGEMENT METHODS
  // ================================

  Future<Either<AppException, GetAppToken>> getAppTokenMethod({
    required MobileLoginModel mobileLoginModel,
  });

  // ================================
  // AUTHENTICATION METHODS
  // ================================

  Future<Either<AppException, GetLoginResponse>> loginUser({
    required LoginUserModel loginUserModel,
  });

  // ================================
  // REGISTRATION METHODS
  // ================================

  Future<Either<AppException, GetRegistrationResponseModel>> signupUser({
    required RegisterUserModel registerUserModel,
  });

  // ================================
  // OTP VERIFICATION METHODS
  // ================================

  Future<Either<AppException, bool>> verifyOtp({
    required VerifyOtpModel verifyOtp,
  });

  Future<Either<AppException, dynamic>> sendOtp({required String mobile});

  // ================================
  // PASSWORD MANAGEMENT METHODS
  // ================================

  Future<Either<AppException, bool>> changePassword({
    required ChangePasswordRequestModel changePassword,
  });
}
