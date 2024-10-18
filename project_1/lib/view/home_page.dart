import 'package:flutter/material.dart';
import 'package:project_1/widgets/basic_app_bar.dart';
import 'package:project_1/widgets/basic_app_body.dart';
import 'package:project_1/widgets/basic_text_input_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Column(
              children: [
                BasicAppBar(),
                const SizedBox(
                  height: 20,
                ),
                const BasicTextInputField(),
                const SizedBox(
                  height: 20,
                ),
                BasicAppBody()
              ],
            ),
          ),
        ));
  }
}
