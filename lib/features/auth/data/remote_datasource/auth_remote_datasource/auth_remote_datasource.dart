import '../../../../../core/constants/api_keys.dart';
import '../../../../../core/constants/app_conts.dart';
import '../../../../../core/data/network_manager/dio_helper.dart';
import '../../../../../core/local_cache/storage.dart';
import '../../models/change_password_request_model/change_password_request_model.dart';
import '../../models/get_app_token_model/get_app_token_model.dart';
import '../../models/get_login_response/get_login_response_model.dart';
import '../../models/get_registration_response/get_registration_response_model.dart';
import '../../models/login_model/login_user_model.dart';
import '../../models/mobile_login_model/mobile_login_model.dart';
import '../../models/register_user_model/register_user_model.dart';
import '../../models/verify_otp/verify_otp_model.dart';

// ================================
// ABSTRACT DATA SOURCE INTERFACE
// ================================
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

// ================================
// CONCRETE IMPLEMENTATION
// ================================
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioHelper dioHeloper;

  AuthRemoteDataSourceImpl({required this.dioHeloper});

  // ================================
  // PRIVATE HELPER METHODS
  // ================================

  /// Gets the appropriate auth token based on environment
  Future<String?> _getAuthToken() async {
    final isTesting = await storage.testingToken == 'true';
    return isTesting
        ? AppConstants.testingToken
        : await storage.readValues(StorageKeys.appToken);
  }

  /// Generic method for making authenticated POST requests
  Future<dynamic> _makeAuthenticatedPost({
    required String url,
    required dynamic requestBody,
  }) async {
    final authToken = await _getAuthToken();

    return await dioHeloper.postApi(
      url: url,
      isAuthRequired: true,
      authToken: authToken,
      requestBody: requestBody,
    );
  }

  // ================================
  // AUTHENTICATION METHODS
  // ================================

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
      rethrow;
    }
  }

  @override
  Future<GetLoginResponse> loginUser({
    required LoginUserModel loginUserModel,
  }) async {
    try {
      final response = await _makeAuthenticatedPost(
        url: ApiKeys.loginUrl,
        requestBody: loginUserModel,
      );

      return GetLoginResponse.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  // ================================
  // REGISTRATION METHODS
  // ================================

  @override
  Future<GetRegistrationResponseModel> signupUser({
    required RegisterUserModel registerUserModel,
  }) async {
    try {
      final response = await _makeAuthenticatedPost(
        url: ApiKeys.registerUser,
        requestBody: registerUserModel,
      );

      return GetRegistrationResponseModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  // ================================
  // OTP METHODS
  // ================================

  @override
  Future<bool> verifyOtp({required VerifyOtpModel verifyOtp}) async {
    try {
      await _makeAuthenticatedPost(
        url: ApiKeys.verifyOtp,
        requestBody: verifyOtp,
      );

      return true;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<dynamic> sendOtp({required String mobile}) async {
    try {
      final response = await _makeAuthenticatedPost(
        url: ApiKeys.sendOtpUrl,
        requestBody: {"loginId": mobile},
      );

      return response;
    } catch (error) {
      rethrow;
    }
  }

  // ================================
  // PASSWORD MANAGEMENT
  // ================================

  @override
  Future<bool> changePassword({
    required ChangePasswordRequestModel changePassword,
  }) async {
    try {
      await _makeAuthenticatedPost(
        url: ApiKeys.changePasswordUrl,
        requestBody: changePassword,
      );

      return true;
    } catch (error) {
      rethrow;
    }
  }
}
