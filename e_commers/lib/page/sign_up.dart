// import 'package:e_commers/page/bottom_nav.dart';
// import 'package:e_commers/widget/widget_support.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// //import 'dart:math'; // To use pi for rotation calculations

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   bool _isObscured = false;
//   String? name, email, password;
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   registeration() async {
//     if (name != null && email != null && password != null) {
//       try {
//         UserCredential userCredential =
//             await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email!,
//           password: password!,
//         );
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Registration Success')));
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => BottomNav()));
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('The password provided is too weak.')));
//         } else if (e.code == 'email-already-in-use') {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text('The account already exists for that email.')));
//         }
//       }
//     } else {
//       return null;
//     }
//   }

//   @override
//   // void initState() {
//   //   super.initState();
//   //   // Initialize the animation controller for continuous rotation
//   //   _controller = AnimationController(
//   //     vsync: this,
//   //     duration: const Duration(
//   //         seconds: 3), // Complete 360-degree rotation in 3 seconds
//   //   )..repeat(); // Make the animation repeat continuously
//   // }

//   @override
//   void dispose() {
//     _controller
//         .dispose(); // Dispose of the controller when the widget is destroyed
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           margin:
//               const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 40),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Container(
//                 //     height: 300,
//                 //     width: MediaQuery.of(context).size.width,
//                 //     decoration: const BoxDecoration(
//                 //       color: Colors.amber,
//                 //       borderRadius: BorderRadius.only(
//                 //           topLeft: Radius.circular(1000),
//                 //           bottomRight: Radius.circular(1000)),
//                 //     ),
//                 //     child: Stack(
//                 //       children: [
//                 //         AnimatedBuilder(
//                 //           animation: _controller,
//                 //           builder: (context, child) {
//                 //             return Transform.rotate(
//                 //               angle: _controller.value *
//                 //                   2 *
//                 //                   pi, // 360 degrees rotation
//                 //               child: ClipRRect(
//                 //                 borderRadius: const BorderRadius.only(
//                 //                     topLeft: Radius.circular(1000),
//                 //                     bottomRight: Radius.circular(1000)),
//                 //                 child: Image.asset(
//                 //                   'images/phya.jpg',
//                 //                   fit: BoxFit.cover,
//                 //                   height: 300,
//                 //                   width: MediaQuery.of(context).size.width,
//                 //                 ),
//                 //               ),
//                 //             );
//                 //           },
//                 //         ),
//                 //         AnimatedBuilder(
//                 //           animation: _controller,
//                 //           builder: (context, child) {
//                 //             return Transform.rotate(
//                 //               angle: -_controller.value *
//                 //                   2 *
//                 //                   pi, // 360 degrees rotation
//                 //               child: ClipRRect(
//                 //                 borderRadius: const BorderRadius.only(
//                 //                     topRight: Radius.circular(1000),
//                 //                     bottomLeft: Radius.circular(1000)),
//                 //                 child: Image.asset(
//                 //                   'images/phya.jpg',
//                 //                   fit: BoxFit.cover,
//                 //                   height: 300,
//                 //                   width: MediaQuery.of(context).size.width,
//                 //                 ),
//                 //               ),
//                 //             );
//                 //           },
//                 //         )
//                 //       ],
//                 //     )),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Sign In',
//                       style: AppWidget.boldTextFieldStyle(),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   'Please enter the details below to\n             continue',
//                   style: AppWidget.lightTextFieldStyle(),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Name',
//                   style: AppWidget.boldTextFieldStyle(),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(10)),
//                   child: TextFormField(
//                     controller: nameController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "please enter name";
//                       } else {
//                         return null;
//                       }
//                     },
//                     style: AppWidget.lightTextFieldStyle(),
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(vertical: 15),
//                       hintText: 'Enter Email',
//                       hintStyle: AppWidget.lightTextFieldStyle(),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   'Email',
//                   style: AppWidget.boldTextFieldStyle(),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(10)),
//                   child: TextFormField(
//                     controller: emailController,
//                     style: AppWidget.lightTextFieldStyle(),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "please enter email";
//                       } else {
//                         return null;
//                       }
//                     },
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(vertical: 15),
//                       hintText: 'Enter Email',
//                       hintStyle: AppWidget.lightTextFieldStyle(),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Password',
//                   style: AppWidget.boldTextFieldStyle(),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius: BorderRadius.circular(10)),
//                     child: TextFormField(
//                       obscureText: _isObscured,
//                       obscuringCharacter: '*',
//                       style: AppWidget.lightTextFieldStyle(),
//                       keyboardType: TextInputType.visiblePassword,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "please enter password more than 6 character";
//                         } else {
//                           return null;
//                         }
//                       },
//                       decoration: InputDecoration(
//                         contentPadding:
//                             const EdgeInsets.symmetric(vertical: 15),
//                         hintText: 'Enter Password',
//                         hintStyle: AppWidget.lightTextFieldStyle(),
//                         border: InputBorder.none,
//                         suffixIcon: IconButton(
//                             icon: Icon(
//                               _isObscured
//                                   ? Icons.visibility_off
//                                   : Icons.visibility,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _isObscured = !_isObscured;
//                               });
//                             }),
//                       ),
//                     )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   //crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(
//                       'Forgot Password?',
//                       style: TextStyle(
//                           color: Colors.red,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     if (_formKey.currentState!.validate()) {
//                       setState(() {
//                         name = nameController.text;
//                         email = emailController.text;
//                         password = passwordController.text;
//                       });
//                       registeration();
//                     }
//                   },
//                   child: Center(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width / 2,
//                       padding: EdgeInsets.all(13),
//                       decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Center(
//                         child: Text(
//                           'SignUp',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 24),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       "don't have an account?",
//                       style: TextStyle(
//                           color: const Color.fromARGB(255, 62, 71, 246),
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         // Navigator.pushNamedAndRemoveUntil(
//                         //   context,
//                         //   '/',
//                         //   (Route<dynamic> route) =>
//                         //       false, // Remove all previous routes
//                         // );
//                       },
//                       child: Text('LogIn',
//                           style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:e_commers/page/bottom_nav.dart';
import 'package:e_commers/widget/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// Uncomment if using rotation animations

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isObscured = false;
  String? name, email, password;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller for continuous rotation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // 360-degree rotation in 3 seconds
    )..repeat(); // Make the animation repeat continuously
  }

  Future<void> registerUser() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration Successful')));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('The password provided is too weak.')));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('The account already exists for that email.')));
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin:
              const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style: AppWidget.boldTextFieldStyle(),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Please enter the details below to\ncontinue',
                  style: AppWidget.lightTextFieldStyle(),
                ),
                SizedBox(height: 10),
                Text(
                  'Name',
                  style: AppWidget.boldTextFieldStyle(),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter name";
                      }
                      return null;
                    },
                    style: AppWidget.lightTextFieldStyle(),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      hintText: 'Enter Name',
                      hintStyle: AppWidget.lightTextFieldStyle(),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Email',
                  style: AppWidget.boldTextFieldStyle(),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email";
                      }
                      return null;
                    },
                    style: AppWidget.lightTextFieldStyle(),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      hintText: 'Enter Email',
                      hintStyle: AppWidget.lightTextFieldStyle(),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Password',
                  style: AppWidget.boldTextFieldStyle(),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _isObscured,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return "Please enter a password longer than 6 characters";
                      }
                      return null;
                    },
                    style: AppWidget.lightTextFieldStyle(),
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
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    name = nameController.text;
                    email = emailController.text;
                    password = passwordController.text;
                    registerUser();
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Sign Up',
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
                      "Don't have an account?",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 62, 71, 246),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Log In',
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
      ),
    );
  }
}
