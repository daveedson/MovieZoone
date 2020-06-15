import 'package:moviezoone/services/auth.dart';

abstract class AuthFunctions {
  Future<User> currentUser();
  Future<User> logInWithGoogle();
  Future<User> loginInWithFacebook();
  Future<void> signOut();
  Stream<User> get onAuthChanged;
  Future<User> signInWithEmailAndPassword(String email, password);
}
