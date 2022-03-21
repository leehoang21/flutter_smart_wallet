// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../presentation/bloc/language_bloc/language_bloc.dart' as _i6;
import '../../presentation/bloc/loading_bloc/loading_bloc.dart' as _i7;
import '../../presentation/bloc/snackbar_bloc/snackbar_bloc.dart' as _i9;
import '../../presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart'
    as _i4;
import '../../presentation/journey/transaction/create/bloc/add_photo_bloc/add_photo_bloc.dart'
    as _i3;
import '../../presentation/journey/transaction/create/bloc/create_transaction_bloc/create_transaction_bloc.dart'
    as _i13;
import '../../presentation/widgets/pick_image/cubit/pick_image_cubit.dart'
    as _i15;
import '../../repository/local/pick_image_local_repository.dart' as _i8;
import '../../repository/remote/transaction_remote_repository.dart' as _i10;
import '../../repository/remote/up_and_down_storage_remote_repository.dart'
    as _i12;
import '../../use_case/pick_image_use_case.dart' as _i14;
import '../../use_case/transaction_use_case.dart' as _i11;
import '../utils/compress.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AddPhotoBloc>(() => _i3.AddPhotoBloc());
  gh.singleton<_i4.BankSearchCubit>(_i4.BankSearchCubit());
  gh.factory<_i5.Compress>(() => _i5.Compress());
  gh.singleton<_i6.LanguageBloc>(_i6.LanguageBloc());
  gh.singleton<_i7.LoadingBloc>(_i7.LoadingBloc());
  gh.factory<_i8.PickImageLocalRepository>(
      () => _i8.PickImageLocalRepository());
  gh.singleton<_i9.SnackbarBloc>(_i9.SnackbarBloc());
  gh.singleton<_i10.TransactionRemoteRepository>(
      _i10.TransactionRemoteRepository());
  gh.factory<_i11.TransactionUseCase>(
      () => _i11.TransactionUseCase(get<_i10.TransactionRemoteRepository>()));
  gh.factory<_i12.UpDownStorageRemoteRepository>(
      () => _i12.UpDownStorageRemoteRepository());
  gh.factory<_i13.CreateTransactionBloc>(() => _i13.CreateTransactionBloc(
      get<_i11.TransactionUseCase>(),
      get<_i3.AddPhotoBloc>(),
      get<_i9.SnackbarBloc>()));
  gh.factory<_i14.PickImageUseCase>(() => _i14.PickImageUseCase(
      imagePathStorage: get<String>(),
      compress: get<_i5.Compress>(),
      localRepository: get<_i8.PickImageLocalRepository>(),
      remoteRepository: get<_i12.UpDownStorageRemoteRepository>()));
  gh.singleton<_i15.PickImageCubit>(
      _i15.PickImageCubit(get<_i14.PickImageUseCase>()));
  return get;
}
