// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestItemEntity _$RequestItemEntityFromJson(Map<String, dynamic> json) =>
    RequestItemEntity(
      requestId: (json['request_id'] as num).toInt(),
      productName: json['product_name'] as String,
      price: (json['price'] as num).toInt(),
      requestCount: (json['count'] as num).toInt(),
      supportCount: (json['supported_count'] as num).toInt(),
      state: json['state'] as String,
      message: json['message'] as String,
      productPhoto: json['product_photo'] as String,
    );

Map<String, dynamic> _$RequestItemEntityToJson(RequestItemEntity instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'product_name': instance.productName,
      'price': instance.price,
      'count': instance.requestCount,
      'supported_count': instance.supportCount,
      'state': instance.state,
      'message': instance.message,
      'product_photo': instance.productPhoto,
    };
