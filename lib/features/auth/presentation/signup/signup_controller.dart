import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/barrel.dart';
import '../../../../core/shared/domain/usecases/location_usecases/get_location_usecase.dart';
import '../../../../core/shared/domain/usecases/usecase.dart';
import '../../data/models/mobile_login_model.dart';
import '../../domain/usecases/get_app_token_usecase.dart';
import '../../domain/usecases/signup_user_usecase.dart';

class SignupController extends GetxController {
  final GetLocationUsecase getLocationUsecase;
  final GetAppTokenUsecase getAppTokenUsecase;
  final SignupUserUsecase signupUserUsecase;
  SignupController({
    required this.getLocationUsecase,
    required this.getAppTokenUsecase,
    required this.signupUserUsecase,
  });

  // ================================
  // FORM CONTROLLERS
  // ================================
  final TextEditingController whatsAppNumberController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController pharmacyNameController = TextEditingController();
  final TextEditingController pharmacyOwnerNameController =
      TextEditingController();
  final TextEditingController workPhoneController = TextEditingController();
  final TextEditingController sectorController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController postalAddressController = TextEditingController();
  final TextEditingController licenseNumberController = TextEditingController();
  final TextEditingController licenseExpiryDateController =
      TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();

  /// Global key for form validation
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // ================================
  // LOCATION MANAGEMENT VARIABLES
  // ================================

  final sectors = <Sector>[].obs;
  final selectedSector = Rxn<Sector>();
  final towns = <Town>[].obs;
  final selectedTown = Rxn<Town>();

  /// ID of the selected location for API submission
  final selectedLocationId = 0.obs;

  // ================================
  // UI STATE MANAGEMENT
  // ================================
  RxBool isLoading = false.obs;

  // ================================
  // LIFECYCLE METHODS
  // ================================
  @override
  void onInit() {
    super.onInit();
    getLocations();
  }

  @override
  void onClose() {
    _disposeAllControllers();
    super.onClose();
  }

  // ================================
  // LOCATION MANAGEMENT METHODS
  // ================================
  /// Fetches available locations (sectors and towns) from the API
  Future<void> getLocations() async {
    try {
      final response = await getLocationUsecase.call(NoParams());
      final List<GetLocationModel> locationData = response.fold(
        (error) => throw error,
        (data) => data,
      );

      final sectorList = buildSectorsFromJson(locationData);

      sectors.assignAll(sectorList);
    } on InvalidAppToken {
      final response = await getAppTokenUsecase.call(MobileLoginModel());
      response.fold((error) {}, (apptokenModel) async {
        final apptoken = apptokenModel.organizations!
            .map(
              (organization) => organization.branches!.isNotEmpty
                  ? organization.branches!.first.authToken?.accessToken
                  : "",
            )
            .first;
        storage.setValues(StorageKeys.appToken, apptoken!);
        final response = await getLocationUsecase.call(NoParams());
        final List<GetLocationModel> locationData = response.fold(
          (error) => throw error,
          (data) => data,
        );
        final sectorList = buildSectorsFromJson(locationData);
        sectors.assignAll(sectorList);
      });
    } catch (error) {
      AppToasts.showErrorToast(Get.context!, error.toString());
    }
  }

  /// Handles sector selection by user
  /// Updates towns list based on selected sector

  void onSectorSelected(Sector sector) {
    selectedSector.value = sector;
    towns.assignAll(sector.towns);
    selectedTown.value = null;
    townController.clear();
  }

  /// Handles town selection by user
  /// Updates the selected town and location ID for form submission
  void onTownSelected(Town town) {
    selectedTown.value = town;
    townController.text = town.name;
    selectedLocationId.value = town.id;
  }

  // ================================
  // USER REGISTRATION METHODS
  // ================================

  /// Main method to create/register a new user
  Future<void> createUser() async {
    _setLoadingState(true);
    final registrationResponse = await _callRegistrationAPI();
    await registrationResponse.fold(
      (error) {
        _handleRegistrationError(error);
      },
      (data) async {
        _setLoadingState(false);
        await _showSuccessDialog(registrationResponse);
      },
    );
  }

  /// Calls the registration API with user input data
  /// Returns the registration response from the server
  Future<Either<AppException, GetRegistrationResponseModel>>
  _callRegistrationAPI() async {
    return await signupUserUsecase.call(
      RegisterUserModel(
        customerName: pharmacyNameController.text.trim(),
        mobileNbr: whatsAppNumberController.text.trim(),
        password: passwordController.text.trim(),
        locationId: selectedLocationId.value,
        licenseNbr: licenseNumberController.text.trim(),
        owerName: ownerNameController.text.trim(),
        address: postalAddressController.text.trim(),
        licenseExpiryDate: licenseExpiryDateController.text.trim(),
      ),
    );
  }

