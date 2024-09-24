// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orphanage_member_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrphanageMemberEntity _$OrphanageMemberEntityFromJson(
        Map<String, dynamic> json) =>
    OrphanageMemberEntity(
      email: json['email'] as String,
      name: json['name'] as String,
      orphanageId: (json['orphanage_id'] as num).toInt(),
    );

Map<String, dynamic> _$OrphanageMemberEntityToJson(
        OrphanageMemberEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'orphanage_id': instance.orphanageId,
    };
