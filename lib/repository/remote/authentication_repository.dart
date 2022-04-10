import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';

abstract class AuthenticationRepository {
  final FirebaseAuth auth;
  AuthenticationRepository({required this.auth});

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    int? reSendToken,
  });

  Future<UserCredential> userCredential(PhoneAuthCredential credential);

  bool checkUserIsExist();
}

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuth auth;
  AuthenticationRepositoryImpl({required this.auth}) : super(auth: auth);

  @override
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    int? reSendToken,
  }) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) {},
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: (verificationId) {},
      forceResendingToken: reSendToken,
    );
  }

  @override
  Future<UserCredential> userCredential(PhoneAuthCredential credential) {
    return auth.signInWithCredential(credential);
  }

  bool checkUserIsExist() {
    return isNullEmpty(auth.currentUser);
  }
}
