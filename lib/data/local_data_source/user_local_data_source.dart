import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/configs/hive_config/hive_config.dart';
import 'package:flutter_smart_wallet/domain/enitities/user_entity.dart';

class UserLocalDataSource{
  final HiveConfig hiveConfig;

  UserLocalDataSource(this.hiveConfig);

  bool hasUserInfo(){
    return hiveConfig.userBox.containsKey(DefaultEnvironment.profile);
  }

  Future saveUserInfo(UserEntity userEntity)async {
    await hiveConfig.userBox.put(DefaultEnvironment.profile, userEntity);
  }

  UserEntity? getUser(){
    return hiveConfig.userBox.get(DefaultEnvironment.profile);
  }
}