import 'package:anmol_marketing/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:get/get.dart';
import '../../domain/abstract_repository/auth_repository.dart';
import 'phone_verification_controller.dart';

class PhoneVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VerifyOtpUsecase(repository: Get.find<AbstractAuthRepository>()),
    );
    Get.lazyPut(
      () => PhoneVerificationController(
        verifyOtpUsecase: Get.find<VerifyOtpUsecase>(),
      ),
    );
  }
}
