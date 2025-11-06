import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/barrel.dart';
import '../../../../core/shared/domain/usecases/location_usecases/get_location_usecase.dart';
import '../../../../core/shared/domain/usecases/usecase.dart';
import '../../data/models/mobile_login_model/mobile_login_model.dart';
import '../../domain/usecases/get_app_token_usecase.dart';
import '../../domain/usecases/signup_user_usecase.dart';

class SignupController extends GetxController {
  // ================================
  // DEPENDENCIES
  // ================================
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

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // ================================
  // LOCATION MANAGEMENT
  // ================================
  final sectors = <Sector>[].obs;
  final selectedSector = Rxn<Sector>();
  final towns = <Town>[].obs;
  final selectedTown = Rxn<Town>();
  final selectedLocationId = 0.obs;

  // ================================
  // UI STATE
  // ================================
  final RxBool isLoading = false.obs;

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
      await _handleInvalidAppToken();
    } catch (error) {
      AppToasts.showErrorToast(Get.context!, error.toString());
    }
  }

  Future<void> _handleInvalidAppToken() async {
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
  }

  void onSectorSelected(Sector sector) {
    selectedSector.value = sector;
    towns.assignAll(sector.towns);
    selectedTown.value = null;
    townController.clear();
  }

  void onTownSelected(Town town) {
    selectedTown.value = town;
    townController.text = town.name;
    selectedLocationId.value = town.id;
  }

  // ================================
  // USER REGISTRATION METHODS
  // ================================
  Future<void> createUser() async {
    if (!validateCompleteForm()) return;

    _setLoadingState(true);

    final registrationResponse = await _callRegistrationAPI();

    registrationResponse.fold(
      (error) => _handleRegistrationError(error),
      (data) => _handleRegistrationSuccess(data),
    );
  }

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

  Future<void> _handleRegistrationSuccess(
    GetRegistrationResponseModel registrationResponse,
  ) async {
    _setLoadingState(false);
    _clearFormFields();
    await _showSuccessDialog(registrationResponse);
  }

  // ================================
  // SUCCESS DIALOG METHODS
  // ================================
  Future<void> _showSuccessDialog(
    GetRegistrationResponseModel registrationResponse,
  ) async {
    Get.defaultDialog(
      title: "",
      content: _buildSuccessDialogContent(registrationResponse),
      barrierDismissible: false,
    );

    _scheduleAutoNavigation(registrationResponse);
  }

  Widget _buildSuccessDialogContent(
    GetRegistrationResponseModel registrationResponse,
  ) {
    return Padding(
      padding: padding14,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Success Icon
          const CircleAvatar(
            backgroundColor: Colors.green,
            radius: 40,
            child: Icon(Icons.check, size: 40, color: Colors.white),
          ),

          const SizedBox(height: 20),

          // Title
          Text("Verify Account!", style: Get.context!.headlineSmallStyle),

          const SizedBox(height: 10),

          // Description
          Text(
            "Please, check your WhatsApp for verification code and verify your account.",
            textAlign: textAlignCenter,
            style: Get.context!.bodySmallStyle!.copyWith(
              color: AppColors.greyColor,
            ),
          ),

          const SizedBox(height: 20),

          // Verify Button
          SizedBox(
            width: 100,
            child: CustomButton(
              backgroundColor: AppColors.appPrimaryColor,
              radius: 10,
              text: "Verify",
              onPressed: () {
                Get.back();
                navigateToVerification(registrationResponse);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _scheduleAutoNavigation(
    GetRegistrationResponseModel registrationResponse,
  ) {
    Future.delayed(const Duration(seconds: 7), () {
      if (Get.isDialogOpen ?? false) {
        Get.back();
        navigateToVerification(registrationResponse);
      }
    });
  }

  void navigateToVerification(
    GetRegistrationResponseModel registrationResponse,
  ) {
    Get.toNamed(
      AppRoutes.phoneVerification,
      arguments: {
        "customerId": registrationResponse.customerId.toString(),
        "from": "signup",
      },
    );
  }

  // ================================
  // VALIDATION METHODS
  // ================================
  bool isFormValid() {
    return signupFormKey.currentState?.validate() ?? false;
  }

  bool isLocationSelectionComplete() {
    return selectedSector.value != null && selectedTown.value != null;
  }

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

  // ================================
  // UTILITY METHODS
  // ================================
  void _setLoadingState(bool loading) {
    isLoading.value = loading;
  }

  void _handleRegistrationError(dynamic error) {
    _setLoadingState(false);
    AppToasts.showErrorToast(Get.context!, error.toString());
  }

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
}
