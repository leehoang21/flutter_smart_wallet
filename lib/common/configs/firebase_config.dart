import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  late FirebaseApp app;

  init() async {
    app = await Firebase.initializeApp();
  }
}