// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      name: json['name'] as String?,
      type: json['type'] as String?,
      createAt: json['create_at'] as int?,
      lastUpdate: json['last_update'] as int?,
      subCategories: (json['sub_categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'create_at': instance.createAt,
      'last_update': instance.lastUpdate,
      'sub_categories': instance.subCategories,
    };
