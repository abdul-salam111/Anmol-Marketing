import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_location_model.freezed.dart';
part 'get_location_model.g.dart';

@freezed
abstract class GetLocationModel with _$GetLocationModel {
  const factory GetLocationModel({
    @JsonKey(name: 'LocationId') int? locationId,
    @JsonKey(name: 'LocationName') String? locationName,
  }) = _GetLocationModel;

  factory GetLocationModel.fromJson(Map<String, dynamic> json) =>
      _$GetLocationModelFromJson(json);
}

@freezed
abstract class Sector with _$Sector {
  const factory Sector({
    required String name,
    required List<Town> towns,
  }) = _Sector;
}

@freezed
abstract class Town with _$Town {
  const factory Town({
    required int id,
    required String name,
  }) = _Town;
}

List<Sector> buildSectorsFromJson(List<GetLocationModel> data) {
  final Map<String, List<Town>> sectorMap = {};

  for (var item in data) {
    final locationName = item.locationName;
    final locationId = item.locationId;

    if (locationName != null && locationName.contains('->')) {
      final parts = locationName.split('->');
      final sector = parts[0];
      final town = parts[1];

      sectorMap.putIfAbsent(sector, () => []);
      sectorMap[sector]!.add(Town(id: locationId!, name: town));
    }
  }

  return sectorMap.entries
      .map((entry) => Sector(name: entry.key, towns: entry.value))
      .toList();
}
