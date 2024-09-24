// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_orphanage_info_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditOrphanageInfoRequestDTO _$EditOrphanageInfoRequestDTOFromJson(
        Map<String, dynamic> json) =>
    EditOrphanageInfoRequestDTO(
      orphanageId: json['orphanage_id'] as int,
      orphanageName: json['orphanage_name'] as String,
      address: json['address'] as String,
      homepageLink: json['homepage_link'] as String,
      description: json['description'] as String,
      photo: json['photo'] as String,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$EditOrphanageInfoRequestDTOToJson(
        EditOrphanageInfoRequestDTO instance) =>
    <String, dynamic>{
      'orphanage_id': instance.orphanageId,
      'orphanage_name': instance.orphanageName,
      'address': instance.address,
      'homepage_link': instance.homepageLink,
      'phone_number': instance.phoneNumber,
      'description': instance.description,
      'photo': instance.photo,
    };
