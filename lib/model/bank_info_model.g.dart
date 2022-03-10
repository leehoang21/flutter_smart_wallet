// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankInfoModel _$BankInfoModelFromJson(Map<String, dynamic> json) =>
    BankInfoModel(
      id: json['id'] as int?,
      bin: json['bin'] as String?,
      code: json['code'] as String?,
      isTransfer: json['isTransfer'] as int?,
      shortName: json['short_name'] as String?,
      logo: json['logo'] as String?,
      support: json['support'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BankInfoModelToJson(BankInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bin': instance.bin,
      'code': instance.code,
      'isTransfer': instance.isTransfer,
      'short_name': instance.shortName,
      'logo': instance.logo,
      'support': instance.support,
      'name': instance.name,
    };
