import 'package:flutter_smart_wallet/common/configs/hive_config/hive_type_id.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

@HiveType(typeId: HiveTypeId.userType)
class WalletModel {
  @HiveField(0)
  final String? walletImage;
  @HiveField(1)
  final String? walletName;
  @HiveField(2)
  final int? balance;
  @HiveField(3)
  final int? walletType;
  @HiveField(4)
  final int? createAt;
  @HiveField(5)
  final int? lastUpdate;

  WalletModel(
      {this.walletImage,
      this.walletName,
      this.balance,
      this.walletType,
      this.createAt,
      this.lastUpdate});

  @override
  String toString() {
    return 'WalletModel{walletImage: $walletImage, walletName: $walletName, balance: $balance, walletType: $walletType, createAt: $createAt, lastUpdate: $lastUpdate}';
  }

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        walletImage: json['walletImage'] as String?,
        walletName: json['walletName'] as String?,
        balance: json['balance'] as int?,
        walletType: json['walletType'] as int?,
        createAt: json['createAt'] as int?,
        lastUpdate: json['lastUpdate'] as int?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'walletImage': walletImage,
        'walletName': walletName,
        'balance': balance,
        'walletType': walletType,
        'createAt': createAt,
        'lastUpdate': lastUpdate,
      };
}
