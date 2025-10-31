import '../../../../core/barrel.dart';
import '../../../dashboard/presentation/dashboard_controller.dart';
import '../create_orders/create_order_controller.dart';

/// Controller for handling order confirmation and creation
/// Manages cart items, totals, and order submission process
class ConfirmOrderController extends GetxController {
  // Observables
  RxList<OrderCompany> cartItems = <OrderCompany>[].obs;
  final RxInt totalProducts = 0.obs;
  final RxDouble totalAmount = 0.0.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeOrderData();
  }

  /// Initializes order data from navigation arguments
  void _initializeOrderData() {
    cartItems = Get.arguments[0];
    totalAmount.value = Get.arguments[1];
    totalProducts.value = Get.arguments[2];
  }

  /// Creates a new order from cart items
  /// Handles token expiration by attempting reauthentication
  Future<void> createOrder() async {
    try {
      _setLoadingState(true);

      // Prepare product rows for API submission
      final List<ModelRow> productRows = _prepareProductRows();

      // Submit order to API
      final bool isCreated = await OrdersRepository.createOrder(
        CreateOrderModelApi(paymentModeId: 58, rows: productRows),
      );

      // Update related controllers
      await _updateRelatedControllers();

      _setLoadingState(false);

      if (isCreated) {
        showSuccessPopup();
      }
    } on InvalidAppToken {
      // Handle token expiration by reauthenticating and retrying
      await _handleTokenExpiration();
    } catch (error) {
      _setLoadingState(false);
      AppToasts.showErrorToast(Get.context!, error.toString());
    }
  }

  /// Prepares product rows from cart items for API submission
  List<ModelRow> _prepareProductRows() {
    final List<ModelRow> productRows = [];

    for (final OrderCompany company in cartItems) {
      for (final product in company.products) {
        productRows.add(
          ModelRow(
            productId: product.productId,
            price: product.salePrice,
            qty: product.quantity,
          ),
        );
      }
    }

    return productRows;
  }

  /// Handles token expiration by reauthenticating and retrying order creation
  Future<void> _handleTokenExpiration() async {
    try {
      _setLoadingState(true);

      // Reauthenticate user
      final response = await AuthRepository.loginUser(
        LoginUserModel(
          loginId: await storage.readValues(StorageKeys.phoneNumber),
          password: await storage.readValues(StorageKeys.password),
        ),
      );

      // Save new session
      await Future.wait([
        SessionController().saveUserInStorage(response),
        SessionController().getUserfromSharedpref(),
      ]);

      // Retry order creation with same product data
      final List<ModelRow> productRows = _prepareProductRows();

      final bool isCreated = await OrdersRepository.createOrder(
        CreateOrderModelApi(paymentModeId: 58, rows: productRows),
      );

      // Update related controllers
      await _updateRelatedControllers();

      _setLoadingState(false);

      if (isCreated) {
        showSuccessPopup();
      }
    } catch (error) {
      _setLoadingState(false);
      AppToasts.showErrorToast(Get.context!, error.toString());
    }
  }

  /// Updates related controllers after successful order creation
  Future<void> _updateRelatedControllers() async {
    await Get.find<DashboardController>().getLastOrder();
    await Get.find<CreateOrderController>().deleteAllOrder();
  }

  /// Helper method to set loading state
  void _setLoadingState(bool loading) {
    isLoading.value = loading;
  }
}
