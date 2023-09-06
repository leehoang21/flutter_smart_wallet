import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_smart_wallet/common/configs/dio_config/dio_api_client.dart';
import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/main/bloc/tab_manger_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/cubit/register_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/add_photo/add_photo_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create/create_transaction_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/cubit/verify_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/wallet/screens/create_wallet_screen/bloc/create_wallet_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/wallet/screens/wallet_list_screen/bloc/wallet_list_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/cubit/pick_image_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/update_avatar.dart/cubit/update_avatar_cubit.dart';
import 'package:flutter_smart_wallet/repository/remote/transaction/transaction_remote_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/transaction/transaction_remote_repository_impl.dart';
import 'package:flutter_smart_wallet/repository/remote/user/user_remote_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/user/user_remote_repository_impl.dart';
import 'package:flutter_smart_wallet/repository/local/pick_image_local_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/up_and_down_storage_remote_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/vn_bank_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/wallet_repository.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';
import 'package:flutter_smart_wallet/use_case/transaction_use_case.dart';
import 'package:flutter_smart_wallet/use_case/user_use_case.dart';
import 'package:flutter_smart_wallet/use_case/vn_bank_use_case.dart';
import 'package:flutter_smart_wallet/use_case/wallet_list_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../presentation/journey/splash/bloc/splash_cubit.dart';
import '../../repository/remote/authentication_repository.dart';
import '../../use_case/authentication_use_case.dart';

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
    getIt.registerFactory(
      () => BankSearchCubit(getIt.get<VnBankUseCase>()),
    );
    getIt.registerFactory(
      () => PickImageCubit(getIt.get<PickImageUseCase>()),
    );
    getIt.registerFactory<WalletListCubit>(
      () => WalletListCubit(getIt.get<WalletUseCase>()),
    );
    getIt.registerFactory(
      () => CreateTransactionBloc(
        getIt.get<TransactionUseCase>(),
        getIt.get<UserUseCase>(),
        getIt.get<PickImageUseCase>(),
        getIt.get<SnackbarBloc>(),
        getIt.get<LoadingBloc>(),
      ),
    );
    getIt.registerFactory(
      () => RegisterCubit(
        useCase: getIt.get<UserUseCase>(),
        pickImageUseCase: getIt.get<PickImageUseCase>(),
      ),
    );
    getIt.registerFactory(
      () => AddPhotoBloc(
        getIt.get<PickImageUseCase>(),
      ),
    );
    getIt.registerFactory<CreateWalletCubit>(
      () => CreateWalletCubit(
          walletUseCase: getIt.get<WalletUseCase>(),
          snackbarBloc: getIt.get<SnackbarBloc>()),
    );
    getIt.registerFactory<UpdateAvatarCubit>(
      () => UpdateAvatarCubit(
        userUseCase: getIt.get<UserUseCase>(),
        pickImageUseCase: getIt.get<PickImageUseCase>(),
      ),
    );
    getIt.registerFactory(
      () => SplashCubit(),
    );
    getIt.registerFactory(
      () => VerifyCubit(
        getIt.get<AuthenticationUseCase>(),
        getIt.get<UserUseCase>(),
      ),
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
    getIt.registerFactory<TransactionUseCase>(
      () => TransactionUseCase(
        getIt.get<TransactionRemoteRepository>(),
      ),
    );
    getIt.registerFactory<UserUseCase>(
      () => UserUseCase(
        getIt.get<UserRemoteRepository>(),
      ),
    );
  }

  static void _configureRepository() {
    getIt.registerFactory(
      () => VnBankRepository(getIt.get<DioApiClient>()),
    );
    getIt.registerFactory<WalletRepository>(
      () => WalletRepositoryImpl(getIt.get<FirebaseConfig>()),
    );
    getIt.registerFactory<TransactionRemoteRepository>(
      () => TransactionRemoteRepositoryImpl(),
    );
    getIt.registerFactory<UserRemoteRepository>(
      () => UserRemoteRepositoryImpl(
        getIt.get<FirebaseAuth>(),
      ),
    );
    getIt.registerFactory(
      () => PickImageLocalRepository(),
    );
    getIt.registerFactory(
      () => UpDownStorageRemoteRepository(),
    );
    getIt.registerFactory<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(auth: getIt.get<FirebaseAuth>()),
    );
  }

  static void _configCommon() {
    getIt.registerLazySingleton<FirebaseConfig>(() => FirebaseConfig());
    getIt.registerLazySingleton<DioApiClient>(
      () => DioApiClient(),
    );
    getIt.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    );
    getIt.registerLazySingleton(
      () => FirebaseStorage.instance,
    );
  }
}
