import 'package:flutter_redux_sample/module/auth/reducer.dart';

import 'app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(authState: authReducer(state.authState, action));
}
