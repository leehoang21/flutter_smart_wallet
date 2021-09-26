import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/data/data_sources/user_remote_datasource.dart';
import 'package:flutter_smart_wallet/data/local_data_source/user_local_data_source.dart';
import 'package:flutter_smart_wallet/domain/enitities/user_entity.dart';
import 'package:flutter_smart_wallet/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSourece userRemoteDatasource;
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl(this.userRemoteDatasource, this.userLocalDataSource);

  @override
  Future createUser(UserEntity userEntity,String uid) async {
    final userModel = userEntity.toModel();
    await userRemoteDatasource.createUser(userModel,uid);
    await userLocalDataSource.saveUserInfo(userEntity);
  }

  @override
  Future<UserEntity?> getUser(String uid) async {
    if (userLocalDataSource.hasUserInfo()) {
      return userLocalDataSource.getUser();
    }
    final user = await userRemoteDatasource.getUser(uid);
    if (user != null) {
      await userLocalDataSource.saveUserInfo(user);
    }
  }

  @override
  User? getCurrentUser() => userRemoteDatasource.getCurrentUser();
}
