// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginUserModel {

 String get loginId; String get password;
/// Create a copy of LoginUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginUserModelCopyWith<LoginUserModel> get copyWith => _$LoginUserModelCopyWithImpl<LoginUserModel>(this as LoginUserModel, _$identity);

  /// Serializes this LoginUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginUserModel&&(identical(other.loginId, loginId) || other.loginId == loginId)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,loginId,password);

@override
String toString() {
  return 'LoginUserModel(loginId: $loginId, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginUserModelCopyWith<$Res>  {
  factory $LoginUserModelCopyWith(LoginUserModel value, $Res Function(LoginUserModel) _then) = _$LoginUserModelCopyWithImpl;
@useResult
$Res call({
 String loginId, String password
});




}
/// @nodoc
class _$LoginUserModelCopyWithImpl<$Res>
    implements $LoginUserModelCopyWith<$Res> {
  _$LoginUserModelCopyWithImpl(this._self, this._then);

  final LoginUserModel _self;
  final $Res Function(LoginUserModel) _then;

/// Create a copy of LoginUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loginId = null,Object? password = null,}) {
  return _then(_self.copyWith(
loginId: null == loginId ? _self.loginId : loginId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginUserModel].
extension LoginUserModelPatterns on LoginUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginUserModel value)  $default,){
final _that = this;
switch (_that) {
case _LoginUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoginUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String loginId,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginUserModel() when $default != null:
return $default(_that.loginId,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String loginId,  String password)  $default,) {final _that = this;
switch (_that) {
case _LoginUserModel():
return $default(_that.loginId,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String loginId,  String password)?  $default,) {final _that = this;
switch (_that) {
case _LoginUserModel() when $default != null:
return $default(_that.loginId,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginUserModel implements LoginUserModel {
  const _LoginUserModel({required this.loginId, required this.password});
  factory _LoginUserModel.fromJson(Map<String, dynamic> json) => _$LoginUserModelFromJson(json);

@override final  String loginId;
@override final  String password;

/// Create a copy of LoginUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginUserModelCopyWith<_LoginUserModel> get copyWith => __$LoginUserModelCopyWithImpl<_LoginUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginUserModel&&(identical(other.loginId, loginId) || other.loginId == loginId)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,loginId,password);

@override
String toString() {
  return 'LoginUserModel(loginId: $loginId, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginUserModelCopyWith<$Res> implements $LoginUserModelCopyWith<$Res> {
  factory _$LoginUserModelCopyWith(_LoginUserModel value, $Res Function(_LoginUserModel) _then) = __$LoginUserModelCopyWithImpl;
@override @useResult
$Res call({
 String loginId, String password
});




}
/// @nodoc
class __$LoginUserModelCopyWithImpl<$Res>
    implements _$LoginUserModelCopyWith<$Res> {
  __$LoginUserModelCopyWithImpl(this._self, this._then);

  final _LoginUserModel _self;
  final $Res Function(_LoginUserModel) _then;

/// Create a copy of LoginUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loginId = null,Object? password = null,}) {
  return _then(_LoginUserModel(
loginId: null == loginId ? _self.loginId : loginId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
