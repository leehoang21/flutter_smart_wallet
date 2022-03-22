import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';

class RegisterRepository {
  Future<void> addUser(String userId, Map<String, Object?> data) async {
    await FirebaseFirestore.instance
        .collection(DefaultEnvironment.smartWallet)
        .doc(DefaultEnvironment.environment)
        .collection(userId)
        .doc(
          'profile',
        )
        .set(data);
  }

  Future<Map<String, dynamic>?> fetchUser(String userId) async {
    final result = await FirebaseFirestore.instance
        .collection(DefaultEnvironment.smartWallet)
        .doc(DefaultEnvironment.environment)
        .collection(userId)
        .doc(
          'profile',
        )
        .get();
    return result.data();
  }
}
