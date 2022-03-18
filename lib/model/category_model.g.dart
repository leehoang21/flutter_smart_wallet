// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      name: json['name'] as String?,
      type: json['type'] as String?,
      createAt: json['createAt'] as int?,
      lastUpdate: json['lastUpdate'] as int?,
      subCategories: (json['subCategories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'createAt': instance.createAt,
      'lastUpdate': instance.lastUpdate,
      'subCategories': instance.subCategories,
    };
