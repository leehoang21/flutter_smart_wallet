import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/data/enum/error_enum.dart';
import 'package:flutter_smart_wallet/domain/use_cases/authentication_usecase.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final AuthenticationUsecase authenticationUsecase;
  RxBool _registerSuccess = false.obs;
  RxString _nextScreen = ''.obs;
  Rx<ErrorCode> _errorCode = ErrorCode.none.obs;

  RegisterController(this.authenticationUsecase);

  RxString get nextScreen => _nextScreen;

  RxBool get registerSuccess => _registerSuccess;

  Rx<ErrorCode> get errorCode => _errorCode;

  void register(String phoneNumber) {
    authenticationUsecase.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationComplete: _verificationComplete,
        codeSent: _codeSent,
        verificationFailed: _verificationFailed,
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout);
  }

  void _verificationComplete(PhoneAuthCredential authCredential) {
    log('_verificationComplete');
    _registerSuccess = true as RxBool;
    _nextScreen = RouteList.mainScreen as RxString;
  }

  void _codeSent(String verificationId, int? smsCode) {
    log('_codeSent');
    log('verification id : $verificationId');
    log('sms code : $smsCode');
    _registerSuccess = true as RxBool;
    _nextScreen = RouteList.verifyOtpScreen as RxString;
  }

  void _verificationFailed(FirebaseAuthException authException) {
    log('_verificationFailed');
    log('message-exception : $authException');
    _errorCode.value = ErrorCodeEnum.getErrorCode(authException.code);
  }

  void _codeAutoRetrievalTimeout(String code) {
    log('_codeAutoRetrievalTimeout');
    log('time out code : $code');
  }
}
