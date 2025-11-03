// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetLocationModel {

@JsonKey(name: 'LocationId') int? get locationId;@JsonKey(name: 'LocationName') String? get locationName;
/// Create a copy of GetLocationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetLocationModelCopyWith<GetLocationModel> get copyWith => _$GetLocationModelCopyWithImpl<GetLocationModel>(this as GetLocationModel, _$identity);

  /// Serializes this GetLocationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetLocationModel&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locationId,locationName);

@override
String toString() {
  return 'GetLocationModel(locationId: $locationId, locationName: $locationName)';
}


}

/// @nodoc
abstract mixin class $GetLocationModelCopyWith<$Res>  {
  factory $GetLocationModelCopyWith(GetLocationModel value, $Res Function(GetLocationModel) _then) = _$GetLocationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'LocationId') int? locationId,@JsonKey(name: 'LocationName') String? locationName
});




}
/// @nodoc
class _$GetLocationModelCopyWithImpl<$Res>
    implements $GetLocationModelCopyWith<$Res> {
  _$GetLocationModelCopyWithImpl(this._self, this._then);

  final GetLocationModel _self;
  final $Res Function(GetLocationModel) _then;

/// Create a copy of GetLocationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locationId = freezed,Object? locationName = freezed,}) {
  return _then(_self.copyWith(
locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetLocationModel].
extension GetLocationModelPatterns on GetLocationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetLocationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetLocationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetLocationModel value)  $default,){
final _that = this;
switch (_that) {
case _GetLocationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetLocationModel value)?  $default,){
final _that = this;
switch (_that) {
case _GetLocationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'LocationId')  int? locationId, @JsonKey(name: 'LocationName')  String? locationName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetLocationModel() when $default != null:
return $default(_that.locationId,_that.locationName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'LocationId')  int? locationId, @JsonKey(name: 'LocationName')  String? locationName)  $default,) {final _that = this;
switch (_that) {
case _GetLocationModel():
return $default(_that.locationId,_that.locationName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'LocationId')  int? locationId, @JsonKey(name: 'LocationName')  String? locationName)?  $default,) {final _that = this;
switch (_that) {
case _GetLocationModel() when $default != null:
return $default(_that.locationId,_that.locationName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetLocationModel implements GetLocationModel {
  const _GetLocationModel({@JsonKey(name: 'LocationId') this.locationId, @JsonKey(name: 'LocationName') this.locationName});
  factory _GetLocationModel.fromJson(Map<String, dynamic> json) => _$GetLocationModelFromJson(json);

@override@JsonKey(name: 'LocationId') final  int? locationId;
@override@JsonKey(name: 'LocationName') final  String? locationName;

/// Create a copy of GetLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetLocationModelCopyWith<_GetLocationModel> get copyWith => __$GetLocationModelCopyWithImpl<_GetLocationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetLocationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetLocationModel&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locationId,locationName);

@override
String toString() {
  return 'GetLocationModel(locationId: $locationId, locationName: $locationName)';
}


}

/// @nodoc
abstract mixin class _$GetLocationModelCopyWith<$Res> implements $GetLocationModelCopyWith<$Res> {
  factory _$GetLocationModelCopyWith(_GetLocationModel value, $Res Function(_GetLocationModel) _then) = __$GetLocationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'LocationId') int? locationId,@JsonKey(name: 'LocationName') String? locationName
});




}
/// @nodoc
class __$GetLocationModelCopyWithImpl<$Res>
    implements _$GetLocationModelCopyWith<$Res> {
  __$GetLocationModelCopyWithImpl(this._self, this._then);

  final _GetLocationModel _self;
  final $Res Function(_GetLocationModel) _then;

/// Create a copy of GetLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locationId = freezed,Object? locationName = freezed,}) {
  return _then(_GetLocationModel(
locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Sector {

 String get name; List<Town> get towns;
/// Create a copy of Sector
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectorCopyWith<Sector> get copyWith => _$SectorCopyWithImpl<Sector>(this as Sector, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sector&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.towns, towns));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(towns));

@override
String toString() {
  return 'Sector(name: $name, towns: $towns)';
}


}

/// @nodoc
abstract mixin class $SectorCopyWith<$Res>  {
  factory $SectorCopyWith(Sector value, $Res Function(Sector) _then) = _$SectorCopyWithImpl;
@useResult
$Res call({
 String name, List<Town> towns
});




}
/// @nodoc
class _$SectorCopyWithImpl<$Res>
    implements $SectorCopyWith<$Res> {
  _$SectorCopyWithImpl(this._self, this._then);

  final Sector _self;
  final $Res Function(Sector) _then;

/// Create a copy of Sector
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? towns = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,towns: null == towns ? _self.towns : towns // ignore: cast_nullable_to_non_nullable
as List<Town>,
  ));
}

}


