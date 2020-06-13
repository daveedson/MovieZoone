import 'package:flutter/material.dart';
import 'package:moviezoone/services/auth.dart';
import 'package:moviezoone/widgets/LandingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieesZone',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF576F93),
      ),
      home: LandingPage(
        authFunctions: Auth(),
      ),
    );
  }
}
