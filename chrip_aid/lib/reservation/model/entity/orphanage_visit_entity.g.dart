// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orphanage_visit_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrphanageVisitEntity _$OrphanageVisitEntityFromJson(
        Map<String, dynamic> json) =>
    OrphanageVisitEntity(
      orphanageId: json['orphanage_id'] as int,
      visitDate: json['visit_date'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$OrphanageVisitEntityToJson(
        OrphanageVisitEntity instance) =>
    <String, dynamic>{
      'orphanage_id': instance.orphanageId,
      'visit_date': instance.visitDate,
      'reason': instance.reason,
    };
