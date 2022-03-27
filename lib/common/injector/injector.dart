import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/common/configs/dio_config/dio_api_client.dart';
import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/main/bloc/tab_manger_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/cubit/register_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/wallet/screens/create_wallet_screen/bloc/create_wallet_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/wallet/screens/wallet_list_screen/bloc/wallet_list_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/cubit/pick_image_cubit.dart';
import 'package:flutter_smart_wallet/repository/local/pick_image_local_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/register_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/up_and_down_storage_remote_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/vn_bank_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/wallet_repository.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';
import 'package:flutter_smart_wallet/use_case/register_use_case.dart';
import 'package:flutter_smart_wallet/use_case/vn_bank_use_case.dart';
import 'package:flutter_smart_wallet/use_case/wallet_list_use_case.dart';
import 'package:get_it/get_it.dart';

class Injector {
  static final GetIt getIt = GetIt.instance;

  static void configDependency() {
    _configureBloc();
    _configureUseCase();
    _configureRepository();
    _configCommon();
  }

  static void _configureBloc() {
    getIt.registerSingleton(
      LoadingBloc(),
    );
    getIt.registerSingleton(
      LanguageBloc(),
    );
    getIt.registerSingleton(
      SnackbarBloc(),
    );
    getIt.registerFactory(
      () => TabMangerCubit(),
    );
    getIt.registerFactory<BankSearchCubit>(
          () => BankSearchCubit(getIt.get<VnBankUseCase>()),
    );
    getIt.registerFactory(
      () => PickImageCubit(getIt.get<PickImageUseCase>()),
    );
    getIt.registerFactory<WalletListCubit>(
      () => WalletListCubit(getIt.get<WalletUseCase>()),
    );
    getIt.registerFactory(
      () => RegisterCubit(
        registerUseCase: getIt.get<RegisterUseCase>(),
      ),
    );
    getIt.registerFactory<CreateWalletCubit>(
      () => CreateWalletCubit(
          walletUseCase: getIt.get<WalletUseCase>(),
          snackbarBloc: getIt.get<SnackbarBloc>()),
    );
  }

  static void _configureUseCase() {
    getIt.registerFactory(
      () => PickImageUseCase(
        localRepository: getIt.get<PickImageLocalRepository>(),
        remoteRepository: getIt.get<UpDownStorageRemoteRepository>(),
      ),
    );
    getIt.registerFactory<VnBankUseCase>(
          () => VnBankUseCase(getIt.get<VnBankRepository>()),
    );
    getIt.registerFactory<WalletUseCase>(
      () => WalletUseCase(getIt.get<WalletRepository>()),
    );
    getIt.registerFactory(
      () => RegisterUseCase(getIt.get<RegisterRepository>()),
    );
  }

  static void _configureRepository() {
    getIt.registerFactory(
          () => VnBankRepository(DioApiClient()),
    );
    getIt.registerFactory<WalletRepository>(
      () => WalletRepositoryImpl(getIt.get<FirebaseConfig>()),
    );
    getIt.registerFactory(
      () => PickImageLocalRepository(),
    );
    getIt.registerFactory(
      () => UpDownStorageRemoteRepository(),
    );
    getIt.registerFactory(
      () => RegisterRepository(),
    );
  }

  static void _configCommon() {
    getIt.registerLazySingleton<FirebaseConfig>(() => FirebaseConfig());
    getIt.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    );
  }
}
