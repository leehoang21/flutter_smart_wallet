import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/data/data_sources/authentication_datasource.dart';
import 'package:flutter_smart_wallet/data/repositories_impl/authentication_repository_impl.dart';
import 'package:flutter_smart_wallet/domain/repositories/authentication_repository.dart';
import 'package:flutter_smart_wallet/domain/use_cases/authentication_usecase.dart';
import 'package:flutter_smart_wallet/presentation/controller/app_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FirebaseConfig());
    Get.put(AppController());
    Get.put<AuthenticationDataSource>(AuthenticationDataSource());
    Get.put<AuthenticationRepository>(
        AuthenticationRepositoryImpl(Get.find<AuthenticationDataSource>()));
    Get.put<AuthenticationUsecase>(
        AuthenticationUsecase(Get.find<AuthenticationRepository>()));
  }
}
