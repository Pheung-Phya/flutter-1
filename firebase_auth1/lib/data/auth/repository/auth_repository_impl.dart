import 'package:dartz/dartz.dart';
import 'package:firebase_auth1/data/auth/models/user_creation_req.dart';
import 'package:firebase_auth1/data/auth/source/auth_firebase_service.dart';
import 'package:firebase_auth1/domain/auth/repository/auth.dart';
import 'package:firebase_auth1/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return sl<AuthFirebaseService>().signup(user);
  }
}
