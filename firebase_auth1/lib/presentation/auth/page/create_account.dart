import 'package:firebase_auth1/common/helpr/app_navigator.dart';
import 'package:firebase_auth1/common/widgets/buttons/basic_app_button.dart';

import 'package:firebase_auth1/presentation/auth/page/singin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

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
            _firstNameField(context),
            const SizedBox(
              height: 20,
            ),
            _lastNameField(context),
            const SizedBox(
              height: 20,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
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
      'Create Account',
      style: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: 'Email Address'),
    );
  }

  Widget _firstNameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: 'Firstname'),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: 'Lastname'),
    );
  }

  Widget _passwordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(onPressed: () {}, Title: 'Create Account');
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      const TextSpan(text: 'Do you have an account? '),
      TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, const SinginPage());
            },
          text: 'Sign In',
          style: const TextStyle(fontWeight: FontWeight.bold))
    ]));
  }
}
