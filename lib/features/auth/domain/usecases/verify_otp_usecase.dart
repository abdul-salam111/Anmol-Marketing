import 'package:anmol_marketing/core/shared/domain/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/data/exceptions/app_exceptions.dart';
import '../../data/models/verify_otp/verify_otp_model.dart';
import '../abstract_repository/auth_repository.dart';

class VerifyOtpUsecase implements UseCase<bool, VerifyOtpModel> {
  final AbstractAuthRepository repository;
  VerifyOtpUsecase({required this.repository});
  @override
  Future<Either<AppException, bool>> call(VerifyOtpModel params) async {
    return await repository.verifyOtp(verifyOtp: params);
  }
}
