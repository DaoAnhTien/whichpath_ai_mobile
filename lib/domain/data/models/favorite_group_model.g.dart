// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteGroupModel _$FavoriteGroupModelFromJson(Map<String, dynamic> json) =>
    FavoriteGroupModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: (json['description'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      defaultGroup: json['default_group'] as bool? ?? false,
      createdOn: json['created_on'] as String?,
    );

Map<String, dynamic> _$FavoriteGroupModelToJson(FavoriteGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'images': instance.images,
      'description': instance.description,
      'default_group': instance.defaultGroup,
      'created_on': instance.createdOn,
    };
