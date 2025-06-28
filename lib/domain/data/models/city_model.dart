import 'package:json_annotation/json_annotation.dart';
import 'package:wichpath_ai/domain/data/models/base_model.dart';

part 'city_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CityModel extends BaseModel {
  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'city_id')
  final String? cityId;

  @JsonKey(name: 'property_count')
  final int? propertyCount;

  @JsonKey(name: 'city_image')
  final String? cityImage;

  CityModel({
    this.title,
    this.city,
    this.cityId,
    this.propertyCount,
    this.cityImage,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
