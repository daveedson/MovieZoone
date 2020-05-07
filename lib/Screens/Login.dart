import 'dart:ui';

import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  //created a Unqiuely identifiable key for form validation..
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                padding: EdgeInsets.symmetric(vertical: 153.0),
                alignment: Alignment.center,
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
                        validator: (value) {
                          if (value.isEmpty) {
                            return "You can't have an empty email !,";
                          }
                          if (value.length < 5) {
                            return "Email must have nothing less than 5characters ";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Email',
                            helperText:
                                "This has to have a valid email address with '@' ",
                            helperStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            filled: true,
                            fillColor: Theme.of(context).primaryColor,
                            suffixIcon: Icon(
                              Icons.person,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor))),
                      ),
                    ),



                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "You can't have and empty password !";
                          }
                          if (value.length < 6) {
                            return "Password can't be less than 6";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Password',
                            helperText:
                                "Password should not be less than six characters ",
                            helperStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            filled: true,
                            fillColor: Theme.of(context).primaryColor,
                            suffixIcon: Icon(
                              Icons.lock,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor))),
                      ),
                    ),

                    SizedBox(
                      height: 15.0,
                    ),

                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 60.0),
                        height: 45.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
