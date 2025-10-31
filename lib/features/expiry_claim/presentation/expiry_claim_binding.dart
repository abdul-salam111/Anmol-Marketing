
import 'package:get/get.dart';

import 'expiry_claim_controller.dart';

class ExpiryClaimBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpiryClaimController());
  }
}
