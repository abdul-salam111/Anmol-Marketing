import 'package:anmol_marketing/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:flutter/material.dart';

import '../../../../core/barrel.dart';

class ForgetPasswordController extends GetxController {
  final SendOtpUsecase sendOtpUsecase;
  ForgetPasswordController({required this.sendOtpUsecase});

  final phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  Future<void> sendOtp() async {
    isLoading.value = true;
    final sentOtpResponse = await sendOtpUsecase.call(
      phoneNumberController.text.trim(),
    );
    sentOtpResponse.fold(
      (error) {
        AppToasts.showErrorToast(Get.context!, error.toString());
        isLoading.value = false;
      },
      (success) {
        AppToasts.showSuccessToast(Get.context!, "OTP sent successfully");
        Future.delayed(const Duration(seconds: 1), () {
          Get.toNamed(
            AppRoutes.phoneVerification,
            arguments: {
              "customerId": success["CustomerId"].toString(),
              "from": "forgetPassword",
            },
          );
        });
        isLoading.value = false;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }
}
