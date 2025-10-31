import 'package:get/get.dart';
import 'phone_verification_controller.dart';

class PhoneVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhoneVerificationController());
  }
}
