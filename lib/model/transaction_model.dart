import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/common/extensions/translate_extension.dart';
import 'package:flutter_smart_wallet/model/category_model.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';

import '../common/utils/format_utils.dart';

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
        amount: json['amount'] as int? ?? 0,
        note: json['note'] as String?,
        category: (json['category'] as Map<String, dynamic>?) != null
            ? CategoryModel.fromJson(
                json['category'] as Map<String, dynamic>,
              )
            : CategoryModel.empty,
        spendTime: json['spendTime'] as int? ?? 0,
        photos:
            (json['photo'] as List<dynamic>?)?.map((e) => e as String).toList(),
        wallet: (json['wallet'] as Map<String, dynamic>?) != null
            ? WalletModel.fromJson(
                json['wallet'],
                '',
              )
            : WalletModel.empty,
        createAt: json['createAt'] as int? ?? 0,
        lastUpdate: json['lastUpdate'] as int? ?? 0,
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

  factory TransactionModel.empty() => TransactionModel(
        amount: 0,
        category: CategoryModel.empty,
        spendTime: 0,
        wallet: WalletModel.empty,
        createAt: 0,
        lastUpdate: 0,
      );

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

  String get time {
    final date = DateTime.now();
    final dateItem = DateTime.fromMillisecondsSinceEpoch(spendTime);
    if (dateItem.day == date.day &&
        dateItem.month == date.month &&
        dateItem.year == date.year) {
      return 'Today'.tr;
    } else if (dateItem.day == date.day - 1 &&
        dateItem.month == date.month &&
        dateItem.year == date.year) {
      return 'Yesterday'.tr;
    } else {
      return formatDateMonth(DateTime.fromMillisecondsSinceEpoch(spendTime));
    }
  }
}
