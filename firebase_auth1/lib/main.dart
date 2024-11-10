import 'package:firebase_auth1/core/config/theme/theme_colors.dart';
import 'package:firebase_auth1/presentation/splash/bloc/splash_cubit.dart';
import 'package:firebase_auth1/presentation/splash/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        //home: GenderAndAgeSelection()
        home: const SplashPage(),
      ),
    );
  }
}
