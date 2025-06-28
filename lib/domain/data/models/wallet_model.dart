import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'wallet_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WalletModel extends BaseModel {
  final double cash;
  final double bonus;
  final int point;
  final double hold;

  WalletModel({
    this.cash = 15151515020,
    this.bonus = 0,
    this.point = 0,
    this.hold = 0,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletModelToJson(this);
}
