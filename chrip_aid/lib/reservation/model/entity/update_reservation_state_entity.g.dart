// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_reservation_state_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateReservationStateEntity _$UpdateReservationStateEntityFromJson(
        Map<String, dynamic> json) =>
    UpdateReservationStateEntity(
      reservationId: (json['reservation_id'] as num).toInt(),
      state: json['state'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$UpdateReservationStateEntityToJson(
        UpdateReservationStateEntity instance) =>
    <String, dynamic>{
      'reservation_id': instance.reservationId,
      'state': instance.state,
      'message': instance.message,
    };
