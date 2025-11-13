// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmailModel _$EmailModelFromJson(Map<String, dynamic> json) => _EmailModel(
  id: (json['id'] as num).toInt(),
  asunto: json['asunto'] as String?,
  message: json['message'] as String,
  image: json['image'] as String?,
);

Map<String, dynamic> _$EmailModelToJson(_EmailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'asunto': instance.asunto,
      'message': instance.message,
      'image': instance.image,
    };
