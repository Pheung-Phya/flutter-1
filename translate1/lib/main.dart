import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Your translation file
import 'package:translate1/home_page.dart';
import 'package:translate1/my_translate.dart';
import 'package:translate1/theme/theme_controller.dart';
import 'local_controller.dart'; // Your LocalController

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalController localController = Get.put(LocalController());
    final themeController = Get.put(ThemeController());
    return GetMaterialApp(
      theme: themeController.isDarkMode.value
          ? ThemeData.dark()
          : ThemeData.light(),
      translations: MyTranslations(), // Translation class
      locale: const Locale('en'), // Default locale
      fallbackLocale: const Locale('en'), // Fallback language
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
