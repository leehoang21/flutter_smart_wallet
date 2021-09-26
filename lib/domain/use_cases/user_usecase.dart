import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/domain/enitities/user_entity.dart';
import 'package:flutter_smart_wallet/domain/repositories/user_repository.dart';

class UserUsecase {
  final UserRepository userRepository;

  UserUsecase(this.userRepository);
  Future createUser(UserEntity userEntity,String uid) => userRepository.createUser(userEntity,uid);
  Future<UserEntity?> getUser(String uid) => userRepository.getUser(uid);
  User? getCurrentUser() => userRepository.getCurrentUser();
}