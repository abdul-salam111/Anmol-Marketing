import 'package:anmol_marketing/core/barrel.dart';
import 'package:anmol_marketing/core/shared/domain/usecases/usecase.dart';
import 'package:anmol_marketing/features/auth/domain/abstract_repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SigninUserUsecase implements UseCase<GetLoginResponse, LoginUserModel> {
  final AbstractAuthRepository repository;
  SigninUserUsecase({required this.repository});
  @override
  Future<Either<AppException, GetLoginResponse>> call(
    LoginUserModel params,
  ) async {
    return await repository.loginUser(loginUserModel: params);
  }
}
