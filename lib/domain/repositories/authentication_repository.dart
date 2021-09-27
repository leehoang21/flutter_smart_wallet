import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future verifyPhoneNumber(
      {required String phoneNumber,
       int? forceResendingToken,
      required Function(PhoneAuthCredential) verificationComplete,
      required Function(String verificationId, int? otp) codeSent,
      required Function(FirebaseAuthException exception) verificationFailed,
      required Function(String p1) codeAutoRetrievalTimeout});

  Future<PhoneAuthCredential> verifyOtp(
      {required String verificationId, required String otpCode});
  Future<UserCredential> singInWithPhoneAuth(PhoneAuthCredential credential);
}
