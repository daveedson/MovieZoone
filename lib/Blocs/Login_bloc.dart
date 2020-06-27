import 'package:moviezoone/services/auth.dart';
import 'package:moviezoone/services/authFunctions.dart';

class LoginBloc {
  LoginBloc({this.authFunctions});
  final AuthFunctions authFunctions;

  Future<User> logInWithGoogle() async {
    try {
      return await authFunctions.logInWithGoogle();
    } catch (e) {
      rethrow;
    }
  }

  Future<User> loginInWithFacebook() async {
    try {
      return await authFunctions.loginInWithFacebook();
    } catch (e) {
      rethrow;
    }
  }
}
