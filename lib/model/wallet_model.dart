import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_model.g.dart';

@JsonSerializable()
class WalletModel extends Equatable {
  final int balance;
  final int createAt;
  final int lastUpdate;
  final String walletImage;
  final String walletName;
  final int walletType;

  WalletModel(
      {required this.balance,
      required this.createAt,
      required this.lastUpdate,
      required this.walletImage,
      required this.walletName,
      required this.walletType});

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletModelToJson(this);

  @override
  List<Object?> get props =>
      [balance, createAt, lastUpdate, walletImage, walletName, walletType];
}
