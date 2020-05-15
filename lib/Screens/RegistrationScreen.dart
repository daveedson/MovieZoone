import 'package:flutter/material.dart';
import 'package:moviezoone/Screens/HomeScreen.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
              //  padding: EdgeInsets.symmetric(vertical: 153.0),
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
                        validator: (value) {
                          if (value.isEmpty) {
                            return "You can't have an empty email !,";
                          }
                          if (value.length < 5) {
                            return "Email must have nothing less than 5characters ";
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
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: TextFormField(
                        cursorColor: Colors.white12,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "You can't have an empty username !";
                          }
                          if (value.length < 3) {
                            return "you can't have a username with  less than 3words";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Username',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            filled: true,
                            fillColor: Color(0xff576F93),
                            suffixIcon: Icon(
                              Icons.person,
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: TextFormField(
                        obscureText: true,
                        cursorColor: Colors.white12,
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
                      height: 10.0,
                    ),
                    // SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Theme.of(context).primaryColor,
                  height: 60.0,
                  child: Text(
                    "REGISTER",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  FlatButton(
//                         child: Text('REGISTER'),
//                         color: Color(0xff576F93),
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 60.0, vertical: 15.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(25.0),
//                           ),
//                         ),
//                         onPressed: () {
//                           if (_formKey.currentState.validate()) {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (_) => HomeScreen()));
//                           }
//                         })
