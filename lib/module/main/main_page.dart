import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_sample/module/auth/User.dart';
import 'package:flutter_redux_sample/module/auth/action.dart';
import 'package:flutter_redux_sample/store/app_state.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StoreConnector<AppState, User>(
                  converter: (store) => store.state.authState.user,
                  builder: (context, user) {
                    return Text(user == null
                        ? "未登录"
                        : "欢迎您：${user.userName}\n${user.saying}");
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: StoreConnector<AppState, VoidCallback>(
            converter: (store) {
              return () {
                store.dispatch(SayAction(store.state.authState.user));
                Future.delayed(
                    Duration(seconds: 1), () => Navigator.pop(context));
              };
            },
            builder: (context, callback) {
              return FloatingActionButton(
                onPressed: callback,
                child: Icon(Icons.add),
              );
            },
          )),
    );
  }
}
