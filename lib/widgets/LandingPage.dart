import 'package:flutter/material.dart';
import 'package:moviezoone/Screens/HomeScreen.dart';
import 'package:moviezoone/Screens/Login.dart';
import 'package:moviezoone/services/auth.dart';
import 'package:moviezoone/services/authFunctions.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.authFunctions});
  final AuthFunctions authFunctions;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: authFunctions.onAuthChanged,
        builder: (context, snapshot) {
          //this condition checks the state of the user,if the user is signed in or not,so it can decide which page to show.
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return LoginScreen(
                authFunctions: authFunctions,
              );
            } else {
              return HomeScreen(
                authFunctions: authFunctions,
              );
            }
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
