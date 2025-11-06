import 'package:fpdart/fpdart.dart';

import '../../../../core/data/exceptions/app_exceptions.dart';
import '../../domain/abstract_repository/auth_repository.dart';
import '../models/change_password_request_model/change_password_request_model.dart';
import '../models/get_app_token_model/get_app_token_model.dart';
import '../models/get_login_response/get_login_response_model.dart';
import '../models/get_registration_response/get_registration_response_model.dart';
import '../models/login_model/login_user_model.dart';
import '../models/mobile_login_model/mobile_login_model.dart';
import '../models/register_user_model/register_user_model.dart';
import '../models/verify_otp/verify_otp_model.dart';
import '../remote_datasource/auth_remote_datasource/auth_remote_datasource.dart';

// ================================
// REPOSITORY IMPLEMENTATION
// ================================
class AuthRepositoryImpl implements AbstractAuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  // ================================
  // PRIVATE HELPER METHODS
  // ================================

  /// Generic method to handle repository operations with error handling
  Future<Either<AppException, T>> _handleRepositoryCall<T>(
    Future<T> Function() apiCall,
  ) async {
    try {
      final response = await apiCall();
      return Right(response);
    } catch (error) {
      return Left(error as AppException);
    }
  }

  // ================================
  // TOKEN MANAGEMENT METHODS
  // ================================

  @override
  Future<Either<AppException, GetAppToken>> getAppTokenMethod({
    required MobileLoginModel mobileLoginModel,
  }) async {
    return _handleRepositoryCall(
      () => authRemoteDataSource.refereshAppToken(
        mobileLoginModel: mobileLoginModel,
      ),
    );
  }

  // ================================
  // AUTHENTICATION METHODS
  // ================================

  @override
  Future<Either<AppException, GetLoginResponse>> loginUser({
    required LoginUserModel loginUserModel,
  }) async {
    return _handleRepositoryCall(
      () => authRemoteDataSource.loginUser(loginUserModel: loginUserModel),
    );
  }

  // ================================
  // REGISTRATION METHODS
  // ================================

  @override
  Future<Either<AppException, GetRegistrationResponseModel>> signupUser({
    required RegisterUserModel registerUserModel,
  }) async {
    return _handleRepositoryCall(
      () =>
          authRemoteDataSource.signupUser(registerUserModel: registerUserModel),
    );
  }

  // ================================
  // OTP VERIFICATION METHODS
  // ================================

  @override
  Future<Either<AppException, bool>> verifyOtp({
    required VerifyOtpModel verifyOtp,
  }) async {
    return _handleRepositoryCall(
      () => authRemoteDataSource.verifyOtp(verifyOtp: verifyOtp),
    );
  }

  @override
  Future<Either<AppException, dynamic>> sendOtp({
    required String mobile,
  }) async {
    return _handleRepositoryCall(
      () => authRemoteDataSource.sendOtp(mobile: mobile),
    );
  }

  // ================================
  // PASSWORD MANAGEMENT METHODS
  // ================================

  @override
  Future<Either<AppException, bool>> changePassword({
    required ChangePasswordRequestModel changePassword,
  }) async {
    return _handleRepositoryCall(
      () => authRemoteDataSource.changePassword(changePassword: changePassword),
    );
  }
}
