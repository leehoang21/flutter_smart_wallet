import 'package:bloc/bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_event.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class SnackbarBloc extends Bloc<SnackbarEvent, SnackbarState> {
  SnackbarBloc() : super(InitialSnackbarState());

  SnackbarState get initialState => InitialSnackbarState();

  Stream<SnackbarState> mapEventToState(SnackbarEvent event) async* {
    if (event is ShowSnackbar) {
      yield ShowSnackBarState(
        translationKey: event.translationKey,
        type: event.type,
        params: event.params ?? [],
        key: event.key,
      );
    }
  }
}
