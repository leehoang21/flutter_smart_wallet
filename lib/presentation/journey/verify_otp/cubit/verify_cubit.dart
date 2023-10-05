import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/use_case/authentication_use_case.dart';
import 'package:flutter_smart_wallet/use_case/user_use_case.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit(this.authenticationUseCase, this.userUseCase)
      : super(VerifyInitial());
  final AuthenticationUseCase authenticationUseCase;
  final UserUseCase userUseCase;
  String? _verificationId;
  int? _reSenToken;
  String? _phoneNumber;
  final TextEditingController pinCodeController = TextEditingController();

  StreamSubscription? _streamSubscription;
  final Duration _time = Duration(seconds: 1);
  static final Duration _timeMax = Duration(seconds: 300);

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

  void verifyOtp() async {
    try {
      String smsCode = pinCodeController.text;
      await authenticationUseCase.userCredential(_verificationId!, smsCode);

      bool _isUserFirestore = await userUseCase.hasUserFirestore();

      emit(VerifySuccess(state.timeResend, _isUserFirestore));

      _streamSubscription?.cancel();
    } catch (e) {
      emit(VerifyFailure(
        error: e.toString(),
        timeResend: state.timeResend,
      ));
    }
  }

  void saveUser() async {
    await userUseCase.setUserFirestore(
      await userUseCase.getUser(),
    );
  }

  String _handleExceptionVerificationFailed(String code) {
    switch (code) {
      case 'network-request-failed':
        return 'network_request_failed';
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
    emit(Verifyloaded(stringTimeFormat(_timeMax)));
    _streamSubscription?.cancel();

    _streamSubscription = changeTime().listen((event) {
      if (event == const Duration()) {
        _streamSubscription?.cancel();
      } else {
        emit(
          Verifyloaded(stringTimeFormat(event)),
        );
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
      timeOut() ? '0:00:00' : time.toString().split(".").first.substring(2);

  bool isStarted() {
    return state.timeResend != '0:05:00';
  }
}
