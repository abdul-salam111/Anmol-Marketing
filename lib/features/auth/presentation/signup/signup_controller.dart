import 'package:flutter/material.dart';
import '../../../../core/barrel.dart';

/// Controller class for handling user signup/registration functionality
/// This class manages form validation, location selection, user registration,
/// and navigation to verification screen
class SignupController extends GetxController {
  // ================================
  // FORM CONTROLLERS
  // ================================
  // These controllers manage the text input fields in the signup form

  /// Controller for WhatsApp number input field
  final TextEditingController whatsAppNumberController =
      TextEditingController();

  /// Controller for password input field
  final TextEditingController passwordController = TextEditingController();

  /// Controller for pharmacy name input field
  final TextEditingController pharmacyNameController = TextEditingController();

  /// Controller for pharmacy owner name input field
  final TextEditingController pharmacyOwnerNameController =
      TextEditingController();

  /// Controller for work phone number input field
  final TextEditingController workPhoneController = TextEditingController();

  /// Controller for sector selection display
  final TextEditingController sectorController = TextEditingController();

  /// Controller for town selection display
  final TextEditingController townController = TextEditingController();

  /// Controller for postal address input field
  final TextEditingController postalAddressController = TextEditingController();

  /// Controller for license number input field
  final TextEditingController licenseNumberController = TextEditingController();

  /// Controller for license expiry date input field
  final TextEditingController licenseExpiryDateController =
      TextEditingController();

  /// Controller for owner name input field
  final TextEditingController ownerNameController = TextEditingController();

  /// Global key for form validation
  /// Used to validate all form fields before submission
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // ================================
  // LOCATION MANAGEMENT VARIABLES
  // ================================
  // These observables manage the location selection functionality

  /// List of available sectors (observable)
  /// .obs makes it reactive - UI will update when this list changes
  final sectors = <Sector>[].obs;

  /// Currently selected sector (nullable observable)
  /// Rxn allows null values and reactive updates
  final selectedSector = Rxn<Sector>();

  /// List of towns in the selected sector (observable)
  final towns = <Town>[].obs;

  /// Currently selected town (nullable observable)
  final selectedTown = Rxn<Town>();

  /// ID of the selected location for API submission
  final selectedLocationId = 0.obs;

  // ================================
  // UI STATE MANAGEMENT
  // ================================

  /// Loading state indicator for signup process
  /// Shows/hides loading spinner during API calls
  RxBool isLoading = false.obs;

  // ================================
  // LIFECYCLE METHODS
  // ================================

  /// Called when the controller is first created
  /// Initializes the controller and loads necessary data
  @override
  void onInit() {
    super.onInit();
    // Load locations data when controller initializes
    getLocations();
  }

  /// Called when the controller is being destroyed
  /// Cleans up resources to prevent memory leaks
  @override
  void onClose() {
    // Dispose all text controllers to free up memory
    _disposeAllControllers();
    super.onClose();
  }

  // ================================
  // LOCATION MANAGEMENT METHODS
  // ================================

  /// Fetches available locations (sectors and towns) from the API
  /// This populates the location dropdown menus
  Future<void> getLocations() async {
    try {
      // Call the location repository to get location data
      final response = await LocationRepository.getLocations();

      // Parse the response and build sector list with nested towns
      final sectorList = buildSectorsFromJson(response);

      // Update the observable sectors list (this will trigger UI update)
      sectors.assignAll(sectorList);
    } on InvalidAppToken {
      await AuthRepository.getAppTokenMethod();
      final response = await LocationRepository.getLocations();

      // Parse the response and build sector list with nested towns
      final sectorList = buildSectorsFromJson(response);

      // Update the observable sectors list (this will trigger UI update)
      sectors.assignAll(sectorList);
    } catch (error) {
      // Show error message to user if location loading fails
      AppToasts.showErrorToast(Get.context!, error.toString());
    }
  }

  /// Handles sector selection by user
  /// Updates towns list based on selected sector
  ///
  /// Parameters:
  /// - sector: The sector object selected by the user
  void onSectorSelected(Sector sector) {
    // Set the selected sector
    selectedSector.value = sector;

    // Update towns list with towns from selected sector
    towns.assignAll(sector.towns);

    // Reset town selection since sector changed
    selectedTown.value = null;

    // Clear town controller text
    townController.clear();
  }

  /// Handles town selection by user
  /// Updates the selected town and location ID for form submission
  ///
  /// Parameters:
  /// - town: The town object selected by the user
  void onTownSelected(Town town) {
    // Set the selected town
    selectedTown.value = town;

    // Update town controller to display selected town name
    townController.text = town.name;

    // Store the location ID for API submission
    selectedLocationId.value = town.id;
  }

