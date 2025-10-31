// ignore_for_file: deprecated_member_use
import 'package:anmol_marketing/features/auth/presentation/signup/signup_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/barrel.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  // Constants for better maintainability
  static const double _logoRadius = 40.0;
  static const double _buttonHeight = 50.0;
  static const double _buttonRadius = 20.0;
  static const double _fieldSpacing = 0.01;
  static const double _sectionSpacing = 0.02;
  static const double _largeSpacing = 0.03;
  static const double _bottomSpacing = 30.0;

  @override
  Widget build(BuildContext context) {
    return UnfocusWrapper(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: screenPadding,
              child: Column(
                crossAxisAlignment: crossAxisStart,
                children: [
                  _buildHeader(context),
                  _buildSignupForm(context),
                  _buildFooter(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the app bar with consistent styling
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: 30,
      backgroundColor: AppColors.appLightThemeBackground,
      surfaceTintColor: AppColors.appLightThemeBackground,
    );
  }

  /// Builds the header section with logo and title
  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: AppLogo(radius: _logoRadius)),
        context.heightBox(context.screenHeight * _sectionSpacing),
        Text(
          AppConstants.signuptitle,
          style: context.headlineMediumStyle?.copyWith(
            color: AppColors.appTertiaryColor,
          ),
        ),
        context.heightBox(3),
        Text(
          AppConstants.filldetails,
          style: context.bodySmallStyle?.copyWith(
            color: AppColors.blackTextColor,
          ),
        ),
        context.heightBox(context.screenHeight * _sectionSpacing),
      ],
    );
  }

  /// Builds the main signup form
  Widget _buildSignupForm(BuildContext context) {
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          _buildContactFields(context),
          _buildPharmacyDetailsFields(context),
          _buildLocationFields(context),
          _buildLicenseFields(context),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  /// Builds contact-related input fields
  Widget _buildContactFields(BuildContext context) {
    return Column(
      children: [
        _buildPhoneField(),
        context.heightBox(context.screenHeight * _fieldSpacing),
        _buildPasswordField(),
        context.heightBox(context.screenHeight * _largeSpacing),
      ],
    );
  }

  /// Builds pharmacy details input fields
  Widget _buildPharmacyDetailsFields(BuildContext context) {
    return Column(
      children: [
        _buildPharmacyNameField(),
        context.heightBox(context.screenHeight * _fieldSpacing),
        _buildOwnerNameField(),
        context.heightBox(context.screenHeight * 0.015),
      ],
    );
  }

  /// Builds location-related input fields
  Widget _buildLocationFields(BuildContext context) {
    return Column(
      children: [
        _buildSectorDropdown(),
        context.heightBox(context.screenHeight * 0.015),
        _buildTownDropdown(),
        context.heightBox(context.screenHeight * _fieldSpacing),
        _buildPostalAddressField(),
        context.heightBox(context.screenHeight * _fieldSpacing),
      ],
    );
  }

  /// Builds license-related input fields
  Widget _buildLicenseFields(BuildContext context) {
    return Column(
      children: [
        _buildLicenseNumberField(),
        context.heightBox(context.screenHeight * _fieldSpacing),
        _buildLicenseExpiryField(context),
        context.heightBox(context.screenHeight * _largeSpacing),
      ],
    );
  }

  /// Builds phone number input field
  Widget _buildPhoneField() {
    return CustomTextFormField(
      controller: controller.whatsAppNumberController,
      keyboardType: TextInputType.phone,
      borderColor: AppColors.lightGreyColor.withOpacity(0.5),
      fillColor: AppColors.mostLightGreyColor.withOpacity(0.5),
      hintText: AppConstants.whtsappnumber,
      prefixIcon: Iconsax.call,
      validator: Validator.validatePhone,
    );
  }

  /// Builds password input field
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

  /// Builds pharmacy name input field
  Widget _buildPharmacyNameField() {
    return CustomTextFormField(
      controller: controller.pharmacyNameController,
      keyboardType: TextInputType.text,
      borderColor: AppColors.lightGreyColor.withOpacity(0.5),
      fillColor: AppColors.mostLightGreyColor.withOpacity(0.5),
      hintText: AppConstants.pharmacylglname,
      prefixIcon: Iconsax.card_edit,
    );
  }

  /// Builds owner name input field
  Widget _buildOwnerNameField() {
    return CustomTextFormField(
      controller: controller.ownerNameController,
      keyboardType: TextInputType.text,
      borderColor: AppColors.lightGreyColor.withOpacity(0.5),
      fillColor: AppColors.mostLightGreyColor.withOpacity(0.5),
      hintText: AppConstants.ownerName,
      prefixIcon: Iconsax.profile_circle,
      validator: (value) =>
          Validator.validateRequired(value, fieldName: AppConstants.ownerName),
    );
  }

  /// Builds sector dropdown field
  Widget _buildSectorDropdown() {
    return Obx(() {
      return DropdownButtonFormField<Sector>(
        dropdownColor: Colors.white,
        style: _getDropdownTextStyle(),
        decoration: _getDropdownDecoration(
          hintText: AppConstants.sector,
          icon: Iconsax.location,
        ),
        value: controller.selectedSector.value,
        onChanged: (sector) {
          if (sector != null) {
            controller.onSectorSelected(sector);
            controller.sectorController.text = sector.name;
          }
        },
        items: controller.sectors
            .map(
              (sector) =>
                  DropdownMenuItem(value: sector, child: Text(sector.name)),
            )
            .toList(),
      );
    });
  }

  /// Builds town dropdown field
  Widget _buildTownDropdown() {
    return Obx(() {
      return DropdownButtonFormField<Town>(
        dropdownColor: Colors.white,
        isDense: true,
        style: _getDropdownTextStyle(),
        decoration: _getDropdownDecoration(
          hintText: "Town",
          icon: Iconsax.location,
        ),
        value: controller.selectedTown.value,
        onChanged: (town) {
          if (town != null) {
            controller.onTownSelected(town);
          }
        },
        items: controller.towns
            .map(
              (town) => DropdownMenuItem(value: town, child: Text(town.name)),
            )
            .toList(),
      );
    });
  }

  /// Builds postal address input field
  Widget _buildPostalAddressField() {
    return CustomTextFormField(
      controller: controller.postalAddressController,
      keyboardType: TextInputType.text,
      borderColor: AppColors.lightGreyColor.withOpacity(0.5),
      fillColor: AppColors.mostLightGreyColor.withOpacity(0.5),
      hintText: AppConstants.postaladd,
      prefixIcon: Iconsax.location,
    );
  }

  /// Builds license number input field
  Widget _buildLicenseNumberField() {
    return CustomTextFormField(
      controller: controller.licenseNumberController,
      keyboardType: TextInputType.text,
      borderColor: AppColors.lightGreyColor.withOpacity(0.5),
      fillColor: AppColors.mostLightGreyColor.withOpacity(0.5),
      hintText: AppConstants.license,
      prefixIcon: Iconsax.card_edit,
      validator: (value) =>
          Validator.validateRequired(value, fieldName: AppConstants.license),
    );
  }

  /// Builds license expiry date picker field
  Widget _buildLicenseExpiryField(BuildContext context) {
    return CustomTextFormField(
      readonly: true,
      controller: controller.licenseExpiryDateController,
      keyboardType: TextInputType.text,
      borderColor: AppColors.lightGreyColor.withOpacity(0.5),
      fillColor: AppColors.mostLightGreyColor.withOpacity(0.5),
      onTap: () => _showDatePicker(context),
      hintText: AppConstants.licenseExpiry,
      prefixIcon: Iconsax.calendar,
      validator: (value) => Validator.validateRequired(
        value,
        fieldName: AppConstants.licenseExpiry,
      ),
    );
  }

  /// Shows date picker and updates the license expiry field
  Future<void> _showDatePicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final formattedDate = _formatDate(pickedDate);
      controller.licenseExpiryDateController.text = formattedDate;
    }
  }

  /// Formats date to YYYY-MM-DD format
  String _formatDate(DateTime date) {
    return "${date.year}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.day.toString().padLeft(2, '0')}";
  }

  /// Builds the submit button
  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _buttonHeight,
      child: Obx(
        () => CustomButton(
          isLoading: controller.isLoading.value,
          radius: _buttonRadius,
          text: AppConstants.createaccount,
          onPressed: _handleSubmit,
          backgroundColor: AppColors.appPrimaryColor,
        ),
      ),
    );
  }

  /// Handles form submission
  Future<void> _handleSubmit() async {
    if (controller.signupFormKey.currentState?.validate() ?? false) {
      await controller.createUser();
    }
  }

  /// Builds the footer with login navigation
  Widget _buildFooter(BuildContext context) {
    return Center(
      child: Column(
        children: [
          context.heightBox(context.screenHeight * _sectionSpacing),
          RichText(
            text: TextSpan(
              text: AppConstants.haveanAccount,
              style: context.bodySmallStyle?.copyWith(
                color: AppColors.blackTextColor,
              ),
              children: [
                TextSpan(
                  text: AppConstants.siginin,
                  style: context.bodySmallStyle?.copyWith(
                    color: AppColors.appPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.offAllNamed(AppRoutes.login),
                ),
              ],
            ),
          ),
          context.heightBox(_bottomSpacing),
        ],
      ),
    );
  }

  /// Returns consistent text style for dropdown fields
  TextStyle? _getDropdownTextStyle() {
    return Get.context?.bodySmallStyle?.copyWith(
      color: AppColors.blackTextColor,
    );
  }

  /// Returns consistent input decoration for dropdown fields
  InputDecoration _getDropdownDecoration({
    required String hintText,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Get.context?.bodySmallStyle?.copyWith(
        color: AppColors.greyTextColor,
      ),
      prefixIcon: Icon(icon, color: AppColors.greyColor, size: 20),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightGreyColor.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      fillColor: AppColors.mostLightGreyColor.withOpacity(0.5),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.greyColor, width: 2),
      ),
      contentPadding: const EdgeInsets.only(left: 10),
    );
  }
}
