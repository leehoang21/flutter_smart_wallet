import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_smart_wallet/common/configs/hive_config/hive_type_id.dart';
import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: HiveTypeId.userType)
class UserModel {
  @HiveField(0)
  final String userName;
  // email người dùng nếu có
  @HiveField(1)
  final String? email;
  // url avatar nếu có
  @HiveField(2)
  final String? avatar;
  //số điện thoại người dùng
  @HiveField(3)
  final String phoneNumber;

  const UserModel({
    required this.phoneNumber,
    this.userName = '',
    this.email,
    this.avatar,
  });

  UserModel copyWith({
    String? userName,
    String? email,
    String? avatar,
  }) {
    return UserModel(
      phoneNumber: phoneNumber,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }

  factory UserModel.fromDocument(DocumentSnapshot snapshot) {
    if (snapshot.data() == null) {
      throw Exception;
    }
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      userName: data['userName'] as String,
      email: data['email'] as String?,
      avatar: data['avatar'] as String?,
      phoneNumber: data['phoneNumber'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'userName': userName,
      'avatar': avatar,
      'email': email,
    };
  }
}
