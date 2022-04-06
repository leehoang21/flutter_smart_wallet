import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';
import 'package:flutter_smart_wallet/repository/remote/user/user_remote_repository.dart';

class UserRemoteRepositoryImpl extends UserRemoteRepository {
  UserRemoteRepositoryImpl(FirebaseAuth firebaseAuth) : super(firebaseAuth);

  @override
  String getUserId() {
    return firebaseAuth.currentUser!.uid;
  }

  @override
  String getPhoneNumber() {
    return firebaseAuth.currentUser!.phoneNumber!;
  }

  @override
  Future<bool> hasUserFirestore(String userId) async {
    final result = await FirebaseConfig.userDoc
        .collection(userId)
        .doc(DefaultEnvironment.profile)
        .get();
    return result.exists;
  }

  @override
  Future<bool> hasconnection() async {
    return await InternetChecker.hasConnection();
  }

  @override
  Future<bool> setUserFirestore(
      String userId, Map<String, Object?> data) async {
    try {
      await FirebaseConfig.userDoc
          .collection(userId)
          .doc(DefaultEnvironment.profile)
          .set(data);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<Map<String, dynamic>?> getUserFirestore(String userId) async {
    final result = await FirebaseConfig.userDoc
        .collection(userId)
        .doc(DefaultEnvironment.profile)
        .get();
    return result.data();
  }

  @override
  Future<bool> updateUserFirestore(
    String userId,
    Map<String, Object?> data,
  ) async {
    try {
      await FirebaseConfig.userDoc
          .collection(userId)
          .doc(DefaultEnvironment.profile)
          .update(data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