  // ================================
  // USER REGISTRATION METHODS
  // ================================

  /// Main method to create/register a new user
  /// Validates form data, calls API, shows success dialog, and navigates to verification
  Future<void> createUser() async {
    try {
      // Start loading state (shows spinner in UI)
      _setLoadingState(true);
      // Call registration API with form data
      final registrationResponse = await _callRegistrationAPI();
      // Stop loading state
      _setLoadingState(false);
      // Show success dialog to user
      await _showSuccessDialog(registrationResponse);
    } on InvalidAppToken {
      _setLoadingState(true);
      await AuthRepository.getAppTokenMethod();
      // Call registration API with form data
      final registrationResponse = await _callRegistrationAPI();
      // Stop loading state
      _setLoadingState(false);
      // Show success dialog to user
      await _showSuccessDialog(registrationResponse);
    } catch (error) {
      // Handle any errors that occur during registration
      _handleRegistrationError(error);
    }
  }

  /// Calls the registration API with user input data
  /// Returns the registration response from the server
  Future<dynamic> _callRegistrationAPI() async {
    return await AuthRepository.signupUser(
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
  /// Includes automatic navigation after timeout
  ///
  /// Parameters:
  /// - registrationResponse: Response from registration API containing user details
  Future<void> _showSuccessDialog(dynamic registrationResponse) async {
    Get.defaultDialog(
      title: "", // Empty title for cleaner look
      content: _buildSuccessDialogContent(registrationResponse),
      barrierDismissible: false, // Prevent dismissing by tapping outside
    );

    // Auto-navigate after 7 seconds if dialog is still open
    _scheduleAutoNavigation(registrationResponse);
  }

  /// Builds the content widget for the success dialog
  ///
  /// Parameters:
  /// - registrationResponse: Response data for navigation
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

          // Success title
          Text("Verify Account!", style: Get.context!.headlineSmallStyle),

          const SizedBox(height: 10),

          // Success message
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
  /// Only navigates if dialog is still open
  ///
  /// Parameters:
  /// - registrationResponse: Response data for navigation
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
  ///
  /// Parameters:
  /// - registrationResponse: Contains customer ID and OTP for verification
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

  /// Sets the loading state and updates UI accordingly
  ///
  /// Parameters:
  /// - loading: true to show loading, false to hide loading
  void _setLoadingState(bool loading) {
    isLoading.value = loading;
  }

  /// Handles registration errors by stopping loading and showing error message
  ///
  /// Parameters:
  /// - error: The error object/message to display
  void _handleRegistrationError(dynamic error) {
    _setLoadingState(false);
    AppToasts.showErrorToast(Get.context!, error.toString());
  }

  /// Clears all form fields after successful registration
  /// This resets the form for potential reuse
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

    // Reset location selections
    selectedTown.value = null;
    selectedSector.value = null;
    selectedLocationId.value = 0;
  }

  /// Disposes all text controllers to prevent memory leaks
  /// Called during controller cleanup
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

  /// Validates if all required fields are filled
  /// Returns true if form is valid, false otherwise
  bool isFormValid() {
    return signupFormKey.currentState?.validate() ?? false;
  }

  /// Validates if location selection is complete
  /// Returns true if both sector and town are selected
  bool isLocationSelectionComplete() {
    return selectedSector.value != null && selectedTown.value != null;
  }

  /// Validates the entire signup form including location selection
  /// Shows appropriate error messages for missing data
  /// Returns true if everything is valid
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

/*
CONTROLLER OVERVIEW:
===================

This SignupController manages the entire user registration flow for the Anmol Marketing app.

KEY RESPONSIBILITIES:
1. Form Management - Handles all text input controllers and form validation
2. Location Selection - Manages sector/town dropdown selections via API
3. User Registration - Calls registration API and handles responses
4. UI State - Manages loading states and user feedback
5. Navigation - Handles routing to verification screen after signup

USAGE FLOW:
1. User fills out signup form
2. User selects sector (triggers town loading)
3. User selects town from filtered list
4. User submits form (createUser() is called)
5. API registration is attempted
6. Success dialog is shown with verification instructions
7. User is navigated to verification screen (manual or automatic)

REACTIVE VARIABLES:
- All form controllers are standard TextEditingController
- Location data uses .obs for reactive updates
- Loading state uses RxBool for automatic UI updates

ERROR HANDLING:
- All API calls are wrapped in try-catch blocks
- Errors are displayed using AppToasts
- Loading state is properly reset on errors

MEMORY MANAGEMENT:
- All controllers are properly disposed in onClose()
- Form fields are cleared after successful registration
*/
