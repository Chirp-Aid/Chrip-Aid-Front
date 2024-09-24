// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donate_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonateEntity _$DonateEntityFromJson(Map<String, dynamic> json) => DonateEntity(
      orphanageName: json['orphanage_name'] as String,
      date: json['date'] as String,
      productName: json['product_name'] as String,
      price: (json['price'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DonateEntityToJson(DonateEntity instance) =>
    <String, dynamic>{
      'orphanage_name': instance.orphanageName,
      'date': instance.date,
      'product_name': instance.productName,
      'price': instance.price,
      'count': instance.count,
      'message': instance.message,
    };
