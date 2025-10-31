import 'package:anmol_marketing/core/barrel.dart';
import 'package:flutter/material.dart';
import 'forget_password_controller.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UnfocusWrapper(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: screenPadding,
              child: Center(
                child: Column(
                  crossAxisAlignment: crossAxisCenter,
                  children: [
                    context.heightBox(context.screenHeight * 0.05),
                    AppLogo(radius: 60),
                    context.heightBox(context.screenHeight * 0.05),

                    Text("Forget Password", style: context.headlineMediumStyle),
                    SizedBox(height: 10),
                    SizedBox(
                      width: context.screenWidth * 0.8,
                      child: Text(
                        "Please, enter your registered phone number to reset your password.",
                        textAlign: textAlignCenter,
                        style: context.bodySmallStyle!.copyWith(
                          color: AppColors.darkGreyColor,
                        ),
                      ),
                    ),
                    context.heightBox(context.screenHeight * 0.05),
                    Form(
                      key: controller.formKey,
                      child: CustomTextFormField(
                        controller: controller.phoneNumberController,
                        keyboardType: TextInputType.phone,
                        borderColor: AppColors.lightGreyColor.withAlpha(60),
                        fillColor: AppColors.mostLightGreyColor.withAlpha(60),
                        hintText: AppConstants.mobileNumber,
                        prefixIcon: Iconsax.call,
                        validator: Validator.validatePhone,
                      ),
                    ),
                    context.heightBox(context.screenHeight * 0.05),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Obx(
                        () => CustomButton(
                          isLoading: controller.isLoading.value,
                          radius: 10,
                          backgroundColor: AppColors.appPrimaryColor,
                          text: "Send OTP",
                          onPressed: () async {
                            if (controller.formKey.currentState!.validate()) {
                              await controller.sendOtp();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
