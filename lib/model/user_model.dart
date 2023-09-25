import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_smart_wallet/common/configs/hive_config/hive_type_id.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: HiveTypeId.userType)
class UserModel {
  final String userName;
  final String? email;
  final String? avatar;
  final String phoneNumber;
  final String? uId;

  const UserModel({
    required this.phoneNumber,
    this.userName = '',
    this.email,
    this.avatar,
    required this.uId,
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
      uId: uId,
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
      uId: data['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'userName': userName,
      'avatar': avatar,
      'email': email,
      'userId': uId,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      phoneNumber: json['phoneNumber'] as String,
      userName: json['userName'] as String,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      uId: json['userId'] as String?,
    );
  }
}
