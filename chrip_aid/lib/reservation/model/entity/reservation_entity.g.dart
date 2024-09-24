// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationEntity _$ReservationEntityFromJson(Map<String, dynamic> json) =>
    ReservationEntity(
      orphanageName: json['orphanage_name'] as String,
      writeDate: json['write_date'] as String,
      visitDate: json['visit_date'] as String,
      reason: json['reason'] as String,
      state: json['state'] as String,
      rejectReason: json['reject_reason'] as String?,
    );

Map<String, dynamic> _$ReservationEntityToJson(ReservationEntity instance) =>
    <String, dynamic>{
      'orphanage_name': instance.orphanageName,
      'write_date': instance.writeDate,
      'visit_date': instance.visitDate,
      'reason': instance.reason,
      'state': instance.state,
      'reject_reason': instance.rejectReason,
    };

OrphanageReservationEntity _$OrphanageReservationEntityFromJson(
        Map<String, dynamic> json) =>
    OrphanageReservationEntity(
      reservationId: (json['reservation_id'] as num).toInt(),
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      sex: json['sex'] as String,
      region: json['region'] as String,
      phoneNumber: json['phone_number'] as String,
      writeDate: json['write_date'] as String,
      visitDate: json['visit_date'] as String,
      reason: json['reason'] as String,
      state: json['state'] as String,
      rejectReason: json['reject_reason'] as String?,
    );

Map<String, dynamic> _$OrphanageReservationEntityToJson(
        OrphanageReservationEntity instance) =>
    <String, dynamic>{
      'reservation_id': instance.reservationId,
      'name': instance.name,
      'age': instance.age,
      'sex': instance.sex,
      'region': instance.region,
      'phone_number': instance.phoneNumber,
      'write_date': instance.writeDate,
      'visit_date': instance.visitDate,
      'reason': instance.reason,
      'state': instance.state,
      'reject_reason': instance.rejectReason,
    };
