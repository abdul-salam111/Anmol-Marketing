import 'package:flutter/material.dart';
import '../../../../core/barrel.dart';

/// Controller for the **Order History** screen.
///
/// Provides:
/// 1. Date-range filtering (default last 7 days).
/// 2. Fetching and caching of order list from the backend.
/// 3. Automatic token-refresh on session expiry.
class OrderHistoryController extends GetxController {
  /* -------------------------------------------------------------------------- */
  /*                               Date Range                                   */
  /* -------------------------------------------------------------------------- */

  /// Selected start date (inclusive).
  final Rxn<DateTime> fromDate = Rxn<DateTime>();

  /// Selected end date (inclusive).
  final Rxn<DateTime> toDate = Rxn<DateTime>();

  /* -------------------------------------------------------------------------- */
  /*                                UI State                                    */
  /* -------------------------------------------------------------------------- */

  /// `true` while any network request is in flight.
  final RxBool isLoading = false.obs;

  /// List of orders returned by the backend.
  final RxList<GetAllOrders> getAllOrdersList = <GetAllOrders>[].obs;

  /* -------------------------------------------------------------------------- */
  /*                              Lifecycle Hooks                               */
  /* -------------------------------------------------------------------------- */

  @override
  void onInit() {
    super.onInit();
    _setDefaultDateRange();
  }

  @override
  void onReady() {
    super.onReady();
    getAllOrders();
  }

  /* -------------------------------------------------------------------------- */
  /*                            Date-Range Utilities                            */
  /* -------------------------------------------------------------------------- */

  /// Sets the default range: last 7 days → tomorrow (to include today).
  void _setDefaultDateRange() {
    final now = DateTime.now();
    fromDate.value = now.subtractDays(7);
    toDate.value = now.addDays(1);
  }

  /// Formats a [DateTime] for display in UI pickers.
  String formatDate(DateTime? date) =>
      date == null ? 'Select date' : DateFormat('dd-MMM-yyyy').format(date);

  /// Opens the Material date-picker for `fromDate`.
  Future<void> pickFromDate() async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: fromDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) fromDate.value = picked;
  }

  /// Opens the Material date-picker for `toDate`.
  Future<void> pickToDate() async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: toDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) toDate.value = picked;
  }

  /* -------------------------------------------------------------------------- */
  /*                             Data Fetching                                  */
  /* -------------------------------------------------------------------------- */

  /// Loads orders within the current date range.
  ///
  /// Automatically retries once if the access token is invalid.
  Future<void> getAllOrders() async {
    final from = fromDate.value;
    final to = toDate.value;

    if (from == null || to == null) return;

    try {
      isLoading.value = true;
      await _fetchOrders(from, to);
    } on InvalidAppToken {
      await _reAuthenticateAndRetry(from, to);
    } catch (error) {
      AppToasts.showErrorToast(Get.context!, error.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Performs the actual API call.
  Future<void> _fetchOrders(DateTime from, DateTime to) async {
    final list = await OrdersRepository.getAllOrders(
      startingDate: DateFormat('yyyy-MM-dd').format(from),
      toDate: DateFormat('yyyy-MM-dd').format(to),
    );
    getAllOrdersList.assignAll(list);
  }

  /// Re-authenticates the user and re-fetches orders.
  Future<void> _reAuthenticateAndRetry(DateTime from, DateTime to) async {
    try {
      isLoading.value = true;

      final response = await AuthRepository.loginUser(
        LoginUserModel(
          loginId: await storage.readValues(StorageKeys.phoneNumber) ?? '',
          password: await storage.readValues(StorageKeys.password) ?? '',
        ),
      );

      await Future.wait([
        SessionController().saveUserInStorage(response),
        SessionController().getUserfromSharedpref(),
      ]);

      await _fetchOrders(from, to);
    } catch (error) {
      AppToasts.showErrorToast(Get.context!, error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}