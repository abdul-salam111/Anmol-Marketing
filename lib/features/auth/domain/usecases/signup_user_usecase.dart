import 'package:anmol_marketing/core/shared/domain/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/data/exceptions/app_exceptions.dart';
import '../../data/models/get_registration_response.dart';
import '../../data/models/register_user_model.dart';
import '../abstract_repository/auth_repository.dart';

class SignupUserUsecase
    implements UseCase<GetRegistrationResponseModel, RegisterUserModel> {
  final AbstractAuthRepository repository;
  SignupUserUsecase({required this.repository});
  @override
  Future<Either<AppException, GetRegistrationResponseModel>> call(
    RegisterUserModel params,
  ) async {
    try {
      return await repository.signupUser(registerUserModel: params);
    } catch (e) {
      return Left(AppException(e.toString()));
    }
  }
}
