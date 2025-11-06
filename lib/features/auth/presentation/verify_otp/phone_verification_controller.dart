import 'package:anmol_marketing/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:flutter/material.dart';
import '../../../../core/barrel.dart';

class PhoneVerificationController extends GetxController {
  final VerifyOtpUsecase verifyOtpUsecase;
  PhoneVerificationController({required this.verifyOtpUsecase});
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  OtpTimerButtonController controller = OtpTimerButtonController();

  late String customerId;    
  late String fromPage;

  RxBool isLoading = false.obs;

  Future verifyOpt() async {
    try {
      isLoading.value = true;
      final otpVerificationResponse = await verifyOtpUsecase.call(
        VerifyOtpModel(customerId: customerId, otp: pinController.text.trim()),
      );
      final bool isverified = otpVerificationResponse.fold(
        (l) => false,
        (r) => r,
      );
      isLoading.value = false;
      if (isverified && fromPage == "signup") {
        Get.defaultDialog(
          title: "",
          content: Padding(
            padding: padding14,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 40,
                  child: Icon(Icons.check, size: 40, color: Colors.white),
                ),

                SizedBox(height: 20),
                Text(
                  "Account Verified!",
                  style: Get.context!.headlineSmallStyle,
                ),
                SizedBox(height: 10),
                Text(
                  "Your accout has been verified, please login to continue.",
                  style: Get.context!.bodySmallStyle!.copyWith(
                    color: AppColors.greyColor,
                  ),
                  textAlign: textAlignCenter,
                ),
                SizedBox(height: 20),

                SizedBox(
                  width: 100,
                  child: CustomButton(
                    backgroundColor: AppColors.appPrimaryColor,
                    radius: 10,
                    text: "Login",
                    onPressed: () {
                      Get.back();
                      Get.offAllNamed(AppRoutes.login);
                    },
                  ),
                ),
              ],
            ),
          ),
          barrierDismissible: false,
        );

        // Automatically navigate after 7 seconds
        Future.delayed(const Duration(seconds: 7), () {
          if (Get.isDialogOpen ?? false) {
            Get.back(); // Close dialog
            Get.offAllNamed(AppRoutes.login);
          }
        });
      } else {
        AppToasts.showSuccessToast(Get.context!, "Verified successfully");
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAndToNamed(AppRoutes.changePassword, arguments: customerId);
        });
      }
    } catch (error) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        error.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  requestOtp() {
    controller.loading();
    Future.delayed(Duration(seconds: 2), () {
      controller.startTimer();
    });
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      customerId = Get.arguments["customerId"].toString();
      fromPage = Get.arguments["from"].toString();
    }
  }

  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
