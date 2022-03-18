import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

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

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
