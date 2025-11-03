// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetLocationModel _$GetLocationModelFromJson(Map<String, dynamic> json) =>
    _GetLocationModel(
      locationId: (json['LocationId'] as num?)?.toInt(),
      locationName: json['LocationName'] as String?,
    );

Map<String, dynamic> _$GetLocationModelToJson(_GetLocationModel instance) =>
    <String, dynamic>{
      'LocationId': instance.locationId,
      'LocationName': instance.locationName,
    };
