import 'package:flutter/material.dart';

import '../../../../core/barrel.dart';

class ForgetPasswordController extends GetxController {
  final phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  Future<void> sendOtp() async {
    try {
      isLoading.value = true;
      final response = await AuthRepository.sendOtp(
        mobile: phoneNumberController.text.trim(),
      );

      AppToasts.showSuccessToast(Get.context!, "OTP sent successfully");
      Future.delayed(const Duration(seconds: 1), () {
        Get.toNamed(
          AppRoutes.phoneVerification,
          arguments: {
            "customerId": response["CustomerId"].toString(),
            "from": "forgetPassword",
          },
        );
      });

      isLoading.value = false;
    } on InvalidAppToken {
      isLoading.value = true;
      final response = await AuthRepository.sendOtp(
        mobile: phoneNumberController.text.trim(),
      );

      AppToasts.showSuccessToast(Get.context!, "OTP sent successfully");
      await Get.toNamed(
        AppRoutes.phoneVerification,
        arguments: response["CustomerId"].toString(),
      );

      isLoading.value = false;
    } catch (error) {
      AppToasts.showErrorToast(Get.context!, error.toString());
      isLoading.value = false;
      rethrow;
    }
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }
}
