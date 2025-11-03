// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_companies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetCompaniesModel _$GetCompaniesModelFromJson(Map<String, dynamic> json) =>
    _GetCompaniesModel(
      companyId: (json['CompanyId'] as num?)?.toInt(),
      companyName: json['CompanyName'] as String?,
      companyLogo: json['CompanyLogo'] as String?,
    );

Map<String, dynamic> _$GetCompaniesModelToJson(_GetCompaniesModel instance) =>
    <String, dynamic>{
      'CompanyId': instance.companyId,
      'CompanyName': instance.companyName,
      'CompanyLogo': instance.companyLogo,
    };
