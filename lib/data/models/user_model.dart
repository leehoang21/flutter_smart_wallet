import 'package:flutter_smart_wallet/domain/enitities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {String? accountName,
      String? avatar,
      String? email,
      String? phone,
      int? createAt,
      int? lastUpdate})
      : super(
            accountName: accountName,
            avatar: avatar,
            email: email,
            phone: phone,
            createAt: createAt,
            lastUpdate: lastUpdate);

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      accountName: json['account_name'],
      avatar: json['avatar'],
      email: json['email'],
      phone: json['phone'],
      createAt: json['create_at'],
      lastUpdate: json['last_update']
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'account_name' : accountName,
      'avatar' : avatar,
      'create_at' : createAt,
      'email' : email,
      'last_update' : lastUpdate,
      'phone' : phone
    };
  }
}
