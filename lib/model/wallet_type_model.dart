class WalletTypeModel{
  int? id;
  String? name;

  WalletTypeModel({this.id, this.name});

  @override
  String toString() {
    return name ?? '';
  }
}