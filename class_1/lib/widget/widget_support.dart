import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextStyle() {
    return const TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black);
  }

  static TextStyle lightTextStyle() {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black45);
  }

  static TextStyle seaAll() {
    return const TextStyle(
        color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold);
  }
}