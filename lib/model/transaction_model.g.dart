// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: json['id'] as String?,
      amount: json['amount'] as String,
      note: json['note'] as String?,
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      spendTime: json['spend_time'] as int,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      wallet: WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
      createAt: json['create_at'] as int,
      lastUpdate: json['last_update'] as int,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'note': instance.note,
      'category': instance.category,
      'spend_time': instance.spendTime,
      'photos': instance.photos,
      'wallet': instance.wallet,
      'create_at': instance.createAt,
      'last_update': instance.lastUpdate,
    };
