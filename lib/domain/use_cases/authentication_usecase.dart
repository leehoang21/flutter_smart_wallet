import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/domain/repositories/authentication_repository.dart';

class AuthenticationUsecase {
  final AuthenticationRepository authenRepository;

  AuthenticationUsecase(this.authenRepository);

  Future verifyPhoneNumber(
      {required String phoneNumber,
      int? forceResendingToken,
      required Function(PhoneAuthCredential p1) verificationComplete,
      required Function(String verificationId, int? otp) codeSent,
      required Function(FirebaseAuthException exception) verificationFailed,
      required Function(String p1) codeAutoRetrievalTimeout}) async {
    await authenRepository.verifyPhoneNumber(
      forceResendingToken: forceResendingToken,
      phoneNumber: phoneNumber,
      verificationComplete: verificationComplete,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<PhoneAuthCredential> verifyOtp(
      {required String verificationId, required String otpCode}) async {
    return await authenRepository.verifyOtp(
        verificationId: verificationId, otpCode: otpCode);
  }

}
