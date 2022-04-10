import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/use_case/authentication_use_case.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit(this.authenticationUseCase) : super(VerifyInitial());
  final AuthenticationUseCase authenticationUseCase;
  late String _verificationId;
  int? _reSenToken;
  String? _phoneNumber;
  late StreamSubscription _streamSubscription;
  final Duration _time = Duration(seconds: 1);
  static final Duration _timeMax = Duration(seconds: 5 * 60);

  void addPhoneNumber(String? phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  Future<void> verifyPhonenumber() async {
    if (isNullEmpty(_phoneNumber)) {
      VerifyFailure(
        error: 'missing_phone',
        timeResend: state.timeResend,
      );
    }

    emit(VerifyLoading(state.timeResend));

    await authenticationUseCase.verifyPhoneNumber(
      phoneNumber: _phoneNumber!,
      verificationFailed: (e) {
        print(e.code);
        emit(
          VerifyFailure(
            error: _handleExceptionVerificationFailed(e.code),
            timeResend: state.timeResend,
          ),
        );
      },
      codeSent: (verificationId, token) async {
        _verificationId = verificationId;

        _reSenToken = token;

        emit(Verifyloaded(state.timeResend));
        startTimer();
      },
      reSendToken: _reSenToken,
    );
  }

  void verifyOtp(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      await authenticationUseCase.userCredential(credential);
      if (authenticationUseCase.checkUserIsExist()) {
        emit(VerifySuccess(state.timeResend));
      }
    } catch (_) {
      emit(VerifyFailure(
        error: 'invalid_otp',
        timeResend: state.timeResend,
      ));
    }
  }

  String _handleExceptionVerificationFailed(String code) {
    switch (code) {
      case 'invalid-phone-number':
        return 'invalid_phone';
      case 'missing-phone-number':
        return 'missing_phone';
      case 'quota-exceeded':
        return 'quota_exceeded';
      case 'user-disabled':
        return 'user_disabled';
      case 'captcha-check-failed':
        return 'captcha_check_failed';
      default:
        return 'error_message';
    }
  }

  void startTimer() {
    _streamSubscription = changeTime().listen((event) {
      emit(
        Verifyloaded(stringTimeFormat(event)),
      );

      if (timeOut()) {
        _streamSubscription.cancel();
      }
    });
  }

  Stream<Duration> changeTime() {
    return Stream.periodic(
      _time,
      (computationCount) {
        return _timeMax - _time - Duration(seconds: computationCount);
      },
    );
  }

  bool timeOut() => state.timeResend == '0:00:00';

  String stringTimeFormat(Duration time) =>
      timeOut() ? '0:00:00' : time.toString().split(".").first;
}
