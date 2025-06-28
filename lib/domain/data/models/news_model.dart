import 'package:json_annotation/json_annotation.dart';
import 'package:wichpath_ai/domain/data/models/base_model.dart';

part 'news_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NewModel extends BaseModel {
  final int id;
  final String? name;
  final String? avatar;

  NewModel({this.id = 0, this.name, this.avatar});

  factory NewModel.fromJson(Map<String, dynamic> json) =>
      _$NewModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NewModelToJson(this);
}
