// domain/usecases/usecase.dart
import 'package:fpdart/fpdart.dart';
import '../../../data/exceptions/app_exceptions.dart';


abstract class UseCase<Type, Params> {
  Future<Either<AppException, Type>> call(Params params);
}

class NoParams {}
