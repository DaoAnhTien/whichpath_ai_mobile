import 'package:json_annotation/json_annotation.dart';
import 'package:wichpath_ai/domain/data/models/base_model.dart';
import 'package:wichpath_ai/domain/data/models/product_model.dart';

part 'block_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BlockModel extends BaseModel {
  final String? title;

  final String? list;

  final String? detail;

  final String? params;

  final int xtype;

  final List<ProductModel> data;

  BlockModel({
    this.title,
    this.list,
    this.detail,
    this.params,
    this.xtype = 1,
    this.data = const <ProductModel>[],
  });

  factory BlockModel.fromJson(Map<String, dynamic> json) =>
      _$BlockModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BlockModelToJson(this);
}
