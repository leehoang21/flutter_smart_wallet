import 'dart:developer';
import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';
import 'package:flutter_smart_wallet/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/splash/bloc/splash_state.dart';

import '../../../../use_case/user_use_case.dart';

class SplashCubit extends BaseBloc<SplashState> {
  SplashCubit(this._userUseCase) : super(SplashState.initial());
  final UserUseCase _userUseCase;

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 1));
    if (await _userUseCase.hasUserFirestore()) {
      emit(MainState());
    } else {
      emit(LoginState());
    }
  }

  @override
  void onConnected() {
    InternetChecker.listenConnection((connection) {
      log('Connection change: $connection');
    });
    checkLogin();
  }

  Future<void> initial() async {
    if (await InternetChecker.hasConnection()) {
      log("connected");
    } else {
      log('disconnected');
    }
  }
}
