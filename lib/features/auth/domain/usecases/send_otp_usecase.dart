import 'package:anmol_marketing/core/shared/domain/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/data/exceptions/app_exceptions.dart';
import '../abstract_repository/auth_repository.dart';

class SendOtpUsecase implements UseCase<dynamic, String> {
  final AbstractAuthRepository repository;
  SendOtpUsecase({required this.repository});
  @override
  Future<Either<AppException, dynamic>> call(String params) async {
    try {
      return await repository.sendOtp(mobile: params);
    } catch (e) {
      return Left(AppException(e.toString()));
    }
  }
}
