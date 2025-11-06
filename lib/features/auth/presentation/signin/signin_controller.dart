import 'package:anmol_marketing/features/auth/domain/usecases/get_app_token_usecase.dart';
import 'package:anmol_marketing/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:anmol_marketing/features/auth/domain/usecases/signin_user_usecase.dart';
import 'package:flutter/material.dart';
import '../../../../core/barrel.dart';
import '../../data/models/mobile_login_model/mobile_login_model.dart';

class SignInController extends GetxController {
  // ================================
  // DEPENDENCIES
  // ================================
  final SigninUserUsecase signinUserUsecase;
  final GetAppTokenUsecase getAppTokenUsecase;
  final SendOtpUsecase sendOtpUsecase;

  SignInController({
    required this.signinUserUsecase,
    required this.getAppTokenUsecase,
    required this.sendOtpUsecase,
  });

  // ================================
  // FORM CONTROLLERS & STATE
  // ================================
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;
  final RxBool showTestingModeText = false.obs;

  // ================================
  // TESTING MODE VARIABLES
  // ================================
  final String testingModeText = 'You are in testing mode';
  int _tapCount = 0;
  DateTime? _firstTapTime;

  // ================================
  // COMPUTED PROPERTIES
  // ================================
  String get _phoneNumber => phoneNumberController.text.trim();
  String get _password => passwordController.text.trim();

  // ================================
  // LIFECYCLE METHODS
  // ================================
  @override
  Future<void> onInit() async {
    super.onInit();
    await _checkTestingModeStatus();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ================================
  // MAIN AUTHENTICATION FLOW
  // ================================
  Future<void> signInUser() async {
    if (!_validateForm()) return;

    isLoading.value = true;

    final loginUserModel = LoginUserModel(
      loginId: _phoneNumber,
      password: _password,
    );
    final loginRemoteResponse = await signinUserUsecase.call(loginUserModel);
    loginRemoteResponse.fold(
      (error) => _handleLoginError(error),
      (successResponse) => _handleLoginSuccess(successResponse),
    );
  }

  bool _validateForm() {
    if (!loginFormKey.currentState!.validate()) {
      AppToasts.showErrorToast(Get.context!, 'Please fill all required fields');
      return false;
    }
    return true;
  }

  // ================================
  // LOGIN SUCCESS HANDLING
  // ================================
  Future<void> _handleLoginSuccess(GetLoginResponse successResponse) async {
    await Future.wait([
      SessionController().saveUserInStorage(successResponse),
      SessionController().getUserfromSharedpref(),
      _saveUserCredentials(),
    ]);

    isLoading.value = false;
    _resetForm();
    await Get.offAllNamed(AppRoutes.navbar);
  }

  // ================================
  // LOGIN ERROR HANDLING
  // ================================
  Future<void> _handleLoginError(AppException error) async {
    isLoading.value = false;

    switch (error.runtimeType) {
      case const (InvalidAppToken):
        await _refreshAppTokenAndRetry();
        break;
      case const (AccountNotVerifiedException):
        await _handleUnverifiedAccount();
        break;
      default:
        AppToasts.showErrorToast(Get.context!, error.toString());
    }
  }

  Future<void> _refreshAppTokenAndRetry() async {
    final getAppTokenResponse = await getAppTokenUsecase.call(
      MobileLoginModel(),
    );

    getAppTokenResponse.fold(
      (error) {
        AppToasts.showErrorToast(Get.context!, error.toString());
      },
      (apptokenModel) async {
        final apptoken = apptokenModel.organizations!
            .firstWhere((org) => org.branches!.isNotEmpty)
            .branches!
            .first
            .authToken
            ?.accessToken;

        if (apptoken != null) {
          await storage.setValues(StorageKeys.appToken, apptoken);
          await signInUser();
        }
      },
    );
  }

  Future<void> _handleUnverifiedAccount() async {
    final otpResponse = await sendOtpUsecase.call(_phoneNumber);

    otpResponse.fold(
      (error) {
        AppToasts.showErrorToast(Get.context!, error.toString());
      },
      (success) async {
        Future.delayed(const Duration(seconds: 1), () {
          AppToasts.showSuccessToast(
            Get.context!,
            "Please verify your account!",
          );
        });

        await Get.toNamed(
          AppRoutes.phoneVerification,
          arguments: {
            "customerId": success["CustomerId"].toString(),
            "from": "signup",
          },
        );
      },
    );
  }

  // ================================
  // CREDENTIALS MANAGEMENT
  // ================================
  Future<void> _saveUserCredentials() async {
    await Future.wait([
      storage.setValues(StorageKeys.phoneNumber, _phoneNumber),
      storage.setValues(StorageKeys.password, _password),
    ]);
  }

  void _resetForm() {
    phoneNumberController.clear();
    passwordController.clear();
  }

  // ================================
  // TESTING MODE MANAGEMENT
  // ================================
  Future<void> _checkTestingModeStatus() async {
    showTestingModeText.value = await storage.testingToken == 'true';
  }

  Future<void> handleTap() async {
    const int requiredTaps = 7;
    const Duration resetWindow = Duration(seconds: 3);

    final now = DateTime.now();

    if (_firstTapTime == null || now.difference(_firstTapTime!) > resetWindow) {
      _tapCount = 0;
      _firstTapTime = now;
    }

    _tapCount++;

    if (_tapCount == requiredTaps) {
      await _toggleTestingMode(await storage.testingToken == 'true');
      _tapCount = 0;
      _firstTapTime = null;
    }
  }

  Future<void> _toggleTestingMode(bool isCurrentlyTesting) async {
    final newModeValue = isCurrentlyTesting ? 'false' : 'true';
    final modeName = isCurrentlyTesting ? 'Real Time' : 'Testing';

    Get.snackbar(
      '$modeName Mode Enabled',
      'You have enabled $modeName mode!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    await storage.setValues(StorageKeys.testingToken, newModeValue);
    showTestingModeText.value = newModeValue == 'true';
  }
}
