import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/repository/remote/user/user_remote_repository.dart';

class UserRemoteRepositoryImpl extends UserRemoteRepository {
  UserRemoteRepositoryImpl(FirebaseAuth firebaseAuth) : super(firebaseAuth);

  @override
  String getUserId() {
    return firebaseAuth.currentUser!.uid;
  }
}
