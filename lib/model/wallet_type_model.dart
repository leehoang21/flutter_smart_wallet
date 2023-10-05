class WalletTypeModel{
  final int? id;
  final String? name;

  WalletTypeModel({this.id, this.name});

  @override
  String toString() {
    return name ?? '';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletTypeModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}