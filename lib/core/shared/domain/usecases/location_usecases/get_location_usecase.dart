import 'package:anmol_marketing/core/shared/domain/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../data/exceptions/app_exceptions.dart';
import '../../../data/models/get_location_model/get_location_model.dart';
import '../../repository/location_repository.dart';

class GetLocationUsecase implements UseCase<List<GetLocationModel>, NoParams> {
  final AbstractLocationRepository locationRepository;
  GetLocationUsecase({required this.locationRepository});
  @override
  Future<Either<AppException, List<GetLocationModel>>> call(
    NoParams params,
  ) async {
    return await locationRepository.getRemoteLocations();
  }
}
