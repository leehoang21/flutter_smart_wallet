import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';
import 'package:flutter_smart_wallet/model/user_model.dart';
import 'package:flutter_smart_wallet/repository/remote/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository registerRepository;
  RegisterUseCase(this.registerRepository);

  Future<bool> addUser(String userId, UserModel data) async {
    bool _hasConnection = await InternetChecker.hasConnection();
    if (_hasConnection) {
      try {
        await registerRepository.addUser(userId, data.toJson());
        return true;
      } catch (e) {
        throw e.toString();
      }
    } else {
      throw 'No internet connection';
    }
  }

  Future<bool> hasUserFirebase(String userId) async {
    final Map<String, dynamic>? result =
        await registerRepository.fetchUser(userId);
    if (result == null) {
      return false;
    } else {
      return true;
    }
  }
}
