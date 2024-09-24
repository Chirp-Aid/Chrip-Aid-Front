// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) =>
    ProductEntity(
      id: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      price: (json['price'] as num).toInt(),
      image: json['product_photo'] as String,
    );

Map<String, dynamic> _$ProductEntityToJson(ProductEntity instance) =>
    <String, dynamic>{
      'product_id': instance.id,
      'product_name': instance.productName,
      'price': instance.price,
      'product_photo': instance.image,
    };
