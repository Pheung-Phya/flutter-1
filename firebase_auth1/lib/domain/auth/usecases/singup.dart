import 'package:dartz/dartz.dart';
import 'package:firebase_auth1/core/usecase/usecase.dart';
import 'package:firebase_auth1/data/auth/models/user_creation_req.dart';
import 'package:firebase_auth1/domain/auth/repository/auth.dart';
import 'package:firebase_auth1/service_locator.dart';

class SignupUseCase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? param}) async {
    return await sl<AuthRepository>().signup(param!);
  }
}
