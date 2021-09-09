import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';

class FirebaseConfig {
  late FirebaseApp app;
  late CollectionReference profileCollection;

  init() async {
    app = await Firebase.initializeApp();
    profileCollection = FirebaseFirestore.instance
        .collection(DefaultEnvironment.environment)
        .doc(DefaultEnvironment.customer)
        .collection(DefaultEnvironment.profile);
  }
}
