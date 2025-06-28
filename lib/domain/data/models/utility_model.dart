import 'package:json_annotation/json_annotation.dart';

part 'utility_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UtilityModel {
  final String? name;
  final String? address;
  final String? icon;

  UtilityModel({this.name, this.address, this.icon});

  factory UtilityModel.fromJson(Map<String, dynamic> json) =>
      _$UtilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$UtilityModelToJson(this);
}
