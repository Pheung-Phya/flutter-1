import 'package:firebase2/screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDRCGB_nqnkgDG4frglqgP5JKuH9IeWfDE",
            authDomain: "fir-setup-2-7a986.firebaseapp.com",
            projectId: "fir-setup-2-7a986",
            storageBucket: "fir-setup-2-7a986.appspot.com",
            messagingSenderId: "253440237230",
            appId: "1:253440237230:web:5460f5b78e03a055ff173f"));
  } else {
    Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}
