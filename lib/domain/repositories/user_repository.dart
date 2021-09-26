import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/domain/enitities/user_entity.dart';

abstract class UserRepository {
  Future createUser(UserEntity userEntity,String uid);
  Future<UserEntity?> getUser(String uid);
  User? getCurrentUser();
}