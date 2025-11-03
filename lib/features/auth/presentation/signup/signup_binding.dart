import 'package:anmol_marketing/core/barrel.dart';
import 'package:anmol_marketing/core/shared/data/datasource/location_remote_datasource.dart';
import 'package:anmol_marketing/core/shared/data/repository/locaton_repo_impl.dart';
import 'package:anmol_marketing/core/shared/domain/usecases/location_usecases/get_location_usecase.dart';
import 'package:anmol_marketing/features/auth/presentation/signup/signup_controller.dart';

import '../../../../core/shared/domain/repository/location_repository.dart';
import '../../domain/abstract_repository/auth_repository.dart';
import '../../domain/usecases/get_app_token_usecase.dart';
import '../../domain/usecases/signup_user_usecase.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationRemoteDatasource>(
      () => LocationRemoteDatasourceImpl(dioHelper: Get.find<DioHelper>()),
    );
    Get.lazyPut<AbstractLocationRepository>(
      () => LocationRepositoryImpl(
        locationRemoteDatasource: Get.find<LocationRemoteDatasource>(),
      ),
    );
    Get.lazyPut(
      () => GetLocationUsecase(
        locationRepository: Get.find<AbstractLocationRepository>(),
      ),
    );
    Get.lazyPut(
      () => GetAppTokenUsecase(repository: Get.find<AbstractAuthRepository>()),
    );
    Get.lazyPut(
      () => SignupUserUsecase(repository: Get.find<AbstractAuthRepository>()),
    );
    Get.lazyPut(
      () => SignupController(
        getLocationUsecase: Get.find<GetLocationUsecase>(),
        getAppTokenUsecase: Get.find<GetAppTokenUsecase>(),
        signupUserUsecase: Get.find<SignupUserUsecase>(),
      ),
    );
  }
}
