import 'package:fpdart/fpdart.dart';

import '../../../../core/data/exceptions/app_exceptions.dart';
import '../../domain/abstract_repository/auth_repository.dart';
import '../models/change_password_request_model.dart';
import '../models/get_app_token_model.dart';
import '../models/get_login_response.dart';
import '../models/get_registration_response.dart';
import '../models/login_model.dart';
import '../models/mobile_login_model.dart';
import '../models/register_user_model.dart';
import '../models/verify_otp.dart';
import '../remote_datasource/auth_remote_datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AbstractAuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<AppException, GetAppToken>> getAppTokenMethod({
    required MobileLoginModel mobileLoginModel,
  }) async {
    try {
      final response = await authRemoteDataSource.refereshAppToken(
        mobileLoginModel: mobileLoginModel,
      );
      return Right(response);
    } catch (error) {
      return Left(error as AppException);
    }
  }

  @override
  Future<Either<AppException, GetLoginResponse>> loginUser({
    required LoginUserModel loginUserModel,
  }) async {
    try {
      final response = await authRemoteDataSource.loginUser(
        loginUserModel: loginUserModel,
      );
      return Right(response);
    } catch (error) {
      return Left(error as AppException);
    }
  }

  @override
  Future<Either<AppException, GetRegistrationResponseModel>> signupUser({
    required RegisterUserModel registerUserModel,
  }) async {
    try {
      final response = await authRemoteDataSource.signupUser(
        registerUserModel: registerUserModel,
      );
      return Right(response);
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<AppException, bool>> verifyOtp({
    required VerifyOtpModel verifyOtp,
  }) async {
    try {
      final response = await authRemoteDataSource.verifyOtp(
        verifyOtp: verifyOtp,
      );
      return Right(response);
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<AppException, dynamic>> sendOtp({
    required String mobile,
  }) async {
    try {
      final response = await authRemoteDataSource.sendOtp(mobile: mobile);
      return Right(response);
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<AppException, bool>> changePassword({
    required ChangePasswordRequestModel changePassword,
  }) async {
    try {
      final response = await authRemoteDataSource.changePassword(
        changePassword: changePassword,
      );
      return Right(response);
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }
}
