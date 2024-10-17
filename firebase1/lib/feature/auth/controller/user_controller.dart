import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final emailCtr = TextEditingController();
  final passCtr = TextEditingController();

  Future<dynamic> signUp(BuildContext context) async {
    if (emailCtr.text.isNotEmpty && passCtr.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailCtr.text.trim(),
          password: passCtr.text.trim(),
        )
            .then((value) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/shop',
            (route) => false,
          );
        });
      } on FirebaseAuthException catch (e) {
        log('Error: ${e.message}');
        // ignore: use_build_context_synchronously
        showErrorDialog(context, e.message);
      }
    } else {
      log("Enter data");
      showErrorDialog(context, "Please enter both email and password.");
    }
  }

  Future<void> signIn(BuildContext context) async {
    if (emailCtr.text.isNotEmpty && passCtr.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: emailCtr.text.trim(),
          password: passCtr.text.trim(),
        )
            .then((value) {
          if (value.user != null) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/shop',
              (route) => false,
            );
          }
        });
      } on FirebaseAuthException catch (e) {
        log('Error: ${e.message}');
        showErrorDialog(context, e.message);
      }
    } else {
      log("Enter data");
      showErrorDialog(context, "Please enter both email and password.");
    }
  }

  void showErrorDialog(BuildContext context, String? message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:const Text('Error'),
        content: Text(message ?? 'An error occurred'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child:const Text('OK'),
          ),
        ],
      ),
    );
  }
}
