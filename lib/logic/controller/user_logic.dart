import 'package:hooks_riverpod/legacy.dart';


class FormCustomState{
  final String? email;
  final String? name;
  final String? password;

  FormCustomState({this.email, this.name, this.password});

  FormCustomState copyWith({String? name, String? email, String? password}) {
    return FormCustomState(email: email ?? this.email, name: name ?? this.name, password: password ?? this.password);
  }
  
  
}


class FormNotifier extends StateNotifier<FormCustomState> {
  FormNotifier(super.state);
  
  void setName(String name) {
    state = state.copyWith(name: name);
  }
  
  void setPassword(String password) {
    state = state.copyWith(password: password);
  }
  
  void setEmail(String email) {
    state = state.copyWith(email:email);
  }

 
}

final formProvider = StateNotifierProvider<FormNotifier, FormCustomState>(
  (ref) => FormNotifier(FormCustomState())
);