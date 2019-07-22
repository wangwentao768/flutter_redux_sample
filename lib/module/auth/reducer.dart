import 'package:flutter_redux_sample/module/auth/action.dart';
import 'package:flutter_redux_sample/module/auth/state.dart';
import 'package:flutter_redux_sample/store/app_state.dart';
import 'package:flutter_redux_sample/util/king_toast.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'User.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, LoginAction>(_login),
  TypedReducer<AuthState, SayAction>(_say),
]);

AuthState _say(AuthState state, SayAction action) {
  KingToast.show("say");
  User user = action.user;
  user.saying = 'Hello World';
  state.user = user;
  return state;
}

AuthState _login(AuthState state, LoginAction action) {
  KingToast.show("login");
  state.user = User(userName: 'k', userPwd: "123456");
  return state;
}

ThunkAction<AppState> loginDelay = (Store<AppState> store) async {
  await new Future.delayed(
    new Duration(seconds: 3),
    () => KingToast.show("ready"),
  );
  store.dispatch(LoginAction());
};
