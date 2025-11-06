import 'package:fpdart/fpdart.dart';
import '../../../../core/data/exceptions/app_exceptions.dart';
import '../../../../core/shared/domain/usecases/usecase.dart';
import '../../data/models/get_app_token_model/get_app_token_model.dart';
import '../../data/models/mobile_login_model/mobile_login_model.dart';
import '../abstract_repository/auth_repository.dart';

class GetAppTokenUsecase implements UseCase<GetAppToken, MobileLoginModel> {
  final AbstractAuthRepository repository;
  GetAppTokenUsecase({required this.repository});
  @override
  Future<Either<AppException, GetAppToken>> call(
    MobileLoginModel params,
  ) async {
    return await repository.getAppTokenMethod(mobileLoginModel: params);
  }
}
