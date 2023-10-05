import 'package:flutter_smart_wallet/model/user_model.dart';
import 'package:flutter_smart_wallet/repository/remote/user/user_remote_repository.dart';

import '../repository/local/user_local_repository.dart';

class UserUseCase {
  final UserRemoteRepository _userRemoteRepository;
  final UserLocalRepository _userLocalRepository;

  UserUseCase(this._userRemoteRepository, this._userLocalRepository);

  Future<String> getUid() async => await _userLocalRepository.getUser() != null
      ? (await _userLocalRepository.getUser())!.uId ?? ""
      : _userRemoteRepository.getUserId();

  Future<String> getPhoneNumber() async =>
      await _userLocalRepository.getUser() != null
          ? (await _userLocalRepository.getUser())!.phoneNumber
          : _userRemoteRepository.getPhoneNumber();

  Future<bool> setUserFirestore(UserModel data) async {
    await hasconnection();
    try {
      if (await hasUserFirestore()) {
        await _userLocalRepository.saveUser(data);
        return true;
      }
      final bool _result = await _userRemoteRepository.setUserFirestore(
        data.toJson(),
      );

      if (_result) {
        await _userLocalRepository.saveUser(data);
      }
      return _result;
    } catch (_) {
      return false;
    }
  }

  Future<bool> hasUserFirestore() async {
    await hasconnection();
    try {
      final UserModel? user = await _userLocalRepository.getUser();
      if (user != null) {
        return true;
      }
      final bool result = await _userRemoteRepository.hasUserFirestore();
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<UserModel> getUser() async {
    await hasconnection();
    try {
      final UserModel? user = await _userLocalRepository.getUser();
      if (user != null) {
        return user;
      }
      return _userRemoteRepository.getUserFirestore();
    } catch (_) {
      return UserModel(
        phoneNumber: '',
        uId: null,
      );
    }
  }

  Future<void> hasconnection() async {
    bool _hasConnection = await _userRemoteRepository.hasconnection();
    if (!_hasConnection) {
      throw 'no_internet';
    }
  }
}