/// Adds pattern-matching-related methods to [Sector].
extension SectorPatterns on Sector {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sector value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sector() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sector value)  $default,){
final _that = this;
switch (_that) {
case _Sector():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sector value)?  $default,){
final _that = this;
switch (_that) {
case _Sector() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<Town> towns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sector() when $default != null:
return $default(_that.name,_that.towns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<Town> towns)  $default,) {final _that = this;
switch (_that) {
case _Sector():
return $default(_that.name,_that.towns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<Town> towns)?  $default,) {final _that = this;
switch (_that) {
case _Sector() when $default != null:
return $default(_that.name,_that.towns);case _:
  return null;

}
}

}

/// @nodoc


class _Sector implements Sector {
  const _Sector({required this.name, required final  List<Town> towns}): _towns = towns;
  

@override final  String name;
 final  List<Town> _towns;
@override List<Town> get towns {
  if (_towns is EqualUnmodifiableListView) return _towns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_towns);
}


/// Create a copy of Sector
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectorCopyWith<_Sector> get copyWith => __$SectorCopyWithImpl<_Sector>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sector&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._towns, _towns));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_towns));

@override
String toString() {
  return 'Sector(name: $name, towns: $towns)';
}


}

/// @nodoc
abstract mixin class _$SectorCopyWith<$Res> implements $SectorCopyWith<$Res> {
  factory _$SectorCopyWith(_Sector value, $Res Function(_Sector) _then) = __$SectorCopyWithImpl;
@override @useResult
$Res call({
 String name, List<Town> towns
});




}
/// @nodoc
class __$SectorCopyWithImpl<$Res>
    implements _$SectorCopyWith<$Res> {
  __$SectorCopyWithImpl(this._self, this._then);

  final _Sector _self;
  final $Res Function(_Sector) _then;

/// Create a copy of Sector
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? towns = null,}) {
  return _then(_Sector(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,towns: null == towns ? _self._towns : towns // ignore: cast_nullable_to_non_nullable
as List<Town>,
  ));
}


}

/// @nodoc
mixin _$Town {

 int get id; String get name;
/// Create a copy of Town
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TownCopyWith<Town> get copyWith => _$TownCopyWithImpl<Town>(this as Town, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Town&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'Town(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $TownCopyWith<$Res>  {
  factory $TownCopyWith(Town value, $Res Function(Town) _then) = _$TownCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$TownCopyWithImpl<$Res>
    implements $TownCopyWith<$Res> {
  _$TownCopyWithImpl(this._self, this._then);

  final Town _self;
  final $Res Function(Town) _then;

/// Create a copy of Town
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Town].
extension TownPatterns on Town {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Town value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Town() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Town value)  $default,){
final _that = this;
switch (_that) {
case _Town():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Town value)?  $default,){
final _that = this;
switch (_that) {
case _Town() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Town() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _Town():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _Town() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _Town implements Town {
  const _Town({required this.id, required this.name});
  

@override final  int id;
@override final  String name;

/// Create a copy of Town
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TownCopyWith<_Town> get copyWith => __$TownCopyWithImpl<_Town>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Town&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'Town(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TownCopyWith<$Res> implements $TownCopyWith<$Res> {
  factory _$TownCopyWith(_Town value, $Res Function(_Town) _then) = __$TownCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$TownCopyWithImpl<$Res>
    implements _$TownCopyWith<$Res> {
  __$TownCopyWithImpl(this._self, this._then);

  final _Town _self;
  final $Res Function(_Town) _then;

/// Create a copy of Town
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_Town(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
