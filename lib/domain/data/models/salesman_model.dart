import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'salesman_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(explicitToJson: true)
class SalesmanModel extends HiveObject {
  @HiveField(0)
  @JsonKey(defaultValue: 0)
  final int id;

  @HiveField(1)
  @JsonKey(name: 's_manager', defaultValue: "")
  final String? sManager;

  @HiveField(2)
  @JsonKey(name: 's_manager_name', defaultValue: "")
  final String? sManagerName;

  @HiveField(3)
  @JsonKey(name: 's_manager_name_code', defaultValue: "")
  final String? sManagerNameCode;

  @HiveField(4)
  @JsonKey(defaultValue: "")
  final String? sex;

  @HiveField(5)
  @JsonKey(defaultValue: "")
  final String? birthday;

  @HiveField(6)
  @JsonKey(name: 'id_by', defaultValue: "")
  final String? idBy;

  @HiveField(7)
  @JsonKey(name: 'name_code', defaultValue: "")
  final String? nameCode;

  @HiveField(8)
  @JsonKey(name: 'id_day', defaultValue: "")
  final String? idDay;

  @HiveField(9)
  @JsonKey(name: 'id_card', defaultValue: "")
  final String? idCard;

  @HiveField(10)
  @JsonKey(defaultValue: true)
  final bool status;

  @HiveField(11)
  @JsonKey(name: 'salesman_type', defaultValue: 0)
  final int salesmanType;

  @HiveField(12)
  @JsonKey(name: 'auth_user_id', defaultValue: 0)
  final int authUserId;

  @HiveField(13)
  @JsonKey(defaultValue: "")
  final String phone;

  @HiveField(14)
  @JsonKey(defaultValue: "")
  final String? email;

  @HiveField(15)
  @JsonKey(name: 'is_first_login', defaultValue: false)
  final bool isFirstLogin;

  SalesmanModel({
    this.id = 0,
    this.sManager = "",
    this.sManagerName = "",
    this.sManagerNameCode = "",
    this.sex = "",
    this.birthday = "",
    this.idBy = "",
    this.nameCode = "",
    this.idDay = "",
    this.idCard = "",
    this.status = true,
    this.salesmanType = 0,
    this.authUserId = 0,
    this.phone = "",
    this.email = "",
    this.isFirstLogin = false,
  });

  factory SalesmanModel.fromJson(Map<String, dynamic> json) =>
      _$SalesmanModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesmanModelToJson(this);
}
