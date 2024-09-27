import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Push(BuildContext context, Widget NewScreen) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => NewScreen));
}

// ignore: non_constant_identifier_names
PushWithReplacement(BuildContext context, Widget NewScreen) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => NewScreen));
}

// ignore: non_constant_identifier_names
PushAndRemoveUntil(BuildContext context, Widget view) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => view), (route) => false);
}
