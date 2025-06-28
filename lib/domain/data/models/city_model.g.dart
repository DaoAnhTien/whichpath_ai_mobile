// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      title: json['title'] as String?,
      city: json['city'] as String?,
      cityId: json['city_id'] as String?,
      propertyCount: (json['property_count'] as num?)?.toInt(),
      cityImage: json['city_image'] as String?,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'title': instance.title,
      'city': instance.city,
      'city_id': instance.cityId,
      'property_count': instance.propertyCount,
      'city_image': instance.cityImage,
    };
