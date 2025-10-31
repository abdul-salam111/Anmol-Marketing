
import 'package:get/get.dart';

import '../../../orders/presentation/create_orders/create_order_controller.dart';
import 'select_Product_controller.dart';

class SelectProductBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => SelectProductController(), fenix: true);
    Get.lazyPut(() => CreateOrderController());
  }
}
