import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/model/user_model.dart';

abstract class UserRemoteRepository {
  final FirebaseAuth firebaseAuth;

  UserRemoteRepository(this.firebaseAuth);

  String getUserId();
  String getPhoneNumber();
  Future<UserModel> getUserFirestore(String userId);
  Future<bool> setUserFirestore(String userId, Map<String, Object?> data);
  Future<bool> hasUserFirestore(String userId);
  Future<bool> updateUserFirestore(String userId, Map<String, Object?> data);
  Future<bool> hasconnection();
}
