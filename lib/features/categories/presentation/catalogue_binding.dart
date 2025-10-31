
import 'package:get/get.dart';

import 'catalogue_controller.dart';

class CatalogueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CatalogueController());
  }
}
