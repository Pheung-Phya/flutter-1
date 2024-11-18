import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Observable variable for tracking theme mode
  var isDarkMode = false.obs;

  void switchTheme() {
    if (isDarkMode.value) {
      Get.changeTheme(ThemeData.light());
    } else {
      Get.changeTheme(ThemeData.dark());
    }
    isDarkMode.value = !isDarkMode.value;
  }
}
