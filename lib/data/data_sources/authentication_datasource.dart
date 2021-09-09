import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationDataSource {
  final fireBaseAuth = FirebaseAuth.instance;

  Future verifyPhoneNumber(
      {required String phoneNumber,
      int? forceResendingToken,
      required Function(PhoneAuthCredential) verificationCompleted,
      required Function(FirebaseAuthException) verificationFailed,
      required Function(String, int?) codeSent,
      required Function(String) codeAutoRetrievalTimeout}) async {
    fireBaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        forceResendingToken: forceResendingToken,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  Future<PhoneAuthCredential> verifyOtp(
      {required String verificationId, required String smsCode}) async {
    return PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
  }
}
