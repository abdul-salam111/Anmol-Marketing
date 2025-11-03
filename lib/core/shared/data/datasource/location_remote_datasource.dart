import '../../../constants/api_keys.dart';
import '../../../constants/app_conts.dart';
import '../../../data/network_manager/dio_helper.dart';
import '../../../local_cache/storage.dart';
import '../models/get_location_model/get_location_model.dart';

abstract interface class LocationRemoteDatasource {
  Future<List<GetLocationModel>> getRemoteLocations();
}

class LocationRemoteDatasourceImpl implements LocationRemoteDatasource {
  final DioHelper dioHelper;
  LocationRemoteDatasourceImpl({required this.dioHelper});
  @override
  Future<List<GetLocationModel>> getRemoteLocations() async {
    try {
      final response = await dioHelper.getApi(
        url: ApiKeys.getlocations,
        isAuthRequired: true,
        authToken: await storage.testingToken == 'true'
            ? AppConstants.testingToken
            : await storage.readValues(StorageKeys.appToken),
      );
      if (response is List) {
        return response.map((e) => GetLocationModel.fromJson(e)).toList();
      } else {
        throw Exception("Expected a list but got ${response.runtimeType}");
      }
    } catch (error) {
      rethrow;
    }
  }
}
