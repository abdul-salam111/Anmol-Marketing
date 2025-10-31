import 'package:anmol_marketing/features/auth/domain/usecases/get_app_token_usecase.dart';
import 'package:anmol_marketing/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:anmol_marketing/features/auth/domain/usecases/signin_user_usecase.dart';
import 'package:flutter/material.dart';
import '../../../../core/barrel.dart';


class SignInController extends GetxController {
  final SigninUserUsecase signinUserUsecase;
  final GetAppTokenUsecase getAppTokenUsecase;
  final SendOtpUsecase sendOtpUsecase;

  SignInController({
    required this.signinUserUsecase,
    required this.getAppTokenUsecase,
    required this.sendOtpUsecase,
  });

  /* -------------------------------------------------------------------------- */
  /*                              Form Controllers                              */
  /* -------------------------------------------------------------------------- */

  /// Controls the phone-number input field.
  final TextEditingController phoneNumberController = TextEditingController();

  /// Controls the password input field.
  final TextEditingController passwordController = TextEditingController();

  /// Global key to validate the login form.
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /* -------------------------------------------------------------------------- */
  /*                               Reactive Flags                               */
  /* -------------------------------------------------------------------------- */

  /// `true` while an authentication request is in flight.
  final RxBool isLoading = false.obs;

  /// Controls visibility of the “You are in testing mode” banner.
  final RxBool showTestingModeText = false.obs;

  /* -------------------------------------------------------------------------- */
  /*                           Testing-Mode Variables                           */
  /* -------------------------------------------------------------------------- */

  /// Message shown when the app is in testing mode.
  String testingModeText = 'You are in testing mode';

  /// Number of taps within the current 3-second window.
  int _tapCount = 0;

  /// Timestamp of the first tap in the current window.
  DateTime? _firstTapTime;

  /* -------------------------------------------------------------------------- */
  /*                              Lifecycle Hooks                               */
  /* -------------------------------------------------------------------------- */

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

  /* -------------------------------------------------------------------------- */
  /*                              Private Helpers                               */
  /* -------------------------------------------------------------------------- */

  /// Reads the stored testing-token and updates [showTestingModeText].
  Future<void> _checkTestingModeStatus() async {
    showTestingModeText.value = await storage.testingToken == 'true';
  }

  /// Saves credentials for potential auto-login in the future.
  Future<void> _saveUserCredentials() async {
    await Future.wait([
      storage.setValues(
        StorageKeys.phoneNumber,
        phoneNumberController.text.trim(),
      ),
      storage.setValues(StorageKeys.password, passwordController.text.trim()),
    ]);
  }

  /// Clears the form fields after a successful login.
  void _resetForm() {
    phoneNumberController.clear();
    passwordController.clear();
  }

  /* -------------------------------------------------------------------------- */
  /*                           Authentication Flow                              */
  /* -------------------------------------------------------------------------- */

  Future signInUser() async {
    isLoading.value = true;
    final loginUserModel = LoginUserModel(
      loginId: phoneNumberController.text.trim(),
      password: passwordController.text.trim(),
    );

    final response = await signinUserUsecase.call(loginUserModel);
    response.fold(
      (error) async {
        print(error.toString());
      },
      (successResponse) async {
        await Future.wait([
          SessionController().saveUserInStorage(successResponse),
          SessionController().getUserfromSharedpref(),
        ]);
        await _saveUserCredentials();
        await Get.offAllNamed(AppRoutes.navbar);
        _resetForm();
      },
    );
  }

  /// Handles form submission.
  /* -------------------------------------------------------------------------- */
  /*                      Testing-Mode Gesture Handling                         */
  /* -------------------------------------------------------------------------- */

  /// Handler for the 7-tap secret gesture.
  ///
  /// Resets the counter if 3 seconds elapse between any two taps.
  /// Once 7 taps are detected within 3 seconds, toggles testing mode.
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

  /// Toggles the stored testing-token and shows an informative snack-bar.
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
