// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      priceDescription: json['price_description'] as String?,
      pricePerMeter: json['price_per_meter'] as String?,
      priceDisplay: json['price_display'] as String?,
      currency: json['currency'] as String?,
      area: (json['area'] as num?)?.toDouble(),
      bedrooms: (json['bedrooms'] as num?)?.toInt() ?? 0,
      bathrooms: (json['bathrooms'] as num?)?.toInt() ?? 0,
      floors: (json['floors'] as num?)?.toInt(),
      utilities: (json['utilities'] as List<dynamic>?)
              ?.map((e) => UtilityModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      propertyTypeId: (json['property_type_id'] as num?)?.toInt(),
      propertyType: json['property_type'] as String?,
      houseDirection: json['house_direction'] as String?,
      yearBuilt: json['year_built'] as String?,
      status: json['status'] as String?,
      city: json['city'] as String?,
      cityId: json['city_id'] as String?,
      district: json['district'] as String?,
      favoriteGroup: (json['favorite_group'] as num?)?.toInt(),
      districtId: json['district_id'] as String?,
      ward: json['ward'] as String?,
      wardId: json['ward_id'] as String?,
      streetAddress: json['street_address'] as String?,
      latlng: json['latlng'] as String?,
      contactName: json['contact_name'] as String?,
      contactPhone: json['contact_phone'] as String?,
      contactEmail: json['contact_email'] as String?,
      mainImage: json['main_image'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      description: json['description'] as String?,
      legalDocument: json['legal_document'] as String?,
      interior: json['interior'] as String?,
      createdOn: json['created_on'] as String?,
      updatedOn: json['updated_on'] as String?,
      viewCount: (json['view_count'] as num?)?.toInt(),
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      isFavorite: json['is_favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'price': instance.price,
      'price_description': instance.priceDescription,
      'price_per_meter': instance.pricePerMeter,
      'currency': instance.currency,
      'area': instance.area,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'floors': instance.floors,
      'property_type_id': instance.propertyTypeId,
      'property_type': instance.propertyType,
      'house_direction': instance.houseDirection,
      'year_built': instance.yearBuilt,
      'status': instance.status,
      'city': instance.city,
      'city_id': instance.cityId,
      'district': instance.district,
      'district_id': instance.districtId,
      'ward': instance.ward,
      'ward_id': instance.wardId,
      'street_address': instance.streetAddress,
      'latlng': instance.latlng,
      'lat': instance.lat,
      'lng': instance.lng,
      'contact_name': instance.contactName,
      'contact_phone': instance.contactPhone,
      'contact_email': instance.contactEmail,
      'main_image': instance.mainImage,
      'images': instance.images,
      'description': instance.description,
      'legal_document': instance.legalDocument,
      'interior': instance.interior,
      'created_on': instance.createdOn,
      'updated_on': instance.updatedOn,
      'view_count': instance.viewCount,
      'favorite_group': instance.favoriteGroup,
      'price_display': instance.priceDisplay,
      'is_favorite': instance.isFavorite,
      'utilities': instance.utilities.map((e) => e.toJson()).toList(),
    };

PricingHistory _$PricingHistoryFromJson(Map<String, dynamic> json) =>
    PricingHistory(
      quarter: (json['quarter'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      min: (json['min'] as num?)?.toDouble(),
      avg: (json['avg'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$PricingHistoryToJson(PricingHistory instance) =>
    <String, dynamic>{
      'quarter': instance.quarter,
      'year': instance.year,
      'min': instance.min,
      'avg': instance.avg,
      'max': instance.max,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };

PriceHistoryModel _$PriceHistoryModelFromJson(Map<String, dynamic> json) =>
    PriceHistoryModel(
      pricingHistory: (json['pricingHistory'] as List<dynamic>?)
              ?.map((e) => PricingHistory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PriceHistoryModelToJson(PriceHistoryModel instance) =>
    <String, dynamic>{
      'pricingHistory': instance.pricingHistory,
    };
