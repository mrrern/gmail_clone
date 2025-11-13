// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmailModel {

 int get id; String? get asunto; String get message; String? get image;
/// Create a copy of EmailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailModelCopyWith<EmailModel> get copyWith => _$EmailModelCopyWithImpl<EmailModel>(this as EmailModel, _$identity);

  /// Serializes this EmailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.asunto, asunto) || other.asunto == asunto)&&(identical(other.message, message) || other.message == message)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,asunto,message,image);

@override
String toString() {
  return 'EmailModel(id: $id, asunto: $asunto, message: $message, image: $image)';
}


}

/// @nodoc
abstract mixin class $EmailModelCopyWith<$Res>  {
  factory $EmailModelCopyWith(EmailModel value, $Res Function(EmailModel) _then) = _$EmailModelCopyWithImpl;
@useResult
$Res call({
 int id, String? asunto, String message, String? image
});




}
/// @nodoc
class _$EmailModelCopyWithImpl<$Res>
    implements $EmailModelCopyWith<$Res> {
  _$EmailModelCopyWithImpl(this._self, this._then);

  final EmailModel _self;
  final $Res Function(EmailModel) _then;

/// Create a copy of EmailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? asunto = freezed,Object? message = null,Object? image = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,asunto: freezed == asunto ? _self.asunto : asunto // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailModel].
extension EmailModelPatterns on EmailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailModel value)  $default,){
final _that = this;
switch (_that) {
case _EmailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailModel value)?  $default,){
final _that = this;
switch (_that) {
case _EmailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? asunto,  String message,  String? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailModel() when $default != null:
return $default(_that.id,_that.asunto,_that.message,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? asunto,  String message,  String? image)  $default,) {final _that = this;
switch (_that) {
case _EmailModel():
return $default(_that.id,_that.asunto,_that.message,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? asunto,  String message,  String? image)?  $default,) {final _that = this;
switch (_that) {
case _EmailModel() when $default != null:
return $default(_that.id,_that.asunto,_that.message,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailModel implements EmailModel {
  const _EmailModel({required this.id, this.asunto, required this.message, this.image});
  factory _EmailModel.fromJson(Map<String, dynamic> json) => _$EmailModelFromJson(json);

@override final  int id;
@override final  String? asunto;
@override final  String message;
@override final  String? image;

/// Create a copy of EmailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailModelCopyWith<_EmailModel> get copyWith => __$EmailModelCopyWithImpl<_EmailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.asunto, asunto) || other.asunto == asunto)&&(identical(other.message, message) || other.message == message)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,asunto,message,image);

@override
String toString() {
  return 'EmailModel(id: $id, asunto: $asunto, message: $message, image: $image)';
}


}

/// @nodoc
abstract mixin class _$EmailModelCopyWith<$Res> implements $EmailModelCopyWith<$Res> {
  factory _$EmailModelCopyWith(_EmailModel value, $Res Function(_EmailModel) _then) = __$EmailModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String? asunto, String message, String? image
});




}
/// @nodoc
class __$EmailModelCopyWithImpl<$Res>
    implements _$EmailModelCopyWith<$Res> {
  __$EmailModelCopyWithImpl(this._self, this._then);

  final _EmailModel _self;
  final $Res Function(_EmailModel) _then;

/// Create a copy of EmailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? asunto = freezed,Object? message = null,Object? image = freezed,}) {
  return _then(_EmailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,asunto: freezed == asunto ? _self.asunto : asunto // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
