import 'package:flutter_smart_wallet/model/user_model.dart';
import 'package:flutter_smart_wallet/repository/remote/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository registerRepository;
  RegisterUseCase(this.registerRepository);

  Future<bool> addUser(String userId, UserModel data) async {
    bool _hasConnection = await registerRepository.hasconnection();
    if (_hasConnection) {
      try {
        await registerRepository.addUser(userId, data.toJson());
        return true;
      } catch (e) {
        throw 'error_message';
      }
    } else {
      throw 'no_internet';
    }
  }

  Future<bool> hasUserFirestore(String userId) async {
    try {
      final bool result = await registerRepository.hasUserFirestore(userId);
      return result;
    } catch (_) {
      return false;
    }
  }
}
