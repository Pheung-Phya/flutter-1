import 'package:bloc/bloc.dart';
import 'package:firebase_auth1/presentation/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(UnAuthenticatd());
  }
}
