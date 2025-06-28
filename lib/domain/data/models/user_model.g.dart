// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      authUserId: fields[0] as int,
      authUserName: fields[1] == null ? '' : fields[1] as String,
      authUserEmail: fields[2] as String,
      authUserPhone: fields[3] as String,
      firstName: fields[12] == null ? '' : fields[12] as String,
      lastName: fields[13] == null ? '' : fields[13] as String,
      isPopupSupport: fields[4] as bool,
      userName: fields[5] as String,
      isPassword: fields[6] as bool,
      token: fields[7] as String,
      expiration: fields[8] as int,
      issuedAt: fields[9] as int,
      mem: (fields[10] as List).cast<String>(),
      salesman: fields[11] as SalesmanModel?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.authUserId)
      ..writeByte(1)
      ..write(obj.authUserName)
      ..writeByte(2)
      ..write(obj.authUserEmail)
      ..writeByte(3)
      ..write(obj.authUserPhone)
      ..writeByte(4)
      ..write(obj.isPopupSupport)
      ..writeByte(5)
      ..write(obj.userName)
      ..writeByte(6)
      ..write(obj.isPassword)
      ..writeByte(7)
      ..write(obj.token)
      ..writeByte(8)
      ..write(obj.expiration)
      ..writeByte(9)
      ..write(obj.issuedAt)
      ..writeByte(10)
      ..write(obj.mem)
      ..writeByte(11)
      ..write(obj.salesman)
      ..writeByte(12)
      ..write(obj.firstName)
      ..writeByte(13)
      ..write(obj.lastName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      authUserId: (json['id'] as num?)?.toInt() ?? 0,
      authUserName: json['auth_user_name'] as String? ?? '',
      authUserEmail: json['email'] as String? ?? '',
      authUserPhone: json['phone'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      isPopupSupport: json['is_popup_support'] as bool? ?? false,
      userName: json['username'] as String? ?? '',
      isPassword: json['is_password'] as bool? ?? false,
      token: json['token'] as String? ?? '',
      expiration: (json['expiration'] as num?)?.toInt() ?? 0,
      issuedAt: (json['issued_at'] as num?)?.toInt() ?? 0,
      mem: (json['mem'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      salesman: json['salesman'] == null
          ? null
          : SalesmanModel.fromJson(json['salesman'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.authUserId,
      'auth_user_name': instance.authUserName,
      'email': instance.authUserEmail,
      'phone': instance.authUserPhone,
      'is_popup_support': instance.isPopupSupport,
      'username': instance.userName,
      'is_password': instance.isPassword,
      'token': instance.token,
      'expiration': instance.expiration,
      'issued_at': instance.issuedAt,
      'mem': instance.mem,
      'salesman': instance.salesman?.toJson(),
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
