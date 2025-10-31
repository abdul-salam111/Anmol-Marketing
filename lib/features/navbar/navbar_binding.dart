import 'package:get/get.dart';
import '../categories/presentation/catalogue_controller.dart';
import '../dashboard/presentation/dashboard_controller.dart';
import '../orders/presentation/booked_orders/order_history_controller.dart';
import '../orders/presentation/create_orders/create_order_controller.dart';
import '../profile/presentation/profile_controller.dart';
import 'navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavbarController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => CatalogueController());
    Get.lazyPut(() => CreateOrderController());
    Get.lazyPut(() => OrderHistoryController());
    Get.lazyPut(() => ProfileController());
  }
}
