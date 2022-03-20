// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../presentation/bloc/language_bloc/language_bloc.dart' as _i5;
import '../../presentation/bloc/loading_bloc/loading_bloc.dart' as _i6;
import '../../presentation/bloc/snackbar_bloc/snackbar_bloc.dart' as _i8;
import '../../presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart'
    as _i3;
import '../../presentation/widgets/pick_image/cubit/pick_image_cubit.dart'
    as _i11;
import '../../repository/local/pick_image_local_repository.dart' as _i7;
import '../../repository/remote/up_and_down_storage_remote_repository.dart'
    as _i9;
import '../../use_case/pick_image_use_case.dart' as _i10;
import '../utils/compress.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.BankSearchCubit>(_i3.BankSearchCubit());
  gh.factory<_i4.Compress>(() => _i4.Compress());
  gh.singleton<_i5.LanguageBloc>(_i5.LanguageBloc());
  gh.singleton<_i6.LoadingBloc>(_i6.LoadingBloc());
  gh.factory<_i7.PickImageLocalRepository>(
      () => _i7.PickImageLocalRepository());
  gh.singleton<_i8.SnackbarBloc>(_i8.SnackbarBloc());
  gh.factory<_i9.UpDownStorageRemoteRepository>(
      () => _i9.UpDownStorageRemoteRepository());
  gh.factory<_i10.PickImageUseCase>(() => _i10.PickImageUseCase(
      imagePathStorage: get<String>(),
      compress: get<_i4.Compress>(),
      localRepository: get<_i7.PickImageLocalRepository>(),
      remoteRepository: get<_i9.UpDownStorageRemoteRepository>()));
  gh.singleton<_i11.PickImageCubit>(
      _i11.PickImageCubit(get<_i10.PickImageUseCase>()));
  return get;
}
