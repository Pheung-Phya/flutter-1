import 'package:e_commers/widget/widget_support.dart';
import 'package:flutter/material.dart';
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isObscured = false;
  @override
  void initState() {
    super.initState();
    // Initialize the animation controller for continuous rotation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 3), // Complete 360-degree rotation in 3 seconds
    )..repeat(); // Make the animation repeat continuously
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the controller when the widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin:
              const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //     height: 300,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: const BoxDecoration(
              //       color: Colors.amber,
              //       borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(1000),
              //           bottomRight: Radius.circular(1000)),
              //     ),
              //     child: Stack(
              //       children: [
              //         AnimatedBuilder(
              //           animation: _controller,
              //           builder: (context, child) {
              //             return Transform.rotate(
              //               angle: _controller.value *
              //                   2 *
              //                   pi, // 360 degrees rotation
              //               child: ClipRRect(
              //                 borderRadius: const BorderRadius.only(
              //                     topLeft: Radius.circular(1000),
              //                     bottomRight: Radius.circular(1000)),
              //                 child: Image.asset(
              //                   'images/phya.jpg',
              //                   fit: BoxFit.cover,
              //                   height: 300,
              //                   width: MediaQuery.of(context).size.width,
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //         AnimatedBuilder(
              //           animation: _controller,
              //           builder: (context, child) {
              //             return Transform.rotate(
              //               angle: -_controller.value *
              //                   2 *
              //                   pi, // 360 degrees rotation
              //               child: ClipRRect(
              //                 borderRadius: const BorderRadius.only(
              //                     topRight: Radius.circular(1000),
              //                     bottomLeft: Radius.circular(1000)),
              //                 child: Image.asset(
              //                   'images/phya.jpg',
              //                   fit: BoxFit.cover,
              //                   height: 300,
              //                   width: MediaQuery.of(context).size.width,
              //                 ),
              //               ),
              //             );
              //           },
              //         )
              //       ],
              //     )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign In',
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please enter the details below to\n             continue',
                style: AppWidget.lightTextFieldStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Email',
                style: AppWidget.boldTextFieldStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: AppWidget.lightTextFieldStyle(),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    hintText: 'Enter Email',
                    hintStyle: AppWidget.lightTextFieldStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Password',
                style: AppWidget.boldTextFieldStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    obscureText: _isObscured,
                    obscuringCharacter: '*',
                    style: AppWidget.lightTextFieldStyle(),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      hintText: 'Enter Password',
                      hintStyle: AppWidget.lightTextFieldStyle(),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          }),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                          (Route<dynamic> route) =>
                              false, // Remove all previous routes
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "don't have an account?",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 62, 71, 246),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/sign_up',
                        (Route<dynamic> route) =>
                            false, // Remove all previous routes
                      );
                    },
                    child: Text('Sign Up',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
