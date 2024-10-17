import 'package:firebase1/feature/auth/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.put(UserController());
  final isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/chat.png',
              width: double.infinity,
              height: 150,
              fit: BoxFit.contain,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 26,
            ),
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Please enter your email and password to sign up.',
              style: TextStyle(fontSize: 16),
            ),

            // Form
            const SizedBox(height: 26),
            TextField(
              controller: controller.emailCtr,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.passCtr,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 26),

            // Button
            Obx(() {
              return isLoading.value
                  ? const CircularProgressIndicator()
                  : MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      color: Theme.of(context).primaryColor,
                      onPressed: () async {
                        isLoading.value = true;
                        await controller.signUp(context);
                        isLoading.value = false;
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    );
            }),
            const SizedBox(
              height: 26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Do you have an account ?',
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/signin'),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
