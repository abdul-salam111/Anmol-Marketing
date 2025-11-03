import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_companies_model.freezed.dart';
part 'get_companies_model.g.dart';

@freezed
abstract class GetCompaniesModel with _$GetCompaniesModel {
  @JsonSerializable()
  const factory GetCompaniesModel({
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'CompanyName') String? companyName,
    @JsonKey(name: 'CompanyLogo') String? companyLogo,
  }) = _GetCompaniesModel;

  factory GetCompaniesModel.fromJson(Map<String, dynamic> json) =>
      _$GetCompaniesModelFromJson(json);
}
