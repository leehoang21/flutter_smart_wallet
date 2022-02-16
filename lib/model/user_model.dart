import 'package:flutter_smart_wallet/common/configs/hive_config/hive_type_id.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
@HiveType(typeId :HiveTypeId.userType)
class UserModel {
  @HiveField(0)
  final String? accountName;
  @HiveField(1)
  final String? avatar;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? phone;
  @HiveField(4)
  final int? createAt;
  @HiveField(5)
  final int? lastUpdate;

  UserModel(
      {this.accountName,
        this.avatar,
        this.email,
        this.phone,
        this.createAt,
        this.lastUpdate});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}