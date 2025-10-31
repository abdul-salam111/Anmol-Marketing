import 'package:get/get.dart';
import '../selecte_products/select_Product_controller.dart';
import 'view_products_controller.dart';

class ViewProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewProductsController());
    Get.lazyPut(() => SelectProductController());
  }
}
