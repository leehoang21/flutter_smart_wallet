import 'package:flutter_smart_wallet/domain/enitities/user_entity.dart';
import 'package:flutter_smart_wallet/domain/use_cases/user_usecase.dart';
import 'package:flutter_smart_wallet/presentation/controller/app_controller.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final UserUsecase userUsecase;
  final AppController appController;

  RegisterController(this.userUsecase,this.appController);
  RxBool _registerSuccess = false.obs;


  RxBool get registerSuccess => _registerSuccess;

  Future createAccount(String? name,String? email,String?phoneNumber) async{
    final userEntity = UserEntity(
      accountName: name,
      email: email,
      phone: phoneNumber,
      createAt: DateTime.now().millisecondsSinceEpoch,
      lastUpdate:  DateTime.now().millisecondsSinceEpoch
    );
    final uid = userUsecase.getCurrentUser()?.uid;
    await userUsecase.createUser(userEntity,uid!);
    _registerSuccess.value = true;
  }

}
