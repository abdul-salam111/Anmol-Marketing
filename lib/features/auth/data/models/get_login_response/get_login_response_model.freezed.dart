// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_login_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetLoginResponse {

@JsonKey(name: 'Customer') Customer? get customer;@JsonKey(name: 'AuthToken') AuthToken? get authToken;
/// Create a copy of GetLoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetLoginResponseCopyWith<GetLoginResponse> get copyWith => _$GetLoginResponseCopyWithImpl<GetLoginResponse>(this as GetLoginResponse, _$identity);

  /// Serializes this GetLoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetLoginResponse&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.authToken, authToken) || other.authToken == authToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customer,authToken);

@override
String toString() {
  return 'GetLoginResponse(customer: $customer, authToken: $authToken)';
}


}

/// @nodoc
abstract mixin class $GetLoginResponseCopyWith<$Res>  {
  factory $GetLoginResponseCopyWith(GetLoginResponse value, $Res Function(GetLoginResponse) _then) = _$GetLoginResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Customer') Customer? customer,@JsonKey(name: 'AuthToken') AuthToken? authToken
});


$CustomerCopyWith<$Res>? get customer;$AuthTokenCopyWith<$Res>? get authToken;

}
/// @nodoc
class _$GetLoginResponseCopyWithImpl<$Res>
    implements $GetLoginResponseCopyWith<$Res> {
  _$GetLoginResponseCopyWithImpl(this._self, this._then);

  final GetLoginResponse _self;
  final $Res Function(GetLoginResponse) _then;

/// Create a copy of GetLoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customer = freezed,Object? authToken = freezed,}) {
  return _then(_self.copyWith(
customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as Customer?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as AuthToken?,
  ));
}
/// Create a copy of GetLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of GetLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokenCopyWith<$Res>? get authToken {
    if (_self.authToken == null) {
    return null;
  }

  return $AuthTokenCopyWith<$Res>(_self.authToken!, (value) {
    return _then(_self.copyWith(authToken: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetLoginResponse].
extension GetLoginResponsePatterns on GetLoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetLoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetLoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetLoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetLoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetLoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetLoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Customer')  Customer? customer, @JsonKey(name: 'AuthToken')  AuthToken? authToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetLoginResponse() when $default != null:
return $default(_that.customer,_that.authToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Customer')  Customer? customer, @JsonKey(name: 'AuthToken')  AuthToken? authToken)  $default,) {final _that = this;
switch (_that) {
case _GetLoginResponse():
return $default(_that.customer,_that.authToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Customer')  Customer? customer, @JsonKey(name: 'AuthToken')  AuthToken? authToken)?  $default,) {final _that = this;
switch (_that) {
case _GetLoginResponse() when $default != null:
return $default(_that.customer,_that.authToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetLoginResponse implements GetLoginResponse {
  const _GetLoginResponse({@JsonKey(name: 'Customer') this.customer, @JsonKey(name: 'AuthToken') this.authToken});
  factory _GetLoginResponse.fromJson(Map<String, dynamic> json) => _$GetLoginResponseFromJson(json);

@override@JsonKey(name: 'Customer') final  Customer? customer;
@override@JsonKey(name: 'AuthToken') final  AuthToken? authToken;

/// Create a copy of GetLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetLoginResponseCopyWith<_GetLoginResponse> get copyWith => __$GetLoginResponseCopyWithImpl<_GetLoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetLoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetLoginResponse&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.authToken, authToken) || other.authToken == authToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customer,authToken);

@override
String toString() {
  return 'GetLoginResponse(customer: $customer, authToken: $authToken)';
}


}

/// @nodoc
abstract mixin class _$GetLoginResponseCopyWith<$Res> implements $GetLoginResponseCopyWith<$Res> {
  factory _$GetLoginResponseCopyWith(_GetLoginResponse value, $Res Function(_GetLoginResponse) _then) = __$GetLoginResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Customer') Customer? customer,@JsonKey(name: 'AuthToken') AuthToken? authToken
});


@override $CustomerCopyWith<$Res>? get customer;@override $AuthTokenCopyWith<$Res>? get authToken;

}
/// @nodoc
class __$GetLoginResponseCopyWithImpl<$Res>
    implements _$GetLoginResponseCopyWith<$Res> {
  __$GetLoginResponseCopyWithImpl(this._self, this._then);

  final _GetLoginResponse _self;
  final $Res Function(_GetLoginResponse) _then;

/// Create a copy of GetLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customer = freezed,Object? authToken = freezed,}) {
  return _then(_GetLoginResponse(
customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as Customer?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as AuthToken?,
  ));
}

/// Create a copy of GetLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of GetLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokenCopyWith<$Res>? get authToken {
    if (_self.authToken == null) {
    return null;
  }

  return $AuthTokenCopyWith<$Res>(_self.authToken!, (value) {
    return _then(_self.copyWith(authToken: value));
  });
}
}


/// @nodoc
mixin _$AuthToken {

@JsonKey(name: 'AccessToken') String? get accessToken;@JsonKey(name: 'Expiration') DateTime? get expiration;@JsonKey(name: 'RefreshToken') String? get refreshToken;
/// Create a copy of AuthToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthTokenCopyWith<AuthToken> get copyWith => _$AuthTokenCopyWithImpl<AuthToken>(this as AuthToken, _$identity);

  /// Serializes this AuthToken to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthToken&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiration, expiration) || other.expiration == expiration)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,expiration,refreshToken);

@override
String toString() {
  return 'AuthToken(accessToken: $accessToken, expiration: $expiration, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $AuthTokenCopyWith<$Res>  {
  factory $AuthTokenCopyWith(AuthToken value, $Res Function(AuthToken) _then) = _$AuthTokenCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'AccessToken') String? accessToken,@JsonKey(name: 'Expiration') DateTime? expiration,@JsonKey(name: 'RefreshToken') String? refreshToken
});




}
/// @nodoc
class _$AuthTokenCopyWithImpl<$Res>
    implements $AuthTokenCopyWith<$Res> {
  _$AuthTokenCopyWithImpl(this._self, this._then);

  final AuthToken _self;
  final $Res Function(AuthToken) _then;

/// Create a copy of AuthToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = freezed,Object? expiration = freezed,Object? refreshToken = freezed,}) {
  return _then(_self.copyWith(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,expiration: freezed == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as DateTime?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthToken].
extension AuthTokenPatterns on AuthToken {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthToken value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthToken() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthToken value)  $default,){
final _that = this;
switch (_that) {
case _AuthToken():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthToken value)?  $default,){
final _that = this;
switch (_that) {
case _AuthToken() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'AccessToken')  String? accessToken, @JsonKey(name: 'Expiration')  DateTime? expiration, @JsonKey(name: 'RefreshToken')  String? refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthToken() when $default != null:
return $default(_that.accessToken,_that.expiration,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'AccessToken')  String? accessToken, @JsonKey(name: 'Expiration')  DateTime? expiration, @JsonKey(name: 'RefreshToken')  String? refreshToken)  $default,) {final _that = this;
switch (_that) {
case _AuthToken():
return $default(_that.accessToken,_that.expiration,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'AccessToken')  String? accessToken, @JsonKey(name: 'Expiration')  DateTime? expiration, @JsonKey(name: 'RefreshToken')  String? refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _AuthToken() when $default != null:
return $default(_that.accessToken,_that.expiration,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthToken implements AuthToken {
  const _AuthToken({@JsonKey(name: 'AccessToken') this.accessToken, @JsonKey(name: 'Expiration') this.expiration, @JsonKey(name: 'RefreshToken') this.refreshToken});
  factory _AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);

@override@JsonKey(name: 'AccessToken') final  String? accessToken;
@override@JsonKey(name: 'Expiration') final  DateTime? expiration;
@override@JsonKey(name: 'RefreshToken') final  String? refreshToken;

/// Create a copy of AuthToken
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthTokenCopyWith<_AuthToken> get copyWith => __$AuthTokenCopyWithImpl<_AuthToken>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthTokenToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthToken&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiration, expiration) || other.expiration == expiration)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,expiration,refreshToken);

@override
String toString() {
  return 'AuthToken(accessToken: $accessToken, expiration: $expiration, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$AuthTokenCopyWith<$Res> implements $AuthTokenCopyWith<$Res> {
  factory _$AuthTokenCopyWith(_AuthToken value, $Res Function(_AuthToken) _then) = __$AuthTokenCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'AccessToken') String? accessToken,@JsonKey(name: 'Expiration') DateTime? expiration,@JsonKey(name: 'RefreshToken') String? refreshToken
});




}
/// @nodoc
class __$AuthTokenCopyWithImpl<$Res>
    implements _$AuthTokenCopyWith<$Res> {
  __$AuthTokenCopyWithImpl(this._self, this._then);

  final _AuthToken _self;
  final $Res Function(_AuthToken) _then;

/// Create a copy of AuthToken
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = freezed,Object? expiration = freezed,Object? refreshToken = freezed,}) {
  return _then(_AuthToken(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,expiration: freezed == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as DateTime?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Customer {

@JsonKey(name: 'CustomerId') int? get customerId;@JsonKey(name: 'CustomerName') String? get customerName;@JsonKey(name: 'LocationId') int? get locationId;@JsonKey(name: 'LocationName') String? get locationName;@JsonKey(name: 'Balance') double? get balance;@JsonKey(name: 'Logo') String? get logo;
/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCopyWith<Customer> get copyWith => _$CustomerCopyWithImpl<Customer>(this as Customer, _$identity);

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Customer&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.logo, logo) || other.logo == logo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,customerName,locationId,locationName,balance,logo);

@override
String toString() {
  return 'Customer(customerId: $customerId, customerName: $customerName, locationId: $locationId, locationName: $locationName, balance: $balance, logo: $logo)';
}


}

/// @nodoc
abstract mixin class $CustomerCopyWith<$Res>  {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) _then) = _$CustomerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'CustomerId') int? customerId,@JsonKey(name: 'CustomerName') String? customerName,@JsonKey(name: 'LocationId') int? locationId,@JsonKey(name: 'LocationName') String? locationName,@JsonKey(name: 'Balance') double? balance,@JsonKey(name: 'Logo') String? logo
});




}
/// @nodoc
class _$CustomerCopyWithImpl<$Res>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._self, this._then);

  final Customer _self;
  final $Res Function(Customer) _then;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerId = freezed,Object? customerName = freezed,Object? locationId = freezed,Object? locationName = freezed,Object? balance = freezed,Object? logo = freezed,}) {
  return _then(_self.copyWith(
customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Customer].
extension CustomerPatterns on Customer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Customer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Customer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Customer value)  $default,){
final _that = this;
switch (_that) {
case _Customer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Customer value)?  $default,){
final _that = this;
switch (_that) {
case _Customer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'CustomerId')  int? customerId, @JsonKey(name: 'CustomerName')  String? customerName, @JsonKey(name: 'LocationId')  int? locationId, @JsonKey(name: 'LocationName')  String? locationName, @JsonKey(name: 'Balance')  double? balance, @JsonKey(name: 'Logo')  String? logo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.customerId,_that.customerName,_that.locationId,_that.locationName,_that.balance,_that.logo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'CustomerId')  int? customerId, @JsonKey(name: 'CustomerName')  String? customerName, @JsonKey(name: 'LocationId')  int? locationId, @JsonKey(name: 'LocationName')  String? locationName, @JsonKey(name: 'Balance')  double? balance, @JsonKey(name: 'Logo')  String? logo)  $default,) {final _that = this;
switch (_that) {
case _Customer():
return $default(_that.customerId,_that.customerName,_that.locationId,_that.locationName,_that.balance,_that.logo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'CustomerId')  int? customerId, @JsonKey(name: 'CustomerName')  String? customerName, @JsonKey(name: 'LocationId')  int? locationId, @JsonKey(name: 'LocationName')  String? locationName, @JsonKey(name: 'Balance')  double? balance, @JsonKey(name: 'Logo')  String? logo)?  $default,) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.customerId,_that.customerName,_that.locationId,_that.locationName,_that.balance,_that.logo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Customer implements Customer {
  const _Customer({@JsonKey(name: 'CustomerId') this.customerId, @JsonKey(name: 'CustomerName') this.customerName, @JsonKey(name: 'LocationId') this.locationId, @JsonKey(name: 'LocationName') this.locationName, @JsonKey(name: 'Balance') this.balance, @JsonKey(name: 'Logo') this.logo});
  factory _Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

@override@JsonKey(name: 'CustomerId') final  int? customerId;
@override@JsonKey(name: 'CustomerName') final  String? customerName;
@override@JsonKey(name: 'LocationId') final  int? locationId;
@override@JsonKey(name: 'LocationName') final  String? locationName;
@override@JsonKey(name: 'Balance') final  double? balance;
@override@JsonKey(name: 'Logo') final  String? logo;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerCopyWith<_Customer> get copyWith => __$CustomerCopyWithImpl<_Customer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Customer&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.logo, logo) || other.logo == logo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,customerName,locationId,locationName,balance,logo);

@override
String toString() {
  return 'Customer(customerId: $customerId, customerName: $customerName, locationId: $locationId, locationName: $locationName, balance: $balance, logo: $logo)';
}


}

/// @nodoc
abstract mixin class _$CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$CustomerCopyWith(_Customer value, $Res Function(_Customer) _then) = __$CustomerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'CustomerId') int? customerId,@JsonKey(name: 'CustomerName') String? customerName,@JsonKey(name: 'LocationId') int? locationId,@JsonKey(name: 'LocationName') String? locationName,@JsonKey(name: 'Balance') double? balance,@JsonKey(name: 'Logo') String? logo
});




}
/// @nodoc
class __$CustomerCopyWithImpl<$Res>
    implements _$CustomerCopyWith<$Res> {
  __$CustomerCopyWithImpl(this._self, this._then);

  final _Customer _self;
  final $Res Function(_Customer) _then;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerId = freezed,Object? customerName = freezed,Object? locationId = freezed,Object? locationName = freezed,Object? balance = freezed,Object? logo = freezed,}) {
  return _then(_Customer(
customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
