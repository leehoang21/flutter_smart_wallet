import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/data/models/user_model.dart';

class UserRemoteDataSourece {
  final FirebaseConfig firebaseConfig;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserRemoteDataSourece(this.firebaseConfig);

  Future createUser(UserModel user,String uid)async {
    await firebaseConfig.userDoc.collection(uid).doc(DefaultEnvironment.profile).set(user.toJson());
  }

  User? getCurrentUser() => firebaseAuth.currentUser;

  Future<UserModel?> getUser(String uid)async{
    final userSnapshot = await firebaseConfig.userDoc.collection(DefaultEnvironment.profile).doc(uid).get();
    if (userSnapshot.data() != null){
      return UserModel.fromJson(userSnapshot.data() as Map<String,dynamic>);
    }
    return null;
  }
}