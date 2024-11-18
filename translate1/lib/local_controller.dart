import 'package:flutter/material.dart'; // Add this for Locale
import 'package:get/get.dart';

class LocalController extends GetxController {
  var currentLanguage = 'en'; // Default language

  void changeLanguage(String languageCode) {
    currentLanguage = languageCode;
    Get.updateLocale(Locale(languageCode));
  }
}
