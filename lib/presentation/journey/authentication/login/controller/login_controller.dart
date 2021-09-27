
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/data/enum/error_enum.dart';
import 'package:flutter_smart_wallet/domain/use_cases/authentication_usecase.dart';
import 'package:flutter_smart_wallet/presentation/controller/app_controller.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthenticationUsecase authenticationUsecase;
  final AppController appController;
  RxString _nextScreen = ''.obs;
  Rx<ErrorCode> _errorCode = ErrorCode.none.obs;
  RxString _verificationId = ''.obs;
  RxInt _smsCode = 0.obs;
  LoginController(this.authenticationUsecase,this.appController);

  RxString get nextScreen => _nextScreen;

  Rx<ErrorCode> get errorCode => _errorCode;

  RxInt get smsCode => _smsCode;

  RxString get verificationId => _verificationId;

  void verifyPhoneNumber(String phoneNumber) {
    appController.startLoading();
    authenticationUsecase.verifyPhoneNumber(
        phoneNumber: phoneNumber.trim().replaceFirst('0', '+84'),
        forceResendingToken: 0,
        verificationComplete: _verificationComplete,
        codeSent: _codeSent,
        verificationFailed: _verificationFailed,
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout);
  }

  void _verificationComplete(PhoneAuthCredential authCredential) {
    appController.finishLoading();
    _nextScreen.value = RouteList.mainScreen;
  }

  void _codeSent(String verificationId, int? smsCode) {
    appController.finishLoading();
    _verificationId.value = verificationId;
    _smsCode.value = smsCode ?? 0;
    _nextScreen.value = RouteList.verifyOtpScreen;
  }

  void _verificationFailed(FirebaseAuthException authException) {
    appController.finishLoading();
    _errorCode.value = ErrorCodeEnum.getErrorCode(authException.code);
  }

  void _codeAutoRetrievalTimeout(String code) {
  }
}