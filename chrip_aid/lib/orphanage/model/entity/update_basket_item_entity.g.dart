// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_basket_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBasketItemEntity _$UpdateBasketItemEntityFromJson(
        Map<String, dynamic> json) =>
    UpdateBasketItemEntity(
      (json['count'] as num).toInt(),
      (json['request_id'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateBasketItemEntityToJson(
        UpdateBasketItemEntity instance) =>
    <String, dynamic>{
      'count': instance.count,
      'request_id': instance.requestId,
    };
