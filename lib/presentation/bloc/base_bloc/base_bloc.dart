import 'package:flutter_bloc/flutter_bloc.dart';

class BaseBloc<T> extends Cubit<T> {
  BaseBloc(T initialState) : super(initialState) {
    onConnected();
  }

  void onConnected() {}
}
