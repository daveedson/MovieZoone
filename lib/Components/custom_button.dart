import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.label, this.buttonFunction});

  final String label; 
  final Function buttonFunction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
              child: Text(label),
              color: Color(0xff576F93),
              padding: EdgeInsets.symmetric(
                  horizontal: 60.0, vertical: 15.0),
              onPressed: buttonFunction),
        ),
      ],
    );
  }
}
