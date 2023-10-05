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

  factory WalletModel.fromJson(Map<String, dynamic> data, String id) =>
      WalletModel(
        id: id,
        walletImage: data['walletImage']
            as String?, // ignore: cast_nullable_to_non_nullable
        walletName: data['walletName'] as String?,
        balance: data['balance'] as int?,
        walletType: data['walletType'] as int?,
        createAt: data['createAt'] as int?,
        lastUpdate: data['lastUpdate'] as int?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'walletImage': walletImage,
        'walletName': walletName,
        'balance': balance,
        'walletType': walletType,
        'createAt': createAt,
        'lastUpdate': lastUpdate,
      };

  static WalletModel empty = WalletModel(
    walletImage: '',
    walletName: '',
    balance: 0,
    walletType: 0,
    createAt: 0,
    lastUpdate: 0,
  );

  WalletModel copyWith({
    final String? id,
    final String? walletImage,
    final String? walletName,
    final int? balance,
    final int? walletType,
    final int? createAt,
    final int? lastUpdate,
  }) {
    return WalletModel(
      id: id ?? this.id,
      walletImage: walletImage ?? this.walletImage,
      walletName: walletName ?? this.walletName,
      balance: balance ?? this.balance,
      walletType: walletType ?? this.walletType,
      createAt: createAt ?? this.createAt,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}
