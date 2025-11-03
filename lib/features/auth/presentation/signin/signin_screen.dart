// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/barrel.dart';
import 'signin_controller.dart';

class LoginScreen extends GetView<SignInController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UnfocusWrapper(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: screenPadding,
              child: Column(
                crossAxisAlignment: crossAxisStart,
                children: [
                  _buildLogo(context),
                  _buildHeader(context),
                  _buildLoginForm(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Logo section
  Widget _buildLogo(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.screenHeight * 0.05),
        Center(
          child: GestureDetector(
            onTap: controller.handleTap,
            child: const AppLogo(radius: 70),
          ),
        ),
        SizedBox(height: context.screenHeight * 0.1),
      ],
    );
  }

  // Header text section
  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.letsSignin,
          style: context.headlineMediumStyle!.copyWith(
            color: AppColors.appTertiaryColor,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          AppConstants.filldetails,
          style: context.bodySmallStyle!.copyWith(
            color: AppColors.blackTextColor,
          ),
        ),
        SizedBox(height: context.screenHeight * 0.03),
      ],
    );
  }

  // Login form section
  Widget _buildLoginForm(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          _buildPhoneField(),
          SizedBox(height: context.screenHeight * 0.02),
          _buildPasswordField(),
          _buildForgotPassword(context),
          SizedBox(height: context.screenHeight * 0.02),
          _buildLoginButton(),
          SizedBox(height: context.screenHeight * 0.02),
          _buildSignupPrompt(context),
          SizedBox(height: context.screenHeight * 0.02),
          _buildTestingModeText(context),
        ],
      ),
    );
  }

  // Phone number field
  Widget _buildPhoneField() {
    return CustomTextFormField(
      controller: controller.phoneNumberController,
      keyboardType: TextInputType.phone,
      borderColor: AppColors.lightGreyColor.withOpacity(0.5),
      fillColor: AppColors.mostLightGreyColor.withOpacity(0.5),
      hintText: AppConstants.mobileNumber,
      prefixIcon: Iconsax.call,
      validator: Validator.validatePhone,
    );
  }

  // Password field
  Widget _buildPasswordField() {
    return CustomTextFormField(
      obscureText: true,
      controller: controller.passwordController,
      keyboardType: TextInputType.text,
      borderColor: AppColors.lightGreyColor.withOpacity(0.5),
      fillColor: AppColors.mostLightGreyColor.withOpacity(0.5),
      hintText: AppConstants.password,
      prefixIcon: Iconsax.lock,
      validator: Validator.validatePassword,
    );
  }

  // Forgot password link
  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Get.toNamed(AppRoutes.forgetPassword);
        },
        child: Text(
          AppConstants.forgotPassword,
          style: context.displayLargeStyle!.copyWith(
            color: AppColors.appPrimaryColor,
          ),
        ),
      ),
    );
  }

  // Login button
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Obx(
        () => CustomButton(
          isLoading: controller.isLoading.value,
          radius: 20,
          text: AppConstants.siginin,
          onPressed: _handleLogin,
          backgroundColor: AppColors.appPrimaryColor,
        ),
      ),
    );
  }

  // Handle login logic
  void _handleLogin() async {
    if (controller.loginFormKey.currentState!.validate()) {
      await controller.signInUser();
    }
  }

  // Sign up prompt
  Widget _buildSignupPrompt(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppConstants.donthaveAccount,
        style: context.bodySmallStyle!.copyWith(
          color: AppColors.blackTextColor,
        ),
        children: [
          TextSpan(
            text: AppConstants.createnewAccount,
            style: context.bodySmallStyle!.copyWith(
              color: AppColors.appPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed(AppRoutes.signup);
              },
          ),
        ],
      ),
    );
  }

  // Testing mode text
  Widget _buildTestingModeText(BuildContext context) {
    return Obx(
      () => controller.showTestingModeText.value
          ? Text(
              controller.testingModeText,
              style: context.bodySmallStyle!.copyWith(color: Colors.red),
            )
          : const SizedBox.shrink(),
    );
  }
}
