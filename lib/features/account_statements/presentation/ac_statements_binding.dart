
import 'package:get/get.dart';

import 'account_statements_controller.dart';

class AcStatementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountStatementsController());
  }
}
