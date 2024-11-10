import 'package:firebase_auth1/data/auth/repository/auth_repository_impl.dart';
import 'package:firebase_auth1/data/auth/source/auth_firebase_service.dart';
import 'package:firebase_auth1/domain/auth/repository/auth.dart';
import 'package:firebase_auth1/domain/auth/usecases/singup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //service
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //Usecase
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );
}
