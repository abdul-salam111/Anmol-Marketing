

import '../../core/barrel.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _initApp();
  }

  SplashServices splashServices = SplashServices();

  _initApp() async {
    await Future.delayed(const Duration(seconds: 1));
    await AppUpdateService.checkForUpdate(immediate: true);
    splashServices.isLoggedIn();
  }
}
