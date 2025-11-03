import 'package:anmol_marketing/core/barrel.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AbstractLocationRepository {
  Future<Either<AppException, List<GetLocationModel>>> getRemoteLocations();
}
