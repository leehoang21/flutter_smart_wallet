import 'package:flutter_smart_wallet/repository/remote/user/user_remote_repository.dart';

class UserUseCase {
  final UserRemoteRepository _userRemoteRepository;

  UserUseCase(this._userRemoteRepository);
  String getUid() => _userRemoteRepository.getUserId();
}
