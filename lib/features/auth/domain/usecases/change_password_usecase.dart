
import 'package:fpdart/fpdart.dart';

import '../../../../core/data/exceptions/app_exceptions.dart';
import '../../../../core/shared/domain/usecases/usecase.dart';
import '../../data/models/change_password_request_model.dart';
import '../abstract_repository/auth_repository.dart';

class ChangePasswordUsecase
    implements UseCase<bool, ChangePasswordRequestModel> {
  final AbstractAuthRepository repository;
  ChangePasswordUsecase({required this.repository});
  @override
  Future<Either<AppException, bool>> call(
    ChangePasswordRequestModel params,
  ) async {
    try {
      return await repository.changePassword(changePassword: params);
    } catch (e) {
      return Left(AppException(e.toString()));
    }
  }
}
