import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/domain/use_cases/authentication_usecase.dart';
import 'package:flutter_smart_wallet/domain/use_cases/user_usecase.dart';
import 'package:flutter_smart_wallet/presentation/controller/app_controller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final AuthenticationUsecase authenticationUsecase;
  final UserUsecase userUsecase;
  final AppController appController;

  VerifyOtpController(this.authenticationUsecase,this.userUsecase,this.appController);

  RxString _nextScreen = ''.obs;
  RxString _verificationId = ''.obs;
  RxInt _resendToken = 0.obs;


  RxString get verificationId => _verificationId;

  RxString get nextScreen => _nextScreen;

  RxInt get resendToken => _resendToken;

  Future verifyOtp(String verificationId, String otpCode) async {
    appController.startLoading();
    try{
      final phoneCredential = await authenticationUsecase.verifyOtp(
          verificationId: verificationId, otpCode: otpCode);
      await authenticationUsecase.signInWithPhoneAuth(phoneCredential);
      final uid = userUsecase.getCurrentUser()?.uid;
      final user = await userUsecase.getUser(uid!);
      if (user != null){
        _nextScreen.value = RouteList.mainScreen;
        appController.finishLoading();
      }else {
        _nextScreen.value = RouteList.registerScreen;
        appController.finishLoading();
      }
    }on FirebaseAuthException catch (e){
      appController.finishLoading();
    }catch(e){
      appController.finishLoading();
    }
  }

  void resendOtp(String phoneNumber,int resendToken) {
    authenticationUsecase.verifyPhoneNumber(
        phoneNumber: phoneNumber.trim().replaceFirst('0', '+84'),
        forceResendingToken: resendToken,
        verificationComplete: (credential) {},
        codeSent: _codeSent,
        verificationFailed: _verificationFailed,
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout);
  }
  void _codeSent(String verificationId,int? otpCode){
    _verificationId.value = verificationId;
    _resendToken.value = otpCode ?? 0;
  }
  void _verificationFailed(FirebaseAuthException exception){

  }
  void _codeAutoRetrievalTimeout(String code){

  }

}
