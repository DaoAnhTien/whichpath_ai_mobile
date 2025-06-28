import 'package:json_annotation/json_annotation.dart';
import 'salesman_model.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class UserModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'id', defaultValue: 0)
  final int authUserId;

  @HiveField(1, defaultValue: "")
  @JsonKey(name: 'auth_user_name', defaultValue: "")
  final String authUserName;

  @HiveField(2)
  @JsonKey(name: 'email', defaultValue: "")
  final String authUserEmail;

  @HiveField(3)
  @JsonKey(name: 'phone', defaultValue: "")
  final String authUserPhone;

  @HiveField(4)
  @JsonKey(name: 'is_popup_support', defaultValue: false)
  final bool isPopupSupport;

  @HiveField(5)
  @JsonKey(name: 'username', defaultValue: "")
  final String userName;

  @HiveField(6)
  @JsonKey(name: 'is_password', defaultValue: false)
  final bool isPassword;

  @HiveField(7)
  @JsonKey(defaultValue: "")
  final String token;

  @HiveField(8)
  @JsonKey(defaultValue: 0)
  final int expiration;

  @HiveField(9)
  @JsonKey(name: 'issued_at', defaultValue: 0)
  final int issuedAt;

  @HiveField(10)
  @JsonKey(defaultValue: [])
  final List<String> mem;

  @HiveField(11)
  final SalesmanModel? salesman;

  @JsonKey(name: 'first_name', defaultValue: "")
  @HiveField(12, defaultValue: "")
  final String firstName;

  @JsonKey(name: 'last_name', defaultValue: "")
  @HiveField(13, defaultValue: "")
  final String lastName;

  UserModel({
    this.authUserId = 0,
    this.authUserName = "",
    this.authUserEmail = "",
    this.authUserPhone = "",
    this.firstName = "",
    this.lastName = "",
    this.isPopupSupport = false,
    this.userName = "",
    this.isPassword = false,
    this.token = "",
    this.expiration = 0,
    this.issuedAt = 0,
    this.mem = const [],
    this.salesman,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
