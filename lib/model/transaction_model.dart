import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/model/category_model.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';

class TransactionModel extends Equatable {
  final String? id;
  final int amount;
  final String? note;
  final CategoryModel category;
  final int spendTime;
  final List<String>? photos;
  final WalletModel wallet;
  final int createAt;
  final int lastUpdate;

  TransactionModel(
      {this.id,
      required this.amount,
      this.note,
      required this.category,
      required this.spendTime,
      this.photos,
      required this.wallet,
      required this.createAt,
      required this.lastUpdate});

  factory TransactionModel.fromJson(Map<String, dynamic> json, String id) =>
      TransactionModel(
        id: id,
        amount: json['amount'] as int,
        note: json['note'] as String?,
        category:
            CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
        spendTime: json['spendTime'] as int,
        photos:
            (json['photo'] as List<dynamic>?)?.map((e) => e as String).toList(),
        wallet: WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
        createAt: json['createAt'] as int,
        lastUpdate: json['lastUpdate'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': this.amount,
        'note': this.note,
        'category': this.category.toJson(),
        'spendTime': this.spendTime,
        'photo': this.photos,
        'wallet': this.wallet.toJson(),
        'createAt': this.createAt,
        'lastUpdate': this.lastUpdate,
      };

  TransactionModel copyWith({
    String? id,
    int? amount,
    String? note,
    CategoryModel? category,
    int? spendTime,
    List<String>? photos,
    WalletModel? wallet,
    int? createAt,
    int? lastUpdate,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      category: category ?? this.category,
      spendTime: spendTime ?? this.spendTime,
      photos: photos ?? this.photos,
      wallet: wallet ?? this.wallet,
      createAt: createAt ?? this.createAt,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }

  @override
  List<Object?> get props => [
        id,
        amount,
        note,
        category,
        spendTime,
        photos,
        wallet,
        createAt,
        lastUpdate
      ];
}
