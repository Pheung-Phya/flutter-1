import 'package:firebase_auth1/common/helpr/app_navigator.dart';
import 'package:firebase_auth1/common/widgets/appbar/app_bar.dart';
import 'package:firebase_auth1/common/widgets/buttons/basic_app_button.dart';
import 'package:firebase_auth1/presentation/auth/page/forgot_password.dart';
import 'package:firebase_auth1/presentation/auth/page/gender_and_age_selection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
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
      'Sign In',
      style: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _passwordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: 'Enter Password'),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
        onPressed: () {
          AppNavigator.push(context,const GenderAndAgeSelection());
        },
        Title: 'Continue');
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      const TextSpan(text: 'Forgot password? '),
      TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, const ForgotPasswordPage());
            },
          text: 'Reset',
          style: const TextStyle(fontWeight: FontWeight.bold))
    ]));
  }
}
