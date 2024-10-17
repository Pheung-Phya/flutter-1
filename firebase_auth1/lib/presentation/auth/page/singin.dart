import 'package:firebase_auth1/common/helpr/app_navigator.dart';
import 'package:firebase_auth1/common/widgets/buttons/basic_app_button.dart';
import 'package:firebase_auth1/presentation/auth/page/create_account.dart';
import 'package:firebase_auth1/presentation/auth/page/enter_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SinginPage extends StatelessWidget {
  const SinginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            const SizedBox(
              height: 20,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _continueButton(context),
            const SizedBox(
              height: 20,
            ),
            _createAccount(context)
          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Text(
      'Sign In',
      style: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: 'Enter Email'),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
        onPressed: () {
          AppNavigator.push(context, PasswordPage());
        },
        Title: 'Continue');
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      const TextSpan(text: 'Do you have an account? '),
      TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, CreateAccountPage());
            },
          text: 'Create One',
          style: const TextStyle(fontWeight: FontWeight.bold))
    ]));
  }
}
