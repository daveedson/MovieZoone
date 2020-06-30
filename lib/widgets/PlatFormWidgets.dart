import 'dart:io';

import 'package:flutter/material.dart';

abstract class PlatFormDialogs extends StatelessWidget {
  Widget buildCupertinoAlertDialog(BuildContext context);
  Widget buildMaterialAlertDialog(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return buildCupertinoAlertDialog(context);
    }
    return buildMaterialAlertDialog(context);
  }
}
