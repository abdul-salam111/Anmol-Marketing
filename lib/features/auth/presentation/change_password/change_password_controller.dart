import 'package:anmol_marketing/core/core.dart';
import 'package:anmol_marketing/core/data/data.dart';
import 'package:anmol_marketing/features/auth/data/models/change_password_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_routes.dart';

class ChangePasswordController extends GetxController {
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;

  Future<void> changePassword() async {
    try {
      isLoading.value = true;

      await AuthRepository.changePassword(
        changePassword: ChangePasswordRequestModel(
          password: newPassword.text.trim(),
          confirmPassword: confirmPassword.text.trim(),
          customerId: int.parse(Get.arguments),
        ),
      );

      isLoading.value = false;
      AppToasts.showSuccessToast(Get.context!, "Password changed successfully");

      Future.delayed(const Duration(seconds: 1), () {
        Get.offAllNamed(AppRoutes.login);
      });
    } catch (e) {
      isLoading.value = false;
      AppToasts.showErrorToast(Get.context!, e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
  }
}
