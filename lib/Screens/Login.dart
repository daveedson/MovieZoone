import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:moviezoone/Blocs/Login_bloc.dart';
import 'package:moviezoone/Screens/RegistrationScreen.dart';
import 'package:moviezoone/services/authFunctions.dart';
import 'package:moviezoone/widgets/PlatformAlertDialogs.dart';
import 'package:provider/provider.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthFunctions>(context, listen: false);
    return Provider<LoginBloc>(
      create: (context) => LoginBloc(authFunctions: auth),
      child: LoginScreen(),
    );
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text.toString();

  String get _password => _passwordController.text.toString();

  bool _isLoadingState = false;

  //this method signs in with Google
  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoadingState = true;
    });
    final bloc = Provider.of<LoginBloc>(context, listen: false);
    try {
      await bloc.logInWithGoogle();
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        _isLoadingState = false;
      });
    }
  }

  //this method signs in with facebook
  Future<void> _signInWithFacebook() async {
    setState(() {
      _isLoadingState = true;
    });
    final bloc = Provider.of<LoginBloc>(context, listen: false);
    try {
      await bloc.loginInWithFacebook();
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        _isLoadingState = false;
      });
    }
  }

  //this method signs in with email and password
  void _signInWithEmailAndPassword() async {
    setState(() {
      _isLoadingState = true;
    });
    final authFunctions = Provider.of<AuthFunctions>(context, listen: false);
    try {
      await authFunctions.signInWithEmailAndPassword(_email, _password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on PlatformException catch (e) {
      print(e.toString());
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return PlatFormAlertDialogs(
              title: 'Sign In Failed',
              content: e.message,
              textAction: 'OK',
              onPressed: () => Navigator.pop(context),
            );
          });
    } finally {
      setState(() {
        _isLoadingState = false;
      });
    }
  }

  void _emailEditComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        color: Colors.blueGrey,
        inAsyncCall: _isLoadingState,
        child: Form(
          key: _formKey,
          child: Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.4,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'images/mvp.png',
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
              Container(
                // padding: EdgeInsets.symmetric(vertical: 153.0),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'MovieZoone',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 42.0,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(
                        height: 100.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: TextFormField(
                          onEditingComplete: _emailEditComplete,
                          focusNode: _emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (email) {
                            if (email.isEmpty) {
                              return "You can't have an empty email !,";
                            }
                            if (email.length < 5) {
                              return "Email must have nothing less than 5characters ";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.white12,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            filled: true,
                            fillColor: Color(0xff576F93),
                            suffixIcon: Icon(
                              Icons.email,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: TextFormField(
                          onEditingComplete: _signInWithEmailAndPassword,
                          focusNode: _passwordFocusNode,
                          autocorrect: false,
                          controller: _passwordController,
                          obscureText: true,
                          cursorColor: Colors.white12,
                          validator: (password) {
                            if (password.isEmpty) {
                              return "You can't have and empty password !";
                            }
                            if (password.length < 6) {
                              return "Password can't be less than 6";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Password',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                              filled: true,
                              fillColor: Color(0xff576F93),
                              suffixIcon: Icon(
                                Icons.lock,
                                size: 20.0,
                                color: Colors.white,
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                    color: Colors.redAccent, width: 1.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                    color: Colors.redAccent, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RegistrationScreen(),
                            ),
                          );
                        },
                        child: Text('Create a new account'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        children: <Widget>[
                          GoogleSignInButton(
                            onPressed: _signInWithGoogle,
                            darkMode: true,
                          ),
                          FacebookSignInButton(
                            onPressed: _signInWithFacebook,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      _signInWithEmailAndPassword();
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Theme.of(context).primaryColor,
                    height: 60.0,
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//SizedBox(height: 20.0),

// FlatButton(

//   child: Text('LOGIN'),
//   color: Color(0xff576F93),
//   padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
//   shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(25.0),
//         ),
//   ),
//   onPressed: (){
//
//     }
//   }
// )

//This block of code displays an alert dialog to the user when login isn't passed
//      if (Platform.isAndroid) {
//        showDialog(
//          context: context,
//          builder: (context) {
//            return AlertDialog(
//              title: Text('Login Failed'),
//              content: Text(e.toString()),
//              actions: <Widget>[
//                FlatButton(
//                  child: Text('Ok'),
//                  onPressed: () => Navigator.pop(context),
//                )
//              ],
//            );
//          },
//        );
//      } else if (Platform.isIOS) {
//        CupertinoAlertDialog(
//          title: Text('Login Failed'),
//          content: Text(e.toString()),
//          actions: <Widget>[
//            CupertinoDialogAction(
//              child: Text('Ok'),
//              onPressed: () => Navigator.pop(context),
//            )
//          ],
//        );
//      }
