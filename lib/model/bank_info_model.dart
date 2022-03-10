import 'package:json_annotation/json_annotation.dart';

part 'bank_info_model.g.dart';

@JsonSerializable()
class BankInfoModel {
  final int? id;
  final String? bin;
  final String? code;
  final int? isTransfer;
  @JsonKey(name: "short_name")
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

  factory BankInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BankInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankInfoModelToJson(this);
}
