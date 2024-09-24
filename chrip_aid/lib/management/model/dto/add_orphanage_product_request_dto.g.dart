// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_orphanage_product_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrphanageProductRequestDTO _$AddOrphanageProductRequestDTOFromJson(
        Map<String, dynamic> json) =>
    AddOrphanageProductRequestDTO(
      id: (json['product_id'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$AddOrphanageProductRequestDTOToJson(
        AddOrphanageProductRequestDTO instance) =>
    <String, dynamic>{
      'product_id': instance.id,
      'count': instance.count,
      'message': instance.message,
    };
