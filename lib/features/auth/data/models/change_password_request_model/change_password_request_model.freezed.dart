// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangePasswordRequestModel {

@JsonKey(name: 'Password') String get password;@JsonKey(name: 'ConfirmPassword') String get confirmPassword;@JsonKey(name: 'CustomerId') int get customerId;
/// Create a copy of ChangePasswordRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordRequestModelCopyWith<ChangePasswordRequestModel> get copyWith => _$ChangePasswordRequestModelCopyWithImpl<ChangePasswordRequestModel>(this as ChangePasswordRequestModel, _$identity);

  /// Serializes this ChangePasswordRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordRequestModel&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.customerId, customerId) || other.customerId == customerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,password,confirmPassword,customerId);

@override
String toString() {
  return 'ChangePasswordRequestModel(password: $password, confirmPassword: $confirmPassword, customerId: $customerId)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordRequestModelCopyWith<$Res>  {
  factory $ChangePasswordRequestModelCopyWith(ChangePasswordRequestModel value, $Res Function(ChangePasswordRequestModel) _then) = _$ChangePasswordRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Password') String password,@JsonKey(name: 'ConfirmPassword') String confirmPassword,@JsonKey(name: 'CustomerId') int customerId
});




}
/// @nodoc
class _$ChangePasswordRequestModelCopyWithImpl<$Res>
    implements $ChangePasswordRequestModelCopyWith<$Res> {
  _$ChangePasswordRequestModelCopyWithImpl(this._self, this._then);

  final ChangePasswordRequestModel _self;
  final $Res Function(ChangePasswordRequestModel) _then;

/// Create a copy of ChangePasswordRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? password = null,Object? confirmPassword = null,Object? customerId = null,}) {
  return _then(_self.copyWith(
password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangePasswordRequestModel].
extension ChangePasswordRequestModelPatterns on ChangePasswordRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangePasswordRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangePasswordRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangePasswordRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangePasswordRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Password')  String password, @JsonKey(name: 'ConfirmPassword')  String confirmPassword, @JsonKey(name: 'CustomerId')  int customerId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangePasswordRequestModel() when $default != null:
return $default(_that.password,_that.confirmPassword,_that.customerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Password')  String password, @JsonKey(name: 'ConfirmPassword')  String confirmPassword, @JsonKey(name: 'CustomerId')  int customerId)  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordRequestModel():
return $default(_that.password,_that.confirmPassword,_that.customerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Password')  String password, @JsonKey(name: 'ConfirmPassword')  String confirmPassword, @JsonKey(name: 'CustomerId')  int customerId)?  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordRequestModel() when $default != null:
return $default(_that.password,_that.confirmPassword,_that.customerId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangePasswordRequestModel implements ChangePasswordRequestModel {
  const _ChangePasswordRequestModel({@JsonKey(name: 'Password') required this.password, @JsonKey(name: 'ConfirmPassword') required this.confirmPassword, @JsonKey(name: 'CustomerId') required this.customerId});
  factory _ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) => _$ChangePasswordRequestModelFromJson(json);

@override@JsonKey(name: 'Password') final  String password;
@override@JsonKey(name: 'ConfirmPassword') final  String confirmPassword;
@override@JsonKey(name: 'CustomerId') final  int customerId;

/// Create a copy of ChangePasswordRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordRequestModelCopyWith<_ChangePasswordRequestModel> get copyWith => __$ChangePasswordRequestModelCopyWithImpl<_ChangePasswordRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangePasswordRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePasswordRequestModel&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.customerId, customerId) || other.customerId == customerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,password,confirmPassword,customerId);

@override
String toString() {
  return 'ChangePasswordRequestModel(password: $password, confirmPassword: $confirmPassword, customerId: $customerId)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordRequestModelCopyWith<$Res> implements $ChangePasswordRequestModelCopyWith<$Res> {
  factory _$ChangePasswordRequestModelCopyWith(_ChangePasswordRequestModel value, $Res Function(_ChangePasswordRequestModel) _then) = __$ChangePasswordRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Password') String password,@JsonKey(name: 'ConfirmPassword') String confirmPassword,@JsonKey(name: 'CustomerId') int customerId
});




}
/// @nodoc
class __$ChangePasswordRequestModelCopyWithImpl<$Res>
    implements _$ChangePasswordRequestModelCopyWith<$Res> {
  __$ChangePasswordRequestModelCopyWithImpl(this._self, this._then);

  final _ChangePasswordRequestModel _self;
  final $Res Function(_ChangePasswordRequestModel) _then;

/// Create a copy of ChangePasswordRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? password = null,Object? confirmPassword = null,Object? customerId = null,}) {
  return _then(_ChangePasswordRequestModel(
password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
