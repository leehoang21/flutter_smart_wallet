class CategoryModel {
  String? name;
  String? type;
  int? createAt;
  int? lastUpdate;
  List<String>? subCategories;

  CategoryModel({
    this.name,
    this.type,
    this.createAt,
    this.lastUpdate,
    this.subCategories,
  });
}
