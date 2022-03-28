class WalletModel {
  final String? id;
  final String? walletImage;
  final String? walletName;
  final int? balance;
  final int? walletType;
  final int? createAt;
  final int? lastUpdate;

  WalletModel(
      {this.id,
      this.walletImage,
      this.walletName,
      this.balance,
      this.walletType,
      this.createAt,
      this.lastUpdate});

  @override
  String toString() {
    return 'WalletModel{walletImage: $walletImage, walletName: $walletName, balance: $balance, walletType: $walletType, createAt: $createAt, lastUpdate: $lastUpdate}';
  }

  factory WalletModel.fromJson(Map<String, Map<String, dynamic>> data) =>
      WalletModel(
        id: data.keys.first,
        walletImage: data.values.first['walletImage'] as String?,
        walletName: data.values.first['walletName'] as String?,
        balance: data.values.first['balance'] as int?,
        walletType: data.values.first['walletType'] as int?,
        createAt: data.values.first['createAt'] as int?,
        lastUpdate: data.values.first['lastUpdate'] as int?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'walletImage': walletImage,
        'walletName': walletName,
        'balance': balance,
        'walletType': walletType,
        'createAt': createAt,
        'lastUpdate': lastUpdate,
      };
}
