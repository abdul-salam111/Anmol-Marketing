import 'package:anmol_marketing/core/shared/data/datasource/location_remote_datasource.dart';
import 'package:fpdart/fpdart.dart';
import '../../../data/exceptions/app_exceptions.dart';
import '../../domain/repository/location_repository.dart';
import '../models/get_location_model/get_location_model.dart';

class LocationRepositoryImpl implements AbstractLocationRepository {
  final LocationRemoteDatasource locationRemoteDatasource;
  LocationRepositoryImpl({required this.locationRemoteDatasource});
  @override
  Future<Either<AppException, List<GetLocationModel>>>
  getRemoteLocations() async {
    try {
      return Right(await locationRemoteDatasource.getRemoteLocations());
    } catch (error) {
      return Left(error as AppException);
    }
  }
}
