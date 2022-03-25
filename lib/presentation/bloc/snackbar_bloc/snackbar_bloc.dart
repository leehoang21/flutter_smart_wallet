import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_state.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_type.dart';

class SnackbarBloc extends Cubit<SnackbarState> {
  SnackbarBloc() : super(InitialSnackbarState());

  Future<void> showSnackbar(
      {required String translationKey,
      required SnackBarType type,
      List<dynamic>? params,
      Key? key}) async {
    emit(
      ShowSnackBarState(
        translationKey: translationKey,
        type: type,
        params: params ?? [],
        key: key,
      ),
    );
  }
}
