import 'package:json_annotation/json_annotation.dart';
import 'package:wichpath_ai/domain/data/models/base_model.dart';

part 'property_type_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PropertyTypeModel extends BaseModel {
  final int id;
  final String? title;
  final String? vietnamese;
  final String? description;
  final String? icon;

  @JsonKey(name: 'total_post')
  final int? totalPost;

  @JsonKey(name: 'transaction_type_name')
  final String? transactionTypeName;

  PropertyTypeModel({
    this.id = 0,
    this.title,
    this.vietnamese,
    this.description,
    this.icon,
    this.totalPost,
    this.transactionTypeName,
  });

  factory PropertyTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyTypeModelToJson(this);
}
