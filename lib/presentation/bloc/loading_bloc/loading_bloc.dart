import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/loading_bloc/loading_state.dart';

class LoadingBloc extends Cubit<LoadingState> {
  LoadingBloc()
      : super(
          LoadingState.initial(),
        );

  Future<void> startLoading() async {
    emit(
      state.copyWith(status: LoadingStatus.loading),
    );
  }

  Future<void> finishLoading() async {
    emit(
      state.copyWith(status: LoadingStatus.finish),
    );
  }
}
