
import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfielBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
