// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchItemModel _$SearchItemModelFromJson(Map<String, dynamic> json) =>
    SearchItemModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      address: json['address'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$SearchItemModelToJson(SearchItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'type': instance.type,
    };
