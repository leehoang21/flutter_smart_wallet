// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_infomation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfomationModelAdapter extends TypeAdapter<UserInfomationModel> {
  @override
  final int typeId = 2;

  @override
  UserInfomationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfomationModel(
      phoneNumber: fields[3] as String,
      userName: fields[0] as String,
      email: fields[1] as String?,
      avatar: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserInfomationModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.avatar)
      ..writeByte(3)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfomationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
