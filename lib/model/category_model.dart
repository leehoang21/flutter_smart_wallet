import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Equatable {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'create_at')
  int? createAt;
  @JsonKey(name: 'last_update')
  int? lastUpdate;
  @JsonKey(name: 'sub_categories')
  List<CategoryModel>? subCategories;

  CategoryModel({
    this.name,
    this.type,
    this.createAt,
    this.lastUpdate,
    this.subCategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  List<Object?> get props => [name, type, createAt, lastUpdate, subCategories];
}
