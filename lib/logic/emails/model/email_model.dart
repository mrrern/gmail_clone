import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_model.freezed.dart';
part 'email_model.g.dart';

@freezed
abstract class EmailModel with _$EmailModel {
  const factory EmailModel({
    required int id,
    String? remitente,
    String? asunto,
    String? message,
    List<String>? images,
    required bool isRead,
    @JsonKey(name: 'fecha') required DateTime date,
  }) = _EmailModel;

  factory EmailModel.fromJson(Map<String, Object?> json) =>
      _$EmailModelFromJson(json);
}
