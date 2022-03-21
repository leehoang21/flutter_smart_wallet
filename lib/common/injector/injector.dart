import 'package:flutter_smart_wallet/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/main/bloc/tab_manger_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/cubit/pick_image_cubit.dart';
import 'package:flutter_smart_wallet/repository/remote/vn_bank_repository.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';
import 'package:flutter_smart_wallet/use_case/vn_bank_usse_case.dart';
import 'package:get_it/get_it.dart';

class Injector {
  static final GetIt getIt = GetIt.instance;

  static void configDependency() {
    _configureBloc();
    _configureUseCase();
    _configureRepository();
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
      () => BankSearchCubit(),
    );
    getIt.registerFactory(
      () => PickImageCubit(getIt.get<PickImageUseCase>()),
    );
  }

  static void _configureUseCase() {
    // getIt.registerFactory(() => PickImageUseCase(imagePathStorage: imagePathStorage, compress: compress, localRepository: localRepository, remoteRepository: remoteRepository))
    getIt.registerFactory(
      () => VnBankUseCase(),
    );
  }

  static void _configureRepository() {
    getIt.registerFactory(
      () => VnBankRepository(),
    );
  }
}
