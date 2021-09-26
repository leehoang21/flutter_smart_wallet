// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 1;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      accountName: fields[0] as String?,
      avatar: fields[1] as String?,
      email: fields[2] as String?,
      phone: fields[3] as String?,
      createAt: fields[4] as int?,
      lastUpdate: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.accountName)
      ..writeByte(1)
      ..write(obj.avatar)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
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
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
    accountName: json['accountName'] as String?,
    avatar: json['avatar'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    createAt: json['createAt'] as int?,
    lastUpdate: json['lastUpdate'] as int?,
  );
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'accountName': instance.accountName,
      'avatar': instance.avatar,
      'email': instance.email,
      'phone': instance.phone,
      'createAt': instance.createAt,
      'lastUpdate': instance.lastUpdate,
    };
