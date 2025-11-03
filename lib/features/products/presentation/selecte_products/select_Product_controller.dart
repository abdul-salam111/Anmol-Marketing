// ignore_for_file: file_names


import 'package:flutter/material.dart';

import '../../../../core/barrel.dart';
import '../../../../core/shared/data/models/get_companies_model/get_companies_model.dart';
import '../../../navbar/navbar_controller.dart';
import '../../../orders/presentation/create_orders/create_order_controller.dart';

/// Controller for the **Select Product** screen.
///
/// Allows the user to:
/// 1. Browse / search products for a given company.
/// 2. Adjust quantities line-by-line.
/// 3. Persist the selection to a local-draft order.
/// 4. Remove the company entirely if no products are chosen.
class SelectProductController extends GetxController {
  /* -------------------------------------------------------------------------- */
  /*                             Route Arguments                                */
  /* -------------------------------------------------------------------------- */

  /// The company whose products are being selected.
  late final GetCompaniesModel company;

  /// Optional existing order-company used when editing an existing draft.
  OrderCompany? orderCompany;

  /* -------------------------------------------------------------------------- */
  /*                             Reactive Fields                                */
  /* -------------------------------------------------------------------------- */

  /// Total amount for **this company only**.
  final RxDouble companyTotal = 0.0.obs;

  /// Grand total shared with [CreateOrderController] (updated live).
  RxDouble totalAmount = 0.0.obs;

  /// All products returned by the backend for the company.
  final RxList<GetProductsModel> products = <GetProductsModel>[].obs;

  /// Products filtered by the current search query.
  final RxList<GetProductsModel> filteredProducts = <GetProductsModel>[].obs;

  /// Current search string.
  final RxString searchQuery = ''.obs;

  /// Loading flag for the entire screen.
  final RxBool isLoading = false.obs;

  /* -------------------------------------------------------------------------- */
  /*                              Cart State                                    */
  /* -------------------------------------------------------------------------- */

  /// Map of product → quantity currently selected.
  final RxMap<GetProductsModel, int> productQuantities =
      <GetProductsModel, int>{}.obs;

  /// Snapshot of quantities when the screen opened (used to detect changes).
  final Map<GetProductsModel, int> _originalQuantities = {};

  /// Snapshot of [companyTotal] on entry (change detection).
  double _originalCompanyTotal = 0.0;

  /* -------------------------------------------------------------------------- */
  /*                              Dependencies                                  */
  /* -------------------------------------------------------------------------- */

  final DatabaseHelper _db = DatabaseHelper();

  final CreateOrderController _createCtrl = Get.find<CreateOrderController>();

  /* -------------------------------------------------------------------------- */
  /*                              Lifecycle Hooks                               */
  /* -------------------------------------------------------------------------- */

  @override
  void onInit() {
    super.onInit();
    _parseArguments();
    _setupSearchListener();
    fetchProducts();
  }

  @override
  void onClose() {
    resetState();
    super.onClose();
  }

  /* -------------------------------------------------------------------------- */
  /*                           Argument Parsing & Reset                         */
  /* -------------------------------------------------------------------------- */

  /// Extracts and validates navigation arguments.
  void _parseArguments() {
    final args = Get.arguments;
    if (args == null || args.length < 2) {
      Get.back();
      return;
    }

    // Company or OrderCompany
    if (args[0] is GetCompaniesModel) {
      company = args[0];
    } else if (args[0] is OrderCompany) {
      orderCompany = args[0];
      company = GetCompaniesModel(
        companyId: orderCompany!.companyId,
        companyLogo: orderCompany!.companyLogo,
        companyName: orderCompany!.companyName,
      );
    } else {
      Get.back();
      return;
    }

    // Grand total reference (Rx or plain double)
    if (args[1] is RxDouble) {
      totalAmount = args[1];
    } else if (args[1] is double) {
      totalAmount.value = args[1];
    }
  }

  /// Resets all state when the screen is disposed.
  void resetState() {
    companyTotal.value = 0.0;
    products.clear();
    filteredProducts.clear();
    productQuantities.clear();
    _originalQuantities.clear();
    _originalCompanyTotal = 0.0;
    searchQuery.value = '';
    isLoading.value = false;
  }

  /* -------------------------------------------------------------------------- */
  /*                              Search Logic                                  */
  /* -------------------------------------------------------------------------- */

