import 'package:flutter_smart_wallet/common/configs/hive_config/hive_box_name.dart';
import 'package:flutter_smart_wallet/model/user_infomation_model.dart';
import 'package:flutter_smart_wallet/model/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
  late Box<UserModel> userBox;
  late Box<UserInfomationModel> userInfomationBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(UserInfomationModelAdapter());
    await openBox();
  }

  Future openBox() async {
    userBox = await Hive.openBox(HiveBoxName.userBox);
    userInfomationBox = await Hive.openBox(HiveBoxName.userInfomationBox);
  }
}
