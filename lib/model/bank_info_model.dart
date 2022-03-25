class BankInfoModel {
  final int? id;
  final String? bin;
  final String? code;
  final int? isTransfer;
  final String? shortName;
  final String? logo;
  final int? support;
  final String? name;

  const BankInfoModel({
    this.id,
    this.bin,
    this.code,
    this.isTransfer,
    this.shortName,
    this.logo,
    this.support,
    this.name,
  });

  factory BankInfoModel.fromJson(Map<String, dynamic> json) => BankInfoModel(
        id: json['id'] as int?,
        bin: json['bin'] as String?,
        code: json['code'] as String?,
        isTransfer: json['isTransfer'] as int?,
        shortName: json['short_name'] as String?,
        logo: json['logo'] as String?,
        support: json['support'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'bin': this.bin,
        'code': this.code,
        'isTransfer': this.isTransfer,
        'short_name': this.shortName,
        'logo': this.logo,
        'support': this.support,
        'name': this.name,
      };
}
