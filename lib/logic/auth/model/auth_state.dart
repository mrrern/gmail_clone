import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

/// State for authentication form
@freezed
class AuthFormState with _$AuthFormState {
  const factory AuthFormState({
    @Default('') String email,
    @Default('') String name,
    @Default('') String password,
    @Default(true) bool obscurePassword,
  }) = _AuthFormState;
}
