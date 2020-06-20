import 'package:flutter/material.dart';
import 'package:moviezoone/services/auth.dart';
import 'package:moviezoone/services/authFunctions.dart';
import 'package:moviezoone/widgets/LandingPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthFunctions>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'MovieesZone',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xFF576F93),
        ),
        home: LandingPage(),
      ),
    );
  }
}
