import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate1/theme/theme_controller.dart';
import 'local_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.find<LocalController>();
  final themeController = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('language'.tr), // Using the `.tr` method for translations
      ),  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello'.tr, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('welcome'.tr, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.changeLanguage('en');
              },
              child: const Text('English'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controller.changeLanguage('km');
              },
              child: const Text('ភាសាខ្មែរ'),
            ),
            
         Obx(() {
          return Switch(
            value: themeController.isDarkMode.value,
            onChanged: (value) {
              themeController.switchTheme();
            },
          );
        }),
          ],
        ),
      ),
    );
  }
}
