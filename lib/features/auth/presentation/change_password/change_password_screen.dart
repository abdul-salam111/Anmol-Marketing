// ignore_for_file: deprecated_member_use
import 'package:anmol_marketing/features/auth/presentation/change_password/change_password_controller.dart';
import 'package:flutter/material.dart';
import '../../../../core/barrel.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UnfocusWrapper(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ],
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "Change Password",
            style: context.bodyLargeStyle!.copyWith(
              color: AppColors.whiteTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.appPrimaryColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: screenPadding,
              child: Column(
                mainAxisAlignment: mainAxisCenter,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: padding20,
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: crossAxisStart,
                        children: [
                          Text(
                            "Change Password",
                            style: context.bodyMediumStyle!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),

                          CustomTextFormField(
                            controller: controller.newPassword,
                            labelColor: Colors.black,
                            obscureText: true,
                            labelfontSize: 14,
                            label: "New Password",
                            keyboardType: TextInputType.text,
                            borderColor: AppColors.lightGreyColor.withOpacity(
                              0.5,
                            ),

                            hintText: "Enter new password",
                            prefixIcon: Iconsax.lock,
                            validator: (lice) {
                              return Validator.validateRequired(
                                lice,
                                fieldName: "New Password",
                              );
                            },
                          ),
                          SizedBox(height: 15),
                          CustomTextFormField(
                            controller: controller.confirmPassword,
                            labelColor: Colors.black,
                            obscureText: true,
                            labelfontSize: 14,
                            label: "Confirm Password",
                            keyboardType: TextInputType.text,
                            borderColor: AppColors.lightGreyColor.withOpacity(
                              0.5,
                            ),

                            hintText: "Enter confirm password",
                            prefixIcon: Iconsax.lock,
                            validator: (lice) {
                              return Validator.validateRequired(
                                lice,
                                fieldName: "Confirm Password",
                              );
                            },
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: Obx(
                              () => CustomButton(
                                radius: 10,
                                text: "Change Password",
                                isLoading: controller.isLoading.value,
                                onPressed: () async {
                                  if (controller.formKey.currentState!
                                          .validate() &&
                                      controller.confirmPassword.text ==
                                          controller.newPassword.text) {
                                    await controller.changePassword();
                                  } else if (controller.newPassword.text !=
                                      controller.confirmPassword.text) {
                                    AppToasts.showErrorToast(
                                      Get.context!,
                                      "Password not match",
                                    );
                                  }
                                },
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
