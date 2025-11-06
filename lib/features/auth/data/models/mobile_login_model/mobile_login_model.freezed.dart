// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mobile_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MobileLoginModel {

 String? get email; String? get password; int? get tokenExpiry;
/// Create a copy of MobileLoginModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MobileLoginModelCopyWith<MobileLoginModel> get copyWith => _$MobileLoginModelCopyWithImpl<MobileLoginModel>(this as MobileLoginModel, _$identity);

  /// Serializes this MobileLoginModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MobileLoginModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.tokenExpiry, tokenExpiry) || other.tokenExpiry == tokenExpiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,tokenExpiry);

@override
String toString() {
  return 'MobileLoginModel(email: $email, password: $password, tokenExpiry: $tokenExpiry)';
}


}

/// @nodoc
abstract mixin class $MobileLoginModelCopyWith<$Res>  {
  factory $MobileLoginModelCopyWith(MobileLoginModel value, $Res Function(MobileLoginModel) _then) = _$MobileLoginModelCopyWithImpl;
@useResult
$Res call({
 String? email, String? password, int? tokenExpiry
});




}
/// @nodoc
class _$MobileLoginModelCopyWithImpl<$Res>
    implements $MobileLoginModelCopyWith<$Res> {
  _$MobileLoginModelCopyWithImpl(this._self, this._then);

  final MobileLoginModel _self;
  final $Res Function(MobileLoginModel) _then;

/// Create a copy of MobileLoginModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? password = freezed,Object? tokenExpiry = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,tokenExpiry: freezed == tokenExpiry ? _self.tokenExpiry : tokenExpiry // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MobileLoginModel].
extension MobileLoginModelPatterns on MobileLoginModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MobileLoginModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MobileLoginModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MobileLoginModel value)  $default,){
final _that = this;
switch (_that) {
case _MobileLoginModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MobileLoginModel value)?  $default,){
final _that = this;
switch (_that) {
case _MobileLoginModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  String? password,  int? tokenExpiry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MobileLoginModel() when $default != null:
return $default(_that.email,_that.password,_that.tokenExpiry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  String? password,  int? tokenExpiry)  $default,) {final _that = this;
switch (_that) {
case _MobileLoginModel():
return $default(_that.email,_that.password,_that.tokenExpiry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  String? password,  int? tokenExpiry)?  $default,) {final _that = this;
switch (_that) {
case _MobileLoginModel() when $default != null:
return $default(_that.email,_that.password,_that.tokenExpiry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MobileLoginModel implements MobileLoginModel {
  const _MobileLoginModel({this.email = "anmolmobileapp@gmail.com", this.password = "SIsdXbkiLo", this.tokenExpiry = 1000});
  factory _MobileLoginModel.fromJson(Map<String, dynamic> json) => _$MobileLoginModelFromJson(json);

@override@JsonKey() final  String? email;
@override@JsonKey() final  String? password;
@override@JsonKey() final  int? tokenExpiry;

/// Create a copy of MobileLoginModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MobileLoginModelCopyWith<_MobileLoginModel> get copyWith => __$MobileLoginModelCopyWithImpl<_MobileLoginModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MobileLoginModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MobileLoginModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.tokenExpiry, tokenExpiry) || other.tokenExpiry == tokenExpiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,tokenExpiry);

@override
String toString() {
  return 'MobileLoginModel(email: $email, password: $password, tokenExpiry: $tokenExpiry)';
}


}

/// @nodoc
abstract mixin class _$MobileLoginModelCopyWith<$Res> implements $MobileLoginModelCopyWith<$Res> {
  factory _$MobileLoginModelCopyWith(_MobileLoginModel value, $Res Function(_MobileLoginModel) _then) = __$MobileLoginModelCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? password, int? tokenExpiry
});




}
/// @nodoc
class __$MobileLoginModelCopyWithImpl<$Res>
    implements _$MobileLoginModelCopyWith<$Res> {
  __$MobileLoginModelCopyWithImpl(this._self, this._then);

  final _MobileLoginModel _self;
  final $Res Function(_MobileLoginModel) _then;

/// Create a copy of MobileLoginModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? password = freezed,Object? tokenExpiry = freezed,}) {
  return _then(_MobileLoginModel(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,tokenExpiry: freezed == tokenExpiry ? _self.tokenExpiry : tokenExpiry // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
