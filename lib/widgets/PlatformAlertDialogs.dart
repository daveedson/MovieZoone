import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviezoone/widgets/PlatFormWidgets.dart';

class PlatFormAlertDialogs extends PlatFormDialogs {
  PlatFormAlertDialogs(
      {@required this.title,
      @required this.content,
      @required this.textAction,
      this.onPressed})
      : assert(title != null),
        assert(content != null),
        assert(textAction != null),
        assert(onPressed != null);

  final String title;
  final String content;
  final String textAction;
  final VoidCallback onPressed;

  @override
  Widget buildCupertinoAlertDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(textAction),
          onPressed: onPressed,
        )
      ],
    );
  }

  @override
  Widget buildMaterialAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(onPressed: onPressed, child: Text(textAction))
      ],
    );
  }
}
