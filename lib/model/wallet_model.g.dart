// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletModelAdapter extends TypeAdapter<WalletModel> {
  @override
  final int typeId = 1;

  @override
  WalletModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WalletModel(
      walletImage: fields[0] as String?,
      walletName: fields[1] as String?,
      balance: fields[2] as int?,
      walletType: fields[3] as int?,
      createAt: fields[4] as int?,
      lastUpdate: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, WalletModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.walletImage)
      ..writeByte(1)
      ..write(obj.walletName)
      ..writeByte(2)
      ..write(obj.balance)
      ..writeByte(3)
      ..write(obj.walletType)
      ..writeByte(4)
      ..write(obj.createAt)
      ..writeByte(5)
      ..write(obj.lastUpdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => WalletModel(
      walletImage: json['walletImage'] as String?,
      walletName: json['walletName'] as String?,
      balance: json['balance'] as int?,
      walletType: json['walletType'] as int?,
      createAt: json['createAt'] as int?,
      lastUpdate: json['lastUpdate'] as int?,
    );

Map<String, dynamic> _$WalletModelToJson(WalletModel instance) =>
    <String, dynamic>{
      'walletImage': instance.walletImage,
      'walletName': instance.walletName,
      'balance': instance.balance,
      'walletType': instance.walletType,
      'createAt': instance.createAt,
      'lastUpdate': instance.lastUpdate,
    };
