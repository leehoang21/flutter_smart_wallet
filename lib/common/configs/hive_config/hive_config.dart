import 'package:flutter_smart_wallet/common/configs/hive_config/hive_box_name.dart';
import 'package:flutter_smart_wallet/domain/enitities/user_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
class HiveConfig {
  late Box<UserEntity> userBox;

  Future<void> init() async {
   await Hive.initFlutter();
   Hive.registerAdapter(UserEntityAdapter());
   await openBox();
  }
  Future openBox()async{
    userBox = await Hive.openBox(HiveBoxName.userBox);
  }

}
