// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donate_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonateRequestDTO _$DonateRequestDTOFromJson(Map<String, dynamic> json) =>
    DonateRequestDTO(
      basketProductIds: (json['basket_product_id'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DonateRequestDTOToJson(DonateRequestDTO instance) =>
    <String, dynamic>{
      'basket_product_id': instance.basketProductIds,
      'message': instance.message,
    };
