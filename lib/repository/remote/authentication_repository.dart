import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  final FirebaseAuth auth;
  AuthenticationRepository({required this.auth});

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    int? reSendToken,
  });

  Future<UserCredential> userCredential(String verificationId, String smsCode);
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
  Future<UserCredential> userCredential(
      String verificationId, String smsCode) async {
    UserCredential _userCredential = await auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      ),
    );
    return _userCredential;
  }
}
