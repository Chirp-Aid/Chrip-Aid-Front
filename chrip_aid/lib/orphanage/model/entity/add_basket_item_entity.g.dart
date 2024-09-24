// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_basket_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBasketItemEntity _$AddBasketItemEntityFromJson(Map<String, dynamic> json) =>
    AddBasketItemEntity(
      requestId: json['request_id'] as int,
      count: json['count'] as int,
    );

Map<String, dynamic> _$AddBasketItemEntityToJson(
        AddBasketItemEntity instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'count': instance.count,
    };
