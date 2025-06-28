// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockModel _$BlockModelFromJson(Map<String, dynamic> json) => BlockModel(
      title: json['title'] as String?,
      list: json['list'] as String?,
      detail: json['detail'] as String?,
      params: json['params'] as String?,
      xtype: (json['xtype'] as num?)?.toInt() ?? 1,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductModel>[],
    );

Map<String, dynamic> _$BlockModelToJson(BlockModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'list': instance.list,
      'detail': instance.detail,
      'params': instance.params,
      'xtype': instance.xtype,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
