// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyTypeModel _$PropertyTypeModelFromJson(Map<String, dynamic> json) =>
    PropertyTypeModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String?,
      vietnamese: json['vietnamese'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      totalPost: (json['total_post'] as num?)?.toInt(),
      transactionTypeName: json['transaction_type_name'] as String?,
    );

Map<String, dynamic> _$PropertyTypeModelToJson(PropertyTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'vietnamese': instance.vietnamese,
      'description': instance.description,
      'icon': instance.icon,
      'total_post': instance.totalPost,
      'transaction_type_name': instance.transactionTypeName,
    };
