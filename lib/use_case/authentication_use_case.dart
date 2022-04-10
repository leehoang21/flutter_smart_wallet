import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/repository/remote/authentication_repository.dart';

class AuthenticationUseCase {
  final AuthenticationRepository authenticationRepository;
  AuthenticationUseCase({required this.authenticationRepository});

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    int? reSendToken,
  }) async {
    await authenticationRepository.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      reSendToken: reSendToken,
    );
  }

  Future<UserCredential> userCredential(PhoneAuthCredential credential) {
    return authenticationRepository.userCredential(credential);
  }

  bool checkUserIsExist() {
    try {
      return authenticationRepository.checkUserIsExist();
    } catch (_) {
      return false;
    }
  }
}
