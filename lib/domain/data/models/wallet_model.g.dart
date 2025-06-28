// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => WalletModel(
      cash: (json['cash'] as num?)?.toDouble() ?? 0,
      bonus: (json['bonus'] as num?)?.toDouble() ?? 0,
      point: (json['point'] as num?)?.toInt() ?? 0,
      hold: (json['hold'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$WalletModelToJson(WalletModel instance) =>
    <String, dynamic>{
      'cash': instance.cash,
      'bonus': instance.bonus,
      'point': instance.point,
      'hold': instance.hold,
    };
