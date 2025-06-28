import 'package:json_annotation/json_annotation.dart';

part 'search_item_model.g.dart';

@JsonSerializable()
class SearchItemModel {
  final int? id;
  final String? name;
  final String? address;
  final String? type;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isSelected;

  SearchItemModel({
    this.id,
    this.name,
    this.address,
    this.type,
    this.isSelected = false,
  });

  factory SearchItemModel.fromJson(Map<String, dynamic> json) =>
      _$SearchItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchItemModelToJson(this);
}

extension SearchItemModelListExt on List<SearchItemModel> {
  String get joinedNames =>
      map((e) => e.name ?? '').where((e) => e.isNotEmpty).join(', ');

  List<int> get ids => map((e) => e.id).whereType<int>().toList();
}
