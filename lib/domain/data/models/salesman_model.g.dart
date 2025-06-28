// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salesman_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalesmanModelAdapter extends TypeAdapter<SalesmanModel> {
  @override
  final int typeId = 2;

  @override
  SalesmanModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalesmanModel(
      id: fields[0] as int,
      sManager: fields[1] as String?,
      sManagerName: fields[2] as String?,
      sManagerNameCode: fields[3] as String?,
      sex: fields[4] as String?,
      birthday: fields[5] as String?,
      idBy: fields[6] as String?,
      nameCode: fields[7] as String?,
      idDay: fields[8] as String?,
      idCard: fields[9] as String?,
      status: fields[10] as bool,
      salesmanType: fields[11] as int,
      authUserId: fields[12] as int,
      phone: fields[13] as String,
      email: fields[14] as String?,
      isFirstLogin: fields[15] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SalesmanModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sManager)
      ..writeByte(2)
      ..write(obj.sManagerName)
      ..writeByte(3)
      ..write(obj.sManagerNameCode)
      ..writeByte(4)
      ..write(obj.sex)
      ..writeByte(5)
      ..write(obj.birthday)
      ..writeByte(6)
      ..write(obj.idBy)
      ..writeByte(7)
      ..write(obj.nameCode)
      ..writeByte(8)
      ..write(obj.idDay)
      ..writeByte(9)
      ..write(obj.idCard)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.salesmanType)
      ..writeByte(12)
      ..write(obj.authUserId)
      ..writeByte(13)
      ..write(obj.phone)
      ..writeByte(14)
      ..write(obj.email)
      ..writeByte(15)
      ..write(obj.isFirstLogin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalesmanModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesmanModel _$SalesmanModelFromJson(Map<String, dynamic> json) =>
    SalesmanModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      sManager: json['s_manager'] as String? ?? '',
      sManagerName: json['s_manager_name'] as String? ?? '',
      sManagerNameCode: json['s_manager_name_code'] as String? ?? '',
      sex: json['sex'] as String? ?? '',
      birthday: json['birthday'] as String? ?? '',
      idBy: json['id_by'] as String? ?? '',
      nameCode: json['name_code'] as String? ?? '',
      idDay: json['id_day'] as String? ?? '',
      idCard: json['id_card'] as String? ?? '',
      status: json['status'] as bool? ?? true,
      salesmanType: (json['salesman_type'] as num?)?.toInt() ?? 0,
      authUserId: (json['auth_user_id'] as num?)?.toInt() ?? 0,
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      isFirstLogin: json['is_first_login'] as bool? ?? false,
    );

Map<String, dynamic> _$SalesmanModelToJson(SalesmanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      's_manager': instance.sManager,
      's_manager_name': instance.sManagerName,
      's_manager_name_code': instance.sManagerNameCode,
      'sex': instance.sex,
      'birthday': instance.birthday,
      'id_by': instance.idBy,
      'name_code': instance.nameCode,
      'id_day': instance.idDay,
      'id_card': instance.idCard,
      'status': instance.status,
      'salesman_type': instance.salesmanType,
      'auth_user_id': instance.authUserId,
      'phone': instance.phone,
      'email': instance.email,
      'is_first_login': instance.isFirstLogin,
    };
