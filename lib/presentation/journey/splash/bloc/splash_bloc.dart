import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';
import 'package:flutter_smart_wallet/presentation/bloc/base_bloc/base_bloc.dart';

class SplashBloc extends BaseBloc<SplashState> {
  SplashBloc() : super(SplashState.initial());

  @override
  void onConnected() {
    InternetChecker.listenConnection((connection) {
      log('Connection change: $connection');
    });
  }

  Future<void> initiaal() async {
    if (await InternetChecker.hasConnection()) {
      log("connected");
    } else {
      log('disconnected');
    }
  }
}

class SplashState extends Equatable {
  SplashState();

  factory SplashState.initial() => SplashState();
  @override
  List<Object?> get props => [];
}
