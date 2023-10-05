import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CategoryModel {
  String? name;
  String? type;
  int? createAt;
  int? lastUpdate;
  List<CategoryModel>? subCategories;

  CategoryModel({
    this.name,
    this.type,
    this.createAt,
    this.lastUpdate,
    this.subCategories,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': this.name,
        'type': this.type,
        'createAt': this.createAt,
        'lastUpdate': this.lastUpdate,
        'subCategories': this.subCategories?.map((e) => e.toJson()).toList(),
      };

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json['name'] as String?,
        type: json['type'] as String?,
        createAt: json['createAt'] as int?,
        lastUpdate: json['lastUpdate'] as int?,
        subCategories: (json['subCategories'] as List<dynamic>?)
            ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  static CategoryModel empty = CategoryModel(
    name: '',
    type: '',
    createAt: 0,
    lastUpdate: 0,
    subCategories: [],
  );
}
