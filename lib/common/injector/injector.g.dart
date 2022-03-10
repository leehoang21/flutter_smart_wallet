// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureCommon() {}
  @override
  void _configureRemoteDataSource() {}
  @override
  void _configureLocalDataSource() {}
  @override
  void _configureRepository() {}
  @override
  void _configureUseCase() {}
  @override
  void _configureBloc() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => LanguageBloc())
      ..registerSingleton((c) => LoadingBloc())
      ..registerSingleton((c) => SnackbarBloc())
      ..registerSingleton((c) => BankSearchCubit());
  }
}
