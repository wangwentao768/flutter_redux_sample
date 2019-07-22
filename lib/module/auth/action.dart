import 'User.dart';

class LoginAction {}

class LogoutAction {}

class SayAction {
  User user;

  SayAction(this.user);
}
