import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/common/configs/hive_config/hive_config.dart';
import 'package:flutter_smart_wallet/data/data_sources/authentication_datasource.dart';
import 'package:flutter_smart_wallet/data/data_sources/user_remote_datasource.dart';
import 'package:flutter_smart_wallet/data/local_data_source/user_local_data_source.dart';
import 'package:flutter_smart_wallet/data/repositories_impl/authentication_repository_impl.dart';
import 'package:flutter_smart_wallet/data/repositories_impl/user_repository_impl.dart';
import 'package:flutter_smart_wallet/domain/repositories/authentication_repository.dart';
import 'package:flutter_smart_wallet/domain/repositories/user_repository.dart';
import 'package:flutter_smart_wallet/domain/use_cases/authentication_usecase.dart';
import 'package:flutter_smart_wallet/domain/use_cases/user_usecase.dart';
import 'package:flutter_smart_wallet/presentation/controller/app_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FirebaseConfig());
    Get.put(HiveConfig());
    Get.put(AppController());
    Get.put<AuthenticationDataSource>(AuthenticationDataSource());
    Get.put<AuthenticationRepository>(
        AuthenticationRepositoryImpl(Get.find<AuthenticationDataSource>()));
    Get.put<AuthenticationUsecase>(
        AuthenticationUsecase(Get.find<AuthenticationRepository>()));
    Get.put<UserRemoteDataSourece>(
        UserRemoteDataSourece(Get.find<FirebaseConfig>()));
    Get.put(UserLocalDataSource(Get.find<HiveConfig>()));
    Get.put<UserRepository>(UserRepositoryImpl(
        Get.find<UserRemoteDataSourece>(), Get.find<UserLocalDataSource>()));
    Get.put<UserUsecase>(UserUsecase(Get.find<UserRepository>()));
  }
}
