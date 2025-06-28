import 'package:json_annotation/json_annotation.dart';
import 'package:wichpath_ai/domain/data/models/base_model.dart';

part 'favorite_group_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FavoriteGroupModel extends BaseModel {
  final int id;
  final String? title;
  final List<String>? images;
  final List<String>? description;

  @JsonKey(name: 'default_group', defaultValue: false)
  final bool defaultGroup;

  @JsonKey(name: 'created_on')
  final String? createdOn;

  FavoriteGroupModel({
    required this.id,
    this.title,
    this.images,
    this.description,
    this.defaultGroup = false,
    this.createdOn,
  });

  factory FavoriteGroupModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteGroupModelToJson(this);
}
