
import '../../../../core/barrel.dart';
import '../../../../core/shared/data/models/get_companies_model/get_companies_model.dart';
import '../../../navbar/navbar_controller.dart';

/// Controller for the **Create Order** flow.
///
/// Responsibilities:
/// 1. Fetch and cache the list of companies (local ↔ remote sync).
/// 2. Maintain a live search/filter for companies.
/// 3. Track cart totals (products & amount).
/// 4. Handle token expiration gracefully.
/// 5. Expose CRUD-style actions for orders and local DB clean-up.
class CreateOrderController extends GetxController {
  /* -------------------------------------------------------------------------- */
  /*                               Search & Lists                               */
  /* -------------------------------------------------------------------------- */

  /// Current search string typed by the user.
  final RxString searchQuery = ''.obs;

  /// All companies returned by the backend (after filtering against local DB).
  final RxList<GetCompaniesModel> companies = <GetCompaniesModel>[].obs;

  /// Sub-list of [companies] that matches [searchQuery].
  final RxList<GetCompaniesModel> filterCompanies = <GetCompaniesModel>[].obs;

  /* -------------------------------------------------------------------------- */
  /*                          Cart & Order Aggregates                           */
  /* -------------------------------------------------------------------------- */

  /// Total distinct products across all draft orders.
  final RxInt totalProducts = 0.obs;

  /// Grand total amount across all draft orders.
  final RxDouble totalAmount = 0.0.obs;

  /// All draft orders stored locally.
  final RxList<OrderModel> orders = <OrderModel>[].obs;

  /// Flattened list of every company line-item in every order.
  final RxList<OrderCompany> cartItems = <OrderCompany>[].obs;

  /* -------------------------------------------------------------------------- */
  /*                                 UI Flags                                   */
  /* -------------------------------------------------------------------------- */

  /// Global loading flag (initial page load / refresh).
  final RxBool isLoading = false.obs;

  /// Dedicated flag for company-fetching only (pull-to-refresh, etc.).
  final RxBool isCompanyLoading = false.obs;

  /// Last error that occurred while fetching data.
  final RxString errorMessage = ''.obs;

  /* -------------------------------------------------------------------------- */
  /*                              Local Database                                */
  /* -------------------------------------------------------------------------- */

  final DatabaseHelper _db = DatabaseHelper();

  /* -------------------------------------------------------------------------- */
  /*                              Lifecycle Hooks                               */
  /* -------------------------------------------------------------------------- */

  @override
  void onReady() {
    super.onReady();
    _initializeController();
  }

  /// One-time setup: start listeners and load initial data.
  void _initializeController() {
    refreshCreateOrderPageData();

    // Reactively filter companies when search query changes.
    ever(searchQuery, (String q) => _filterCompanies(q.trim()));
  }

  /* -------------------------------------------------------------------------- */
  /*                             Referesh Data                           */
  /* -------------------------------------------------------------------------- */

  /// Reloads everything needed for the screen (companies + orders).
  Future<void> refreshCreateOrderPageData() async {
    await Future.wait([fetchCompanies(), fetchOrders()]);
    searchQuery.value = "";
  }

  /* -------------------------------------------------------------------------- */
  /*                             Company Management                             */
  /* -------------------------------------------------------------------------- */

  /// Fetches companies from **local DB** first, then syncs with **remote**.
  ///
  /// Only companies whose `companyId` exists in the local DB are kept.
  Future<void> fetchCompanies() async {
    try {
      _setCompanyLoadingState(true);
      errorMessage.value = '';
      final synced = await _getSynchronizedCompanies();
      companies.assignAll(synced);
      _filterCompanies(searchQuery.value); // keep search in sync
    } on InvalidAppToken {
      await _handleTokenExpirationForCompanies();
    } catch (_) {
      errorMessage.value = 'Failed to load companies';
    } finally {
      _setCompanyLoadingState(false);
    }
  }

  /// Returns the intersection of remote companies and local companies.
  Future<List<GetCompaniesModel>> _getSynchronizedCompanies() async {
    final local = await CompaniesRepository.fetchCompaniesFromLocal();
    final remote = await CompaniesRepository.getCompaniesList();

    final localIds = local.map((c) => c.companyId).toSet();
    return remote.where((c) => localIds.contains(c.companyId)).toList();
  }

  /// Re-authenticates and retries company sync if token expired.
  Future<void> _handleTokenExpirationForCompanies() async {
    try {
      _setCompanyLoadingState(true);

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

      final synced = await _getSynchronizedCompanies();
      companies.assignAll(synced);
      _filterCompanies(searchQuery.value);
    } catch (_) {
      errorMessage.value = 'Failed to load companies after re-authentication';
    } finally {
      _setCompanyLoadingState(false);
    }
  }

  /// Filters the main [companies] list based on the supplied [query].
  void _filterCompanies(String query) {
    if (query.isEmpty) {
      filterCompanies.assignAll(companies);
    } else {
      final q = query.toLowerCase();
      filterCompanies.assignAll(
        companies.where(
          (c) => c.companyName?.toLowerCase().contains(q) ?? false,
        ),
      );
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                               Order Handling                               */
  /* -------------------------------------------------------------------------- */

  /// Reads all draft orders from the local DB and updates aggregates.
  Future<void> fetchOrders() async {
    try {
      isLoading.value = true;

      final list = await _db.getAllOrders();
      orders.assignAll(list);

      // Recalculate totals
      totalAmount.value = list.fold(0.0, (sum, o) => sum + o.grandTotal);
      totalProducts.value = list.fold(0, (sum, o) => sum + o.totalProducts);

      // Flatten line-items for quick cart preview
      cartItems.assignAll(list.expand((o) => o.companies));
    } catch (_) {
      errorMessage.value = 'Failed to load orders';
    } finally {
      isLoading.value = false;
    }
  }

  /// **Destructive** clean-up:
  /// 1. Deletes all draft orders.
  /// 2. Clears the **companies** table.
  /// 3. Re-seeds companies from the catalog DB.
  /// 4. Refreshes the UI.
  Future<void> deleteAllOrder() async {
    try {
      // Switch to Home tab immediately
      Get.find<NavbarController>().currentIndex.value = 0;

      await _db.clearAllOrders();
      await _db.clearCompaniesTable();
      await _refreshCatalogCompanies();

      refreshCreateOrderPageData();
    } catch (e) {
      debugPrint('Error deleting all orders: $e');
      errorMessage.value = 'Failed to clear orders';
    }
  }

  /// Loads companies from the catalog DB and inserts them into the orders table.
  Future<void> _refreshCatalogCompanies() async {
    try {
      final catalogCompanies = await _db.getCatalogCompanies();
      for (final company in catalogCompanies) {
        if (company.companyId != null) {
          await _db.insertCompany(company);
        }
      }
    } catch (e) {
      debugPrint('Error updating companies: $e');
      errorMessage.value = 'Failed to refresh companies';
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                                UI Helpers                                  */
  /* -------------------------------------------------------------------------- */

  void _setCompanyLoadingState(bool loading) =>
      isCompanyLoading.value = loading;
}
