import 'package:flutter/material.dart';

class AppWidget {
  // ignore: non_constant_identifier_names
  static TextStyle boldTextFieldStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black);
  }

  static TextStyle lightTextFieldStyle() {
    return TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54);
  }

  static TextStyle semiboldTextFieldStyle() {
    return TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  }
}
