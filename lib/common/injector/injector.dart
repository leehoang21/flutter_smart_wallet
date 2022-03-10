import 'package:flutter_smart_wallet/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/screens/bank_list_screen/bloc/bank_search_cubit.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();
  static void setup({bool forTest = false}) {
    container = KiwiContainer();
    final injector = _$Injector();
    if (forTest) {
      injector._configureMock();
    }
    injector._configure();
  }

  static final resolve = container.resolve;

  void _configureMock() {}
  void _configure() {
    _configureCommon();
    _configureRemoteDataSource();
    _configureLocalDataSource();
    _configureRepository();
    _configureUseCase();
    _configureBloc();
  }

  void _configureCommon();
  void _configureRemoteDataSource();
  void _configureLocalDataSource();
  void _configureRepository();
  void _configureUseCase();

  @Register.singleton(LanguageBloc)
  @Register.singleton(LoadingBloc)
  @Register.singleton(SnackbarBloc)
  @Register.singleton(BankSearchCubit)
  void _configureBloc();
}