  /// Reacts to search query changes.
  void _setupSearchListener() {
    ever(searchQuery, (_) => _applySearchFilter());
  }

  /// Filters products based on [searchQuery].
  void _applySearchFilter() {
    final q = searchQuery.value.trim().toLowerCase();
    if (q.isEmpty) {
      filteredProducts.assignAll(products);
    } else {
      filteredProducts.assignAll(
        products.where(
          (p) => p.productName?.toLowerCase().contains(q) ?? false,
        ),
      );
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                                Data Load                                   */
  /* -------------------------------------------------------------------------- */

  /// Loads products for the current company.
  ///
  /// Pre-fills quantities when editing an existing draft.
  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      products.clear();
      filteredProducts.clear();
      productQuantities.clear();
      _originalQuantities.clear();

      products.assignAll(
        await ProductsRepository.getCompanyProducts(
          company.companyId!.toString(),
        ),
      );

      if (orderCompany != null) {
        for (final ordered in orderCompany!.products) {
          final product = products.firstWhereOrNull(
            (p) => p.productId == ordered.productId,
          );
          if (product != null) {
            productQuantities[product] = ordered.quantity;
            _originalQuantities[product] = ordered.quantity;
          }
        }
        companyTotal.value = orderCompany!.companyTotal;
        _originalCompanyTotal = orderCompany!.companyTotal;
      }

      filteredProducts.assignAll(products);
    } on InvalidAppToken {
      await _reAuthenticateAndRetry();
    } catch (e) {
      debugPrint('Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Re-authenticates and re-fetches products on token expiry.
  Future<void> _reAuthenticateAndRetry() async {
    try {
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
      await fetchProducts();
    } catch (e) {
      debugPrint('Re-authentication failed: $e');
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                         Quantity & Total Updates                           */
  /* -------------------------------------------------------------------------- */

  /// Updates quantity for a product (0 removes it).
  void updateProductQuantity(GetProductsModel product, int quantity) {
    final previousTotal = companyTotal.value;

    if (quantity <= 0) {
      productQuantities.remove(product);
    } else {
      productQuantities[product] = quantity;
    }

    _recalculateCompanyTotal();
    _updateSharedGrandTotal(previousTotal);
  }

  /// Recalculates [companyTotal] from current quantities.
  void _recalculateCompanyTotal() {
    companyTotal.value = productQuantities.entries.fold(
      0.0,
      (sum, e) => sum + (e.key.tradePrice! * e.value),
    );
  }

  /// Adjusts the shared grand total held by [CreateOrderController].
  void _updateSharedGrandTotal(double previousCompanyTotal) {
    totalAmount.value =
        totalAmount.value - previousCompanyTotal + companyTotal.value;
  }

  /* -------------------------------------------------------------------------- */
  /*                           Change Detection                                 */
  /* -------------------------------------------------------------------------- */

  /// `true` if any quantity or company total differs from the initial state.
  bool _hasChanges() {
    if (companyTotal.value != _originalCompanyTotal) return true;
    for (final product in products) {
      final current = productQuantities[product] ?? 0;
      final original = _originalQuantities[product] ?? 0;
      if (current != original) return true;
    }
    return false;
  }

  /* -------------------------------------------------------------------------- */
  /*                           Save / Delete Logic                              */
  /* -------------------------------------------------------------------------- */

  /// Saves the current selection to a local draft order.
  ///
  /// Removes the company completely if no products are selected.
  Future<void> saveOrder() async {
    if (!_hasProductsSelected()) {
      await _removeCompanyFromOrder();
      return;
    }

    if (!_hasChanges()) {
      Get.find<NavbarController>().currentIndex.value = 2;
      Get.offNamed(AppRoutes.navbar);
      return;
    }

    try {
      final orderId = await _upsertOrder();
      await _upsertOrderCompany(orderId);
      await _upsertOrderProducts(orderId);
      await _updateOrderTotals(orderId);
      await _cleanupCatalog();

      await _createCtrl.refreshCreateOrderPageData();
      Get.find<NavbarController>().currentIndex.value = 2;

      Get.offNamed(AppRoutes.navbar);

      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(orderCompany == null ? 'Item added!' : 'Item updated!'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      debugPrint('Error saving order: $e');
      Get.snackbar('Error', 'Failed to save order: $e');
    }
  }

  /// Returns `true` if at least one product has a quantity > 0.
  bool _hasProductsSelected() =>
      productQuantities.entries.any((e) => e.value > 0);

  /* -------------------------------------------------------------------------- */
  /*                    Internal DB Operations (CRUD)                           */
  /* -------------------------------------------------------------------------- */

  /// Creates a new order or returns the existing one.
  Future<String> _upsertOrder() async {
    final existingOrders = await _db.getAllOrders();
    final existing = existingOrders.firstWhereOrNull(
      (o) => o.companies.any((c) => c.companyId == company.companyId),
    );

    if (existing != null) return existing.orderId;

    return await _db.createOrder(
      grandTotal: companyTotal.value,
      totalProducts: productQuantities.length,
    );
  }

  /// Adds or updates the company entry inside the order.
  Future<void> _upsertOrderCompany(String orderId) async {
    final exists = await _db.doesCompanyExistInOrder(
      orderId,
      company.companyId!,
    );

    if (exists) {
      await _db.updateOrderCompany(
        orderId: orderId,
        company: company,
        companyTotal: companyTotal.value,
        totalProducts: productQuantities.length,
      );
      await _db.deleteOrderProducts(orderId, company.companyId!);
    } else {
      await _db.addOrderCompany(
        orderId: orderId,
        company: company,
        companyTotal: companyTotal.value,
        totalProducts: productQuantities.length,
      );
    }
  }

  /// Inserts or updates products for the company inside the order.
  Future<void> _upsertOrderProducts(String orderId) async {
    for (final entry in productQuantities.entries) {
      final product = entry.key;
      final qty = entry.value;

      if (qty > 0) {
        await _db.addOrderProduct(
          orderId: orderId,
          companyId: company.companyId!,
          product: product,
          quantity: qty,
          totalPrice: product.tradePrice! * qty,
        );
      }
    }
  }

  /// Recalculates the entire order’s grand total / product count.
  Future<void> _updateOrderTotals(String orderId) async {
    final companies = await _db.getOrderCompanies(orderId);
    double grandTotal = 0.0;
    int totalProducts = 0;

    for (final c in companies) {
      grandTotal += c['companyTotal'] as double;
      totalProducts += c['totalProducts'] as int;
    }

    await _db.updateOrderTotals(
      orderId: orderId,
      grandTotal: grandTotal,
      totalProducts: totalProducts,
    );
  }

  /// Removes the company from the catalog list (to avoid duplicates).
  Future<void> _cleanupCatalog() async {
    final exists = _createCtrl.companies.any(
      (c) => c.companyId == company.companyId,
    );
    if (exists) {
      await _db.deleteCompanyById(company.companyId!);
    }
  }

  /// Removes the company from any existing order when no products are selected.
  Future<void> _removeCompanyFromOrder() async {
    try {
      Get.find<NavbarController>().currentIndex.value = 0;

      final orders = await _db.getAllOrders();
      final orderWithCompany = orders.firstWhereOrNull(
        (o) => o.companies.any((c) => c.companyId == company.companyId),
      );

      if (orderWithCompany == null) {
        AppToasts.showWarningToast(Get.context!, 'Please add some products');
        return;
      }

      await _db.deleteOrder(orderWithCompany.orderId);

      final remaining = await _db.getOrderCompanies(orderWithCompany.orderId);
      if (remaining.isEmpty) {
        await _db.deleteOrder(orderWithCompany.orderId);
      } else {
        double grandTotal = 0.0;
        int totalProducts = 0;
        for (final c in remaining) {
          grandTotal += c['companyTotal'] as double;
          totalProducts += c['totalProducts'] as int;
        }
        await _db.updateOrderTotals(
          orderId: orderWithCompany.orderId,
          grandTotal: grandTotal,
          totalProducts: totalProducts,
        );
      }

      // Re-add to catalog if missing
      if (!_createCtrl.companies.any((c) => c.companyId == company.companyId)) {
        await _db.insertCompany(company);
      }

      await _createCtrl.refreshCreateOrderPageData();
      Get.find<NavbarController>().currentIndex.value = 2;
      Get.offNamed(AppRoutes.navbar);
    } catch (e) {
      debugPrint('Error handling empty order: $e');
      Get.snackbar('Error', 'Failed to remove item: $e');
    }
  }
}
