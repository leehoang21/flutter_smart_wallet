class CategoryEntity {
  String? name;
  String? type;
  int? createAt;
  int? lastUpdate;
  List<String>? subCategories;

  CategoryEntity({
    this.name,
    this.type,
    this.createAt,
    this.lastUpdate,
    this.subCategories,
  });
}
