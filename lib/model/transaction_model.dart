import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_smart_wallet/model/category_model.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel extends Equatable {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'amount')
  final String amount;
  @JsonKey(name: 'note')
  final String? note;
  @JsonKey(name: 'category')
  final CategoryModel category;
  @JsonKey(name: 'spend_time')
  final int spendTime;
  @JsonKey(name: 'photos')
  final List<String>? photos;
  final WalletModel wallet;
  @JsonKey(name: 'create_at')
  final int createAt;
  @JsonKey(name: 'last_update')
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

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  TransactionModel copyWith({
    String? id,
    String? amount,
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
