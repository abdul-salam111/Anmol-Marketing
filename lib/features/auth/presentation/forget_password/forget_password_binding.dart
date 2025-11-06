import 'package:anmol_marketing/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:get/get.dart';
import '../../domain/abstract_repository/auth_repository.dart';
import 'forget_password_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SendOtpUsecase(repository: Get.find<AbstractAuthRepository>()),
    );
    Get.lazyPut(
      () =>
          ForgetPasswordController(sendOtpUsecase: Get.find<SendOtpUsecase>()),
    );
  }
}
