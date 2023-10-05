import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';

class FirebaseConfig {
  static late FirebaseApp app;
  static late DocumentReference userDoc;
  static late Reference userStorage;

  static init() async {
    app = await Firebase.initializeApp();
    userDoc = FirebaseFirestore.instance
        .collection(DefaultEnvironment.smartWallet)
        .doc(DefaultEnvironment.environment);
    userStorage = FirebaseStorage.instance
        .ref(DefaultEnvironment.smartWallet)
        .child(DefaultEnvironment.environment);
  }
}
