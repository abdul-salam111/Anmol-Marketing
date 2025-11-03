// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_companies_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetCompaniesModel {

@JsonKey(name: 'CompanyId') int? get companyId;@JsonKey(name: 'CompanyName') String? get companyName;@JsonKey(name: 'CompanyLogo') String? get companyLogo;
/// Create a copy of GetCompaniesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCompaniesModelCopyWith<GetCompaniesModel> get copyWith => _$GetCompaniesModelCopyWithImpl<GetCompaniesModel>(this as GetCompaniesModel, _$identity);

  /// Serializes this GetCompaniesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCompaniesModel&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyLogo, companyLogo) || other.companyLogo == companyLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyId,companyName,companyLogo);

@override
String toString() {
  return 'GetCompaniesModel(companyId: $companyId, companyName: $companyName, companyLogo: $companyLogo)';
}


}

/// @nodoc
abstract mixin class $GetCompaniesModelCopyWith<$Res>  {
  factory $GetCompaniesModelCopyWith(GetCompaniesModel value, $Res Function(GetCompaniesModel) _then) = _$GetCompaniesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'CompanyId') int? companyId,@JsonKey(name: 'CompanyName') String? companyName,@JsonKey(name: 'CompanyLogo') String? companyLogo
});




}
/// @nodoc
class _$GetCompaniesModelCopyWithImpl<$Res>
    implements $GetCompaniesModelCopyWith<$Res> {
  _$GetCompaniesModelCopyWithImpl(this._self, this._then);

  final GetCompaniesModel _self;
  final $Res Function(GetCompaniesModel) _then;

/// Create a copy of GetCompaniesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyId = freezed,Object? companyName = freezed,Object? companyLogo = freezed,}) {
  return _then(_self.copyWith(
companyId: freezed == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyLogo: freezed == companyLogo ? _self.companyLogo : companyLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetCompaniesModel].
extension GetCompaniesModelPatterns on GetCompaniesModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetCompaniesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetCompaniesModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetCompaniesModel value)  $default,){
final _that = this;
switch (_that) {
case _GetCompaniesModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetCompaniesModel value)?  $default,){
final _that = this;
switch (_that) {
case _GetCompaniesModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'CompanyId')  int? companyId, @JsonKey(name: 'CompanyName')  String? companyName, @JsonKey(name: 'CompanyLogo')  String? companyLogo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetCompaniesModel() when $default != null:
return $default(_that.companyId,_that.companyName,_that.companyLogo);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'CompanyId')  int? companyId, @JsonKey(name: 'CompanyName')  String? companyName, @JsonKey(name: 'CompanyLogo')  String? companyLogo)  $default,) {final _that = this;
switch (_that) {
case _GetCompaniesModel():
return $default(_that.companyId,_that.companyName,_that.companyLogo);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'CompanyId')  int? companyId, @JsonKey(name: 'CompanyName')  String? companyName, @JsonKey(name: 'CompanyLogo')  String? companyLogo)?  $default,) {final _that = this;
switch (_that) {
case _GetCompaniesModel() when $default != null:
return $default(_that.companyId,_that.companyName,_that.companyLogo);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _GetCompaniesModel implements GetCompaniesModel {
  const _GetCompaniesModel({@JsonKey(name: 'CompanyId') this.companyId, @JsonKey(name: 'CompanyName') this.companyName, @JsonKey(name: 'CompanyLogo') this.companyLogo});
  factory _GetCompaniesModel.fromJson(Map<String, dynamic> json) => _$GetCompaniesModelFromJson(json);

@override@JsonKey(name: 'CompanyId') final  int? companyId;
@override@JsonKey(name: 'CompanyName') final  String? companyName;
@override@JsonKey(name: 'CompanyLogo') final  String? companyLogo;

/// Create a copy of GetCompaniesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCompaniesModelCopyWith<_GetCompaniesModel> get copyWith => __$GetCompaniesModelCopyWithImpl<_GetCompaniesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetCompaniesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCompaniesModel&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyLogo, companyLogo) || other.companyLogo == companyLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyId,companyName,companyLogo);

@override
String toString() {
  return 'GetCompaniesModel(companyId: $companyId, companyName: $companyName, companyLogo: $companyLogo)';
}


}

/// @nodoc
abstract mixin class _$GetCompaniesModelCopyWith<$Res> implements $GetCompaniesModelCopyWith<$Res> {
  factory _$GetCompaniesModelCopyWith(_GetCompaniesModel value, $Res Function(_GetCompaniesModel) _then) = __$GetCompaniesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'CompanyId') int? companyId,@JsonKey(name: 'CompanyName') String? companyName,@JsonKey(name: 'CompanyLogo') String? companyLogo
});




}
/// @nodoc
class __$GetCompaniesModelCopyWithImpl<$Res>
    implements _$GetCompaniesModelCopyWith<$Res> {
  __$GetCompaniesModelCopyWithImpl(this._self, this._then);

  final _GetCompaniesModel _self;
  final $Res Function(_GetCompaniesModel) _then;

/// Create a copy of GetCompaniesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyId = freezed,Object? companyName = freezed,Object? companyLogo = freezed,}) {
  return _then(_GetCompaniesModel(
companyId: freezed == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyLogo: freezed == companyLogo ? _self.companyLogo : companyLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
