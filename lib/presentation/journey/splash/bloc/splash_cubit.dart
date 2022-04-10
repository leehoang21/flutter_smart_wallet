import 'dart:developer';
import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';
import 'package:flutter_smart_wallet/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/splash/bloc/splash_state.dart';

class SplashCubit extends BaseBloc<SplashState> {
  SplashCubit() : super(SplashState.initial());

  @override
  void onConnected() {
    InternetChecker.listenConnection((connection) {
      log('Connection change: $connection');
    });
  }

  Future<void> initial() async {
    if (await InternetChecker.hasConnection()) {
      log("connected");
    } else {
      log('disconnected');
    }
  }
}
