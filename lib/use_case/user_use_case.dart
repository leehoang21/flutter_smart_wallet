import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/model/user_model.dart';
import 'package:flutter_smart_wallet/repository/remote/user/user_remote_repository.dart';

class UserUseCase {
  final UserRemoteRepository _userRemoteRepository;

  UserUseCase(this._userRemoteRepository);
  String getUid() => _userRemoteRepository.getUserId();
  String getPhoneNumber() => _userRemoteRepository.getPhoneNumber();

  Future<bool> setUserFirestore(String userId, UserModel data) async {
    await hasconnection();
    try {
      final bool _result = await _userRemoteRepository.setUserFirestore(
        userId,
        data.toJson(),
      );
      return _result;
    } catch (_) {
      return false;
    }
  }

  Future<bool> hasUserFirestore(String userId) async {
    await hasconnection();
    try {
      final bool result = await _userRemoteRepository.hasUserFirestore(userId);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<void> hasconnection() async {
    bool _hasConnection = await _userRemoteRepository.hasconnection();
    if (!_hasConnection) {
      throw 'no_internet';
    }
  }
}
