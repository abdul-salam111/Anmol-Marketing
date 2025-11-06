import 'package:anmol_marketing/features/auth/domain/abstract_repository/auth_repository.dart';
import 'package:anmol_marketing/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:anmol_marketing/features/auth/presentation/change_password/change_password_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () =>
          ChangePasswordUsecase(repository: Get.find<AbstractAuthRepository>()),
    );
    Get.lazyPut(
      () => ChangePasswordController(
        changePasswordUsecase: Get.find<ChangePasswordUsecase>(),
      ),
    );
  }
}
