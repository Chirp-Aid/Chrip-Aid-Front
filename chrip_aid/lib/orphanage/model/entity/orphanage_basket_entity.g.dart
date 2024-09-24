// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orphanage_basket_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrphanageBasketEntity _$OrphanageBasketEntityFromJson(
        Map<String, dynamic> json) =>
    OrphanageBasketEntity(
      requestId: (json['request_id'] as num).toInt(),
      basketProductId: (json['basket_product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      count: (json['count'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      orphanageName: json['orphanage_name'] as String,
      productPhoto: json['product_photo'] as String,
    );

Map<String, dynamic> _$OrphanageBasketEntityToJson(
        OrphanageBasketEntity instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'basket_product_id': instance.basketProductId,
      'product_name': instance.productName,
      'count': instance.count,
      'price': instance.price,
      'orphanage_name': instance.orphanageName,
      'product_photo': instance.productPhoto,
    };
