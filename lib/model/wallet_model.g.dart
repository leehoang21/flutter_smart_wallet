// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => WalletModel(
      balance: json['balance'] as int,
      createAt: json['createAt'] as int,
      lastUpdate: json['lastUpdate'] as int,
      walletImage: json['walletImage'] as String,
      walletName: json['walletName'] as String,
      walletType: json['walletType'] as int,
    );

Map<String, dynamic> _$WalletModelToJson(WalletModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'createAt': instance.createAt,
      'lastUpdate': instance.lastUpdate,
      'walletImage': instance.walletImage,
      'walletName': instance.walletName,
      'walletType': instance.walletType,
    };
