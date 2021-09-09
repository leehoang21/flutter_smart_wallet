import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/data/data_sources/authentication_datasource.dart';
import 'package:flutter_smart_wallet/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource authenRemote;

  AuthenticationRepositoryImpl(this.authenRemote);

  @override
  Future<PhoneAuthCredential> verifyOtp(
      {required String verificationId, required String otpCode}) async {
    return await authenRemote.verifyOtp(
        verificationId: verificationId, smsCode: otpCode);
  }

  @override
  Future verifyPhoneNumber(
      {required String phoneNumber,
      int? forceResendingToken,
      required Function(PhoneAuthCredential p1) verificationComplete,
      required Function(String verificationId, int? otp) codeSent,
      required Function(FirebaseAuthException exception) verificationFailed,
      required Function(String p1) codeAutoRetrievalTimeout}) async {
    await authenRemote.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        forceResendingToken: forceResendingToken,
        verificationCompleted: verificationComplete,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
}
