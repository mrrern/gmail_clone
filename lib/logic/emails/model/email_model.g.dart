// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmailModel _$EmailModelFromJson(Map<String, dynamic> json) => _EmailModel(
  id: (json['id'] as num).toInt(),
  remitente: json['remitente'] as String?,
  asunto: json['asunto'] as String?,
  message: json['message'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  isRead: json['isRead'] as bool,
  date: DateTime.parse(json['fecha'] as String),
);

Map<String, dynamic> _$EmailModelToJson(_EmailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remitente': instance.remitente,
      'asunto': instance.asunto,
      'message': instance.message,
      'images': instance.images,
      'isRead': instance.isRead,
      'fecha': instance.date.toIso8601String(),
    };
