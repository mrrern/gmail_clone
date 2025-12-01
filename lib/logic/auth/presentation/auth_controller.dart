import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gmail_clone/logic/auth/model/auth_state.dart';

part 'auth_controller.g.dart';

/// Controller for authentication form state
/// Uses Notifier for synchronous state management
@riverpod
class AuthForm extends _$AuthForm {
  @override
  AuthFormState build() => const AuthFormState();

  /// Updates the name field
  void setName(String name) {
    state = state.copyWith(name: name);
  }

  /// Updates the password field
  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  /// Updates the email field
  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  /// Toggles password visibility
  void togglePasswordVisibility() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  /// Resets the form to initial state
  void reset() {
    state = const AuthFormState();
  }
}
