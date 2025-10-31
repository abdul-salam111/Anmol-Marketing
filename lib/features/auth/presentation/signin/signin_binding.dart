import 'package:anmol_marketing/core/barrel.dart';
import 'package:anmol_marketing/features/auth/data/remote_datasource/auth_remote_datasource/auth_remote_datasource.dart';
import 'package:anmol_marketing/features/auth/domain/abstract_repository/auth_repository.dart';
import 'package:anmol_marketing/features/auth/domain/usecases/get_app_token_usecase.dart';
import 'package:anmol_marketing/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:anmol_marketing/features/auth/domain/usecases/signin_user_usecase.dart';
import '../../data/repository_impl/auth_repository_impl.dart';
import 'signin_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(dioHeloper: Get.find<DioHelper>()),
      fenix: true,
    );
    Get.lazyPut<AbstractAuthRepository>(
      () => AuthRepositoryImpl(
        authRemoteDataSource: Get.find<AuthRemoteDataSource>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => SigninUserUsecase(repository: Get.find<AbstractAuthRepository>()),
    );
    Get.lazyPut(
      () => GetAppTokenUsecase(repository: Get.find<AbstractAuthRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => SendOtpUsecase(repository: Get.find<AbstractAuthRepository>()),
    );
    Get.lazyPut(
      () => SignInController(
        signinUserUsecase: Get.find<SigninUserUsecase>(),
        getAppTokenUsecase: Get.find<GetAppTokenUsecase>(),
        sendOtpUsecase: Get.find<SendOtpUsecase>(),
      ),
    );
  }
}
