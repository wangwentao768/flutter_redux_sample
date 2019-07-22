import 'User.dart';

class AuthState {
  User user;

  AuthState({this.user});

  factory AuthState.initial() {
    return AuthState();
  }
}
