// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../presentation/bloc/language_bloc/language_bloc.dart' as _i4;
import '../../presentation/bloc/loading_bloc/loading_bloc.dart' as _i5;
import '../../presentation/bloc/snackbar_bloc/snackbar_bloc.dart' as _i6;
import '../../presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.BankSearchCubit>(_i3.BankSearchCubit());
  gh.singleton<_i4.LanguageBloc>(_i4.LanguageBloc());
  gh.singleton<_i5.LoadingBloc>(_i5.LoadingBloc());
  gh.singleton<_i6.SnackbarBloc>(_i6.SnackbarBloc());
  return get;
}