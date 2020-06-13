import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moviezoone/services/authFunctions.dart';

class User {
  User({@required this.userId});
  final String userId;
}

class Auth implements AuthFunctions {
  // ignore: slash_for_doc_comments
  /**
  what the "_userFromFirebase()"  method does is to convert a Firebase Object,
  into a user object from the user class above,
  which only contains a UID as a property..
  Note: we do this so that we don't want to be creating multiple singleton
 instances in different classes,so for anything that has to do with Firebase instance creation
 all our classes would reference [authFunctions.dart] the abstract class instead.
 */
  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(userId: user.uid);
  }

  //instance of firebase Authentication class..
  final _firebaseAuth = FirebaseAuth.instance;

  //this method gets currentUser..
  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  //this method Sign in using google..
  @override
  Future<User> logInWithGoogle() async {
    //creating an Instance of google sign in class,which allow us to authenticate users *read docs*
    GoogleSignIn googleSignIn = GoogleSignIn();

    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    //condition to check if user is signed in and not null
    if (googleSignInAccount != null) {
      //inside this block we are getting the access token from the googleSign in and sending it to firebase
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      if (googleSignInAuthentication.accessToken != null &&
          googleSignInAuthentication.idToken != null) {
        //now   we have to make a call to firebase authentication to get an authResult
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken),
        );
        return _userFromFirebase(authResult.user);
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Error missing google auth token',
        );
      }
    } else {
      throw PlatformException(
        code: 'Error_Missing_by_User',
        message: 'Sign in Aborted by User',
      );
    }
  }

  //this method signs in with Facebook..
  @override
  Future<User> loginInWithFacebook() async {
    FacebookLogin facebookLogin = FacebookLogin();
    final facebookLoginResult = await facebookLogin.logIn(
      ['public_profile'],
    );
    if (facebookLoginResult.accessToken != null) {
      final authResult = await _firebaseAuth.signInWithCredential(
        FacebookAuthProvider.getCredential(
          accessToken: facebookLoginResult.accessToken.token,
        ),
      );
      return _userFromFirebase(authResult.user);
    } else {
      throw PlatformException(
        code: 'Error_Missing_by_User',
        message: 'Sign in Aborted by User',
      );
    }
  }

  //this method creates a stream of users..
  @override
  Stream<User> get onAuthChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  //this method signs Out the user from the application.
  @override
  Future<void> signOut() async {
    GoogleSignIn googleSignIn = new GoogleSignIn();
    await googleSignIn.signOut();

    FacebookLogin facebookLogin = new FacebookLogin();
    await facebookLogin.logOut();
  }
}
