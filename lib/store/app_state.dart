import 'package:flutter_redux_sample/module/auth/state.dart';

class AppState {
  final AuthState authState;

  AppState({this.authState});

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
    );
  }
}
