import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRemoteRepository {
  final FirebaseAuth firebaseAuth;

  UserRemoteRepository(this.firebaseAuth);

  String getUserId();
  String getPhoneNumber();
  Future<bool> setUserFirestore(Map<String, Object?> data);
  Future<bool> hasUserFirestore();
  Future<bool> updateUserFirestore(Map<String, Object?> data);
  Future<bool> hasconnection();
}
