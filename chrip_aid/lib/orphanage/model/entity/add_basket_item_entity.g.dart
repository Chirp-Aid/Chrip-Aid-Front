// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_basket_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBasketItemEntity _$AddBasketItemEntityFromJson(Map<String, dynamic> json) =>
    AddBasketItemEntity(
      requestId: (json['request_id'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$AddBasketItemEntityToJson(
        AddBasketItemEntity instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'count': instance.count,
    };
