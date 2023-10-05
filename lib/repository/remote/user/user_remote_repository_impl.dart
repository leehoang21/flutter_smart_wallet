import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';
import 'package:flutter_smart_wallet/model/user_model.dart';
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
  Future<bool> hasUserFirestore() async {
    if (firebaseAuth.currentUser == null) return false;
    final result = await FirebaseConfig.userDoc
        .collection(getUserId())
        .doc(DefaultEnvironment.profile)
        .get();

    logger(result.metadata.toString());

    return result.exists;
  }

  @override
  Future<bool> hasconnection() async {
    return await InternetChecker.hasConnection();
  }

  @override
  Future<bool> setUserFirestore(Map<String, Object?> data) async {
    if (firebaseAuth.currentUser == null) return false;
    try {
      await FirebaseConfig.userDoc
          .collection(getUserId())
          .doc(DefaultEnvironment.profile)
          .set(data);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<UserModel> getUserFirestore() async {
    if (firebaseAuth.currentUser == null)
      return UserModel(phoneNumber: '', uId: null);
    final result = await FirebaseConfig.userDoc
        .collection(getUserId())
        .doc(DefaultEnvironment.profile)
        .get();
    return UserModel.fromDocument(result);
  }

  @override
  Future<bool> updateUserFirestore(
    Map<String, Object?> data,
  ) async {
    if (firebaseAuth.currentUser == null) return false;
    try {
      await FirebaseConfig.userDoc
          .collection(getUserId())
          .doc(DefaultEnvironment.profile)
          .update(data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
