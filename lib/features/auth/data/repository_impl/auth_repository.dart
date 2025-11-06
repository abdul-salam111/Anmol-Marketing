import 'package:anmol_marketing/core/core.dart';
import 'package:anmol_marketing/core/data/data.dart';
import 'package:anmol_marketing/features/auth/data/models/get_app_token_model/get_app_token_model.dart';
import 'package:anmol_marketing/features/auth/data/models/change_password_request_model/change_password_request_model.dart';
import 'package:anmol_marketing/features/auth/data/models/mobile_login_model/mobile_login_model.dart';
import 'package:anmol_marketing/core/local_cache/storage.dart';

class AuthRepository {
  static final dioHeloper = DioHelper();
  static Future getAppTokenMethod() async {
    try {
      final response = await dioHeloper.postApi(
        url: ApiKeys.getAppToken,
        requestBody: MobileLoginModel(),
      );
      final appToken = GetAppToken.fromJson(response).organizations!
          .map(
            (organization) => organization.branches!.isNotEmpty
                ? organization.branches!.first.authToken?.accessToken
                : "",
          )
          .first;

      await storage.setValues(StorageKeys.appToken, appToken!);
    } catch (error) {
      rethrow;
    }
  }

  static Future<GetLoginResponse> loginUser(
    LoginUserModel loginUserModel,
  ) async {
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
      rethrow;
    }
  }

  static Future<GetRegistrationResponseModel> signupUser(
    RegisterUserModel registerUserModel,
  ) async {
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
      rethrow;
    }
  }

  static Future<bool> verifyOtp(VerifyOtpModel verifyOtp) async {
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
      rethrow;
    }
  }

  static Future<dynamic> sendOtp({required String mobile}) async {
    try {
      final response = await dioHeloper.postApi(
        url: ApiKeys.sendOtpUrl,
        isAuthRequired: true,
        authToken: await storage.testingToken == 'true'
            ? AppConstants.testingToken
            : await storage.readValues(StorageKeys.appToken),
        requestBody: {"loginId": mobile},
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }

  static Future<bool> changePassword({
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
      rethrow;
    }
  }
}
