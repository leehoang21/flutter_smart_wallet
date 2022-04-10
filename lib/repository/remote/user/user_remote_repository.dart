import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRemoteRepository {
  final FirebaseAuth firebaseAuth;

  UserRemoteRepository(this.firebaseAuth);

  String getUserId();
  String getPhoneNumber();
  Future<bool> setUserFirestore(String userId, Map<String, Object?> data);
  Future<bool> hasUserFirestore(String userId);
  Future<bool> updateUserFirestore(String userId, Map<String, Object?> data);
  Future<bool> hasconnection();
}
