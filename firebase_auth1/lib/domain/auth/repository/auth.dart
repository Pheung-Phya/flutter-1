import 'package:dartz/dartz.dart';
import 'package:firebase_auth1/data/auth/models/user_creation_req.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReq user);
}
