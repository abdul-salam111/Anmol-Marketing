import 'package:flutter/material.dart';

import '../../../core/barrel.dart';

class AccountStatementsController extends GetxController {
  /// List of account statements retrieved from the API.
  RxList<GetAccountStatementsModel> getAccountStatementsList =
      <GetAccountStatementsModel>[].obs;

  /// Selected start date for filtering statements.
  var fromDate = Rxn<DateTime>();

  /// Selected end date for filtering statements.
  var toDate = Rxn<DateTime>();

  /// Stores any error messages encountered during API calls.
  RxString errorMessage = ''.obs;

  /// This variable is used to show loading
  RxBool isLoading = false.obs;

  /// Map to track expanded years
  RxMap<String, bool> expandedYears = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();

    final now = DateTime.now();

    // Default range: last 7 days until tomorrow
    fromDate.value = now.subtractDays(7);
    toDate.value = now.addDays(1);
    getAccountStatements();
  }

  /// Formats a [DateTime] object to "dd-MMM-yyyy".
  /// If null, returns "Select date".
  String formatDate(DateTime? date) {
    if (date == null) return "Select date";
    return DateFormat("dd-MMM-yyyy").format(date);
  }

  /// Opens date picker for selecting the start date.
  Future<void> pickFromDate() async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: fromDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) fromDate.value = picked;
  }

  /// Opens date picker for selecting the end date.
  Future<void> pickToDate() async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: toDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) toDate.value = picked;
  }

  /// Toggle expansion state for a specific year
  void toggleYearExpansion(String yearName, bool isExpanded) {
    expandedYears[yearName] = isExpanded;
  }

  /// Fetches account statements from the repository
  /// based on selected [fromDate] and [toDate].
  /// Updates [getAccountStatementsList] on success,
  /// or [errorMessage] on failure.
  Future<void> getAccountStatements() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final statements = await AccountStatementRepository.getAccountStatements(
        formatDate(fromDate.value),
        formatDate(toDate.value),
      );

      if (statements.isNotEmpty) {
        getAccountStatementsList.value = statements;

        // Initialize expansion states for all years
        expandedYears.clear();
        for (var statement in statements) {
          if (statement.finYear.name.isNotEmpty) {
            expandedYears[statement.finYear.name] = false;
          }
        }
      } else {
        getAccountStatementsList.clear();
        errorMessage.value = 'No data found';
      }
    } on InvalidAppToken {
      isLoading.value = true;
      final response = await AuthRepository.loginUser(
        LoginUserModel(
          loginId: await storage.readValues(StorageKeys.phoneNumber),
          password: await storage.readValues(StorageKeys.password),
        ),
      );
      await SessionController().saveUserInStorage(response);
      await SessionController().getUserfromSharedpref();
      errorMessage.value = '';

      final statements = await AccountStatementRepository.getAccountStatements(
        formatDate(fromDate.value),
        formatDate(toDate.value),
      );

      if (statements.isNotEmpty) {
        getAccountStatementsList.value = statements;

        // Initialize expansion states for all years
        expandedYears.clear();
        for (var statement in statements) {
          if (statement.finYear.name.isNotEmpty) {
            expandedYears[statement.finYear.name] = false;
          }
        }
      } else {
        getAccountStatementsList.clear();
        errorMessage.value = 'No data found';
      }
    } catch (e) {
      errorMessage.value = 'Error fetching data: ${e.toString()}';
      getAccountStatementsList.clear();
    } finally {
      isLoading.value = false;
    }
  }

  /// Clear all data and reset states
  void clearData() {
    getAccountStatementsList.clear();
    expandedYears.clear();
    errorMessage.value = '';
  }

  @override
  void onClose() {
    clearData();
    super.onClose();
  }
}
