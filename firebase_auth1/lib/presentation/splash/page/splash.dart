import 'package:firebase_auth1/core/config/assets/app_vectors.dart';
import 'package:firebase_auth1/core/config/theme/app_colors.dart';
import 'package:firebase_auth1/presentation/auth/page/singin.dart';
import 'package:firebase_auth1/presentation/splash/bloc/splash_cubit.dart';
import 'package:firebase_auth1/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticatd) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SinginPage()));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppVectors.appLogo),
          ),
        ),
      ),
    );
  }
}
