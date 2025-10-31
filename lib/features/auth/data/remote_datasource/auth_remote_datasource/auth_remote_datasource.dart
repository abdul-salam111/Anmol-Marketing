import 'package:anmol_marketing/core/data/data.dart';
import 'package:anmol_marketing/features/auth/data/models/get_app_token_model.dart';
import '../../../../../core/constants/api_keys.dart';
import '../../../../../core/constants/app_conts.dart';
import '../../../../../core/local_cache/storage.dart';
import '../../models/change_password_request_model.dart';
import '../../models/mobile_login_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<GetAppToken> refereshAppToken({
    required MobileLoginModel mobileLoginModel,
  });
  Future<GetLoginResponse> loginUser({required LoginUserModel loginUserModel});
  Future<GetRegistrationResponseModel> signupUser({
    required RegisterUserModel registerUserModel,
  });
  Future<bool> verifyOtp({required VerifyOtpModel verifyOtp});
  Future<dynamic> sendOtp({required String mobile});
  Future<bool> changePassword({
    required ChangePasswordRequestModel changePassword,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioHelper dioHeloper;
  AuthRemoteDataSourceImpl({required this.dioHeloper});
  @override
  Future<GetAppToken> refereshAppToken({
    required MobileLoginModel mobileLoginModel,
  }) async {
    try {
      final response = await dioHeloper.postApi(
        url: ApiKeys.getAppToken,
        requestBody: mobileLoginModel,
      );
      return GetAppToken.fromJson(response);
    } catch (error) {
      throw AppException(error.toString());
    }
  }

  @override
  Future<GetLoginResponse> loginUser({
    required LoginUserModel loginUserModel,
  }) async {
    try {
      final response = await dioHeloper.postApi(
        url: ApiKeys.loginUrl,
        isAuthRequired: true,
        authToken: await storage.testingToken == 'true'
            ? AppConstants.testingToken
            : await storage.readValues(StorageKeys.appToken),
        requestBody: loginUserModel,
      );
      return GetLoginResponse.fromJson(response);
    } catch (error) {
      throw AppException(error.toString());
    }
  }

  @override
  Future<GetRegistrationResponseModel> signupUser({
    required RegisterUserModel registerUserModel,
  }) async {
    try {
      final response = await dioHeloper.postApi(
        url: ApiKeys.registerUser,
        isAuthRequired: true,
        authToken: await storage.testingToken == 'true'
            ? AppConstants.testingToken
            : await storage.readValues(StorageKeys.appToken),
        requestBody: registerUserModel,
      );
      return GetRegistrationResponseModel.fromJson(response);
    } catch (error) {
      throw AppException(error.toString());
    }
  }

  @override
  Future<bool> verifyOtp({required VerifyOtpModel verifyOtp}) async {
    try {
      await dioHeloper.postApi(
        url: ApiKeys.verifyOtp,
        isAuthRequired: true,
        authToken: await storage.testingToken == 'true'
            ? AppConstants.testingToken
            : await storage.readValues(StorageKeys.appToken),
        requestBody: verifyOtp,
      );
      return true;
    } catch (error) {
      throw AppException(error.toString());
    }
  }

  @override
  Future<dynamic> sendOtp({required String mobile}) async {
    try {
      final response = await dioHeloper.postApi(
        url: ApiKeys.sendOtpUrl,
        isAuthRequired: true,
        authToken: await storage.testingToken == 'true'
            ? AppConstants.testingToken
            : await storage.readValues(StorageKeys.appToken),
        requestBody: {"mobile": mobile},
      );
      return response;
    } catch (error) {
      throw AppException(error.toString());
    }
  }

  @override
  Future<bool> changePassword({
    required ChangePasswordRequestModel changePassword,
  }) async {
    try {
      await dioHeloper.postApi(
        url: ApiKeys.changePasswordUrl,
        isAuthRequired: true,
        authToken: await storage.testingToken == 'true'
            ? AppConstants.testingToken
            : await storage.readValues(StorageKeys.appToken),
        requestBody: changePassword,
      );
      return true;
    } catch (error) {
      throw AppException(error.toString());
    }
  }
}
