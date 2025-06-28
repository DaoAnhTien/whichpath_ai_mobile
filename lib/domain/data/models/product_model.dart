import 'package:json_annotation/json_annotation.dart';
import 'package:wichpath_ai/domain/data/models/base_model.dart';
import 'package:wichpath_ai/domain/data/models/utility_model.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel extends BaseModel {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'price')
  final double? price;

  @JsonKey(name: 'price_description')
  final String? priceDescription;

  @JsonKey(name: 'price_per_meter')
  final String? pricePerMeter;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'area')
  final double? area;

  @JsonKey(name: 'bedrooms', defaultValue: 0)
  final int? bedrooms;

  @JsonKey(name: 'bathrooms', defaultValue: 0)
  final int? bathrooms;

  @JsonKey(name: 'floors')
  final int? floors;

  @JsonKey(name: 'property_type_id')
  final int? propertyTypeId;

  @JsonKey(name: 'property_type')
  final String? propertyType;

  @JsonKey(name: 'house_direction')
  final String? houseDirection;

  @JsonKey(name: 'year_built')
  final String? yearBuilt;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'city_id')
  final String? cityId;

  @JsonKey(name: 'district')
  final String? district;

  @JsonKey(name: 'district_id')
  final String? districtId;

  @JsonKey(name: 'ward')
  final String? ward;

  @JsonKey(name: 'ward_id')
  final String? wardId;

  @JsonKey(name: 'street_address')
  final String? streetAddress;

  @JsonKey(name: 'latlng')
  final String? latlng;

  @JsonKey(name: 'lat')
  final String? lat;

  @JsonKey(name: 'lng')
  final String? lng;

  @JsonKey(name: 'contact_name')
  final String? contactName;

  @JsonKey(name: 'contact_phone')
  final String? contactPhone;

  @JsonKey(name: 'contact_email')
  final String? contactEmail;

  @JsonKey(name: 'main_image')
  final String? mainImage;

  @JsonKey(name: 'images')
  final List<String> images;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'legal_document')
  final String? legalDocument;

  @JsonKey(name: 'interior')
  final String? interior;

  @JsonKey(name: 'created_on')
  final String? createdOn;

  @JsonKey(name: 'updated_on')
  final String? updatedOn;

  @JsonKey(name: 'view_count')
  final int? viewCount;

  @JsonKey(name: 'favorite_group')
  final int? favoriteGroup;

  @JsonKey(name: 'price_display')
  final String? priceDisplay;

  @JsonKey(name: 'is_favorite', defaultValue: false)
  late bool isFavorite;

  final List<UtilityModel> utilities;

  // @JsonKey(name: "price_history")
  // final PriceHistoryModel? priceHistory;

  ProductModel({
    this.id = 0,
    this.title,
    this.slug,
    this.price,
    this.priceDescription,
    this.pricePerMeter,
    this.priceDisplay,
    this.currency,
    this.area,
    this.bedrooms,
    this.bathrooms,
    this.floors,
    this.utilities = const [],
    this.propertyTypeId,
    this.propertyType,
    this.houseDirection,
    this.yearBuilt,
    this.status,
    this.city,
    this.cityId,
    this.district,
    // this.priceHistory,
    this.favoriteGroup,
    this.districtId,
    this.ward,
    this.wardId,
    this.streetAddress,
    this.latlng,
    this.contactName,
    this.contactPhone,
    this.contactEmail,
    this.mainImage,
    this.images = const <String>[],
    this.description,
    this.legalDocument,
    this.interior,
    this.createdOn,
    this.updatedOn,
    this.viewCount,
    this.lat,
    this.lng,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PricingHistory extends BaseModel {
  final int? quarter;
  final int? year;
  final double? min;
  final double? avg;
  final double? max;
  final DateTime? startDate;
  final DateTime? endDate;

  PricingHistory({
    this.quarter,
    this.year,
    this.min,
    this.avg,
    this.max,
    this.startDate,
    this.endDate,
  });

  factory PricingHistory.fromJson(Map<String, dynamic> json) =>
      _$PricingHistoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PricingHistoryToJson(this);
}

@JsonSerializable()
class PriceHistoryModel {
  final List<PricingHistory> pricingHistory;

  PriceHistoryModel({this.pricingHistory = const []});

  factory PriceHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PriceHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceHistoryModelToJson(this);
}
