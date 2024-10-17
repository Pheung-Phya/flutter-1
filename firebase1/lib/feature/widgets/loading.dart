import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

Center circularProgressIndicator({double? value}) => Center(
      child: SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
          backgroundColor: Colors.grey,
          color: Colors.blue,
          value: value,
        ),
      ),
    );
Future<void> openLoading() async {
  await Future.delayed(Duration.zero,
      () => Get.dialog(circularProgressIndicator(), barrierDismissible: false));
}

void closeLoading() => Get.close(0);