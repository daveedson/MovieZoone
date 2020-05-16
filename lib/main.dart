import 'package:flutter/material.dart';

import 'Screens/Login.dart';

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
      home: LoginScreen(),
      
       );
  }
}