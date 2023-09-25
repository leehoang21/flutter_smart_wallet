import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/repository/local/user_local_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/authentication_repository.dart';

class AuthenticationUseCase {
  final AuthenticationRepository authenticationRepository;
  final UserLocalRepository userLocalRepository;
  AuthenticationUseCase(this.userLocalRepository,
      {required this.authenticationRepository});

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

  Future<UserCredential> userCredential(
      String verificationId, String smsCode) async {
    try {
      UserCredential _userCredential = await authenticationRepository
          .userCredential(verificationId, smsCode);
      return _userCredential;
    } catch (_) {
      throw 'invalid_otp';
    }
  }

  Future<void> signOut() async {
    await authenticationRepository.signOut();
    userLocalRepository.singout();
  }
}
