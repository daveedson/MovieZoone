import 'package:flutter/material.dart';
import 'package:moviezoone/Screens/HomeScreen.dart';
import 'package:moviezoone/Screens/Login.dart';
import 'package:moviezoone/services/auth.dart';
import 'package:moviezoone/services/authFunctions.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authFunctions = Provider.of<AuthFunctions>(context, listen: false);

    return StreamBuilder<User>(
        stream: authFunctions.onAuthChanged,
        builder: (context, snapshot) {
          //this condition checks the state of the user,if the user is signed in or not,so it can decide which page to show.
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return LoginScreen.create(context);
            } else {
              return HomeScreen();
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