  /// Shows success dialog after successful registration
  Future<void> _showSuccessDialog(dynamic registrationResponse) async {
    Get.defaultDialog(
      title: "",
      content: _buildSuccessDialogContent(registrationResponse),
      barrierDismissible: false,
    );

    // Auto-navigate after 7 seconds if dialog is still open
    _scheduleAutoNavigation(registrationResponse);
  }

  /// Builds the content widget for the success dialog
  Widget _buildSuccessDialogContent(dynamic registrationResponse) {
    return Padding(
      padding: padding14,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Success icon
          const CircleAvatar(
            backgroundColor: Colors.green,
            radius: 40,
            child: Icon(Icons.check, size: 40, color: Colors.white),
          ),

          const SizedBox(height: 20),
          Text("Verify Account!", style: Get.context!.headlineSmallStyle),
          const SizedBox(height: 10),
          Text(
            "Please, check your WhatsApp for verification code and verify your account.",
            textAlign: textAlignCenter,
            style: Get.context!.bodySmallStyle!.copyWith(
              color: AppColors.greyColor,
            ),
          ),

          const SizedBox(height: 20),

          // Verify button
          SizedBox(
            width: 100,
            child: CustomButton(
              backgroundColor: AppColors.appPrimaryColor,
              radius: 10,
              text: "Verify",
              onPressed: () {
                Get.back(); // Close dialog
                navigateToVerification(registrationResponse);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Schedules automatic navigation to verification screen after 7 seconds
  void _scheduleAutoNavigation(dynamic registrationResponse) {
    Future.delayed(const Duration(seconds: 7), () {
      _clearFormFields();
      // Check if dialog is still open before auto-navigating
      if (Get.isDialogOpen ?? false) {
        Get.back(); // Close dialog
        navigateToVerification(registrationResponse);
      }
    });
  }

  /// Navigates to phone verification screen with registration data
  void navigateToVerification(dynamic registrationResponse) {
    Get.toNamed(
      AppRoutes.phoneVerification,
      arguments: {
        "customerId": registrationResponse.customerId.toString(),
        "from": "signup",
      }, // Customer ID for verification
    );
  }

  // ================================
  // UTILITY METHODS
  // ================================
  void _setLoadingState(bool loading) {
    isLoading.value = loading;
  }

  /// Handles registration errors by stopping loading and showing error message
  void _handleRegistrationError(dynamic error) {
    _setLoadingState(false);
    AppToasts.showErrorToast(Get.context!, error.toString());
  }

  /// Clears all form fields after successful registration
  void _clearFormFields() {
    whatsAppNumberController.clear();
    passwordController.clear();
    pharmacyNameController.clear();
    pharmacyOwnerNameController.clear();
    workPhoneController.clear();
    sectorController.clear();
    townController.clear();
    postalAddressController.clear();
    licenseNumberController.clear();
    licenseExpiryDateController.clear();
    ownerNameController.clear();
    selectedTown.value = null;
    selectedSector.value = null;
    selectedLocationId.value = 0;
  }

  /// Disposes all text controllers to prevent memory leaks
  void _disposeAllControllers() {
    whatsAppNumberController.dispose();
    passwordController.dispose();
    pharmacyNameController.dispose();
    pharmacyOwnerNameController.dispose();
    workPhoneController.dispose();
    sectorController.dispose();
    townController.dispose();
    postalAddressController.dispose();
    licenseNumberController.dispose();
    licenseExpiryDateController.dispose();
    ownerNameController.dispose();
  }

  // ================================
  // VALIDATION METHODS (Optional additions)
  // ================================
  bool isFormValid() {
    return signupFormKey.currentState?.validate() ?? false;
  }

  /// Validates if location selection is complete
  /// Returns true if both sector and town are selected
  bool isLocationSelectionComplete() {
    return selectedSector.value != null && selectedTown.value != null;
  }

  /// Validates the entire signup form including location selection
  bool validateCompleteForm() {
    if (!isFormValid()) {
      AppToasts.showErrorToast(Get.context!, "Please fill all required fields");
      return false;
    }

    if (!isLocationSelectionComplete()) {
      AppToasts.showErrorToast(Get.context!, "Please select sector and town");
      return false;
    }

    return true;
  }
}
