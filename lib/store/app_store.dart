import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'app_reducer.dart';
import 'app_state.dart';

Store<AppState> createStore() {
  return Store(appReducer, initialState: AppState.initial(), middleware: [
    // 引入 thunk action 的中间件
    thunkMiddleware
  ]);
}
