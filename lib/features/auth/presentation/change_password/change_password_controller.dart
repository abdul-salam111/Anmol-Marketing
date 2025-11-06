import 'package:anmol_marketing/core/core.dart';
import 'package:anmol_marketing/features/auth/data/models/change_password_request_model/change_password_request_model.dart';
import 'package:anmol_marketing/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_routes.dart';

class ChangePasswordController extends GetxController {
  final ChangePasswordUsecase changePasswordUsecase;
  ChangePasswordController({required this.changePasswordUsecase});

  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;

  Future<void> changePassword() async {
    isLoading.value = true;

    final response = await changePasswordUsecase.call(
      ChangePasswordRequestModel(
        password: newPassword.text.trim(),
        confirmPassword: confirmPassword.text.trim(),
        customerId: int.parse(Get.arguments),
      ),
    );
    response.fold(
      (error) {
        AppToasts.showErrorToast(Get.context!, error.toString());
        isLoading.value = false;
      },
      (data) {
        isLoading.value = false;
        AppToasts.showSuccessToast(
          Get.context!,
          "Password changed successfully",
        );
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed(AppRoutes.login);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
  }
}
