import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';

class RegisterRepository {
  final FirebaseConfig _firebaseConfig;
  RegisterRepository(this._firebaseConfig);

  Future<void> addUser(String userId, Map<String, Object?> data) async {
    await _firebaseConfig.userDoc
        .collection(userId)
        .doc(DefaultEnvironment.profile)
        .set(data);
  }

  Future<bool> hasUserFirestore(String userId) async {
    final result = await _firebaseConfig.userDoc
        .collection(userId)
        .doc(DefaultEnvironment.profile)
        .get();
    return result.exists;
  }

  Future<bool> hasconnection() async {
    return await InternetChecker.hasConnection();
  }
}
