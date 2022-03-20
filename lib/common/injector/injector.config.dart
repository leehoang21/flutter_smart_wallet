// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../presentation/bloc/language_bloc/language_bloc.dart' as _i5;
import '../../presentation/bloc/loading_bloc/loading_bloc.dart' as _i6;
import '../../presentation/bloc/snackbar_bloc/snackbar_bloc.dart' as _i7;
import '../../presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart'
    as _i3;
import '../../presentation/journey/wallet/screens/wallet_list_screen/bloc/wallet_list_cubit.dart'
    as _i10;
import '../../repository/remote/wallet_repository.dart' as _i8;
import '../../use_case/wallet_list_use_case.dart' as _i9;
import '../configs/firebase_config.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.BankSearchCubit>(_i3.BankSearchCubit());
  gh.singleton<_i4.FirebaseConfig>(_i4.FirebaseConfig());
  gh.singleton<_i5.LanguageBloc>(_i5.LanguageBloc());
  gh.singleton<_i6.LoadingBloc>(_i6.LoadingBloc());
  gh.singleton<_i7.SnackbarBloc>(_i7.SnackbarBloc());
  gh.factory<_i8.WalletRepository>(
      () => _i8.WalletRepositoryImpl(get<_i4.FirebaseConfig>()));
  gh.factory<_i9.WalletUseCase>(
      () => _i9.WalletUseCase(get<_i8.WalletRepository>()));
  gh.factory<_i10.WalletListCubit>(
      () => _i10.WalletListCubit(get<_i9.WalletUseCase>()));
  return get;
}
