import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRemoteRepository {
  final FirebaseAuth firebaseAuth;

  UserRemoteRepository(this.firebaseAuth);

  String getUserId();
}
