import 'package:flutter/material.dart';

import '../../../core/barrel.dart';
import '../../auth/data/models/change_password_request_model.dart';

class ProfileController extends GetxController {
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
          customerId: SessionController().getUserDetails.customer!.customerId!,
        ),
      );

      isLoading.value = false;
      AppToasts.showSuccessToast(Get.context!, "Password changed successfully");
      newPassword.clear();
      confirmPassword.clear();
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

  Future<void> logoutUser() async {
    await Future.wait([
      storage.clearValues(StorageKeys.loggedIn),
      storage.clearValues(StorageKeys.userDetails),
      storage.clearValues(StorageKeys.token),
    ]);
    await Get.offAllNamed(AppRoutes.login);
  }
}
