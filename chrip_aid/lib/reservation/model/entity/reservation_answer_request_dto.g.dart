// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_answer_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationAnswerRequestDto _$ReservationAnswerRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ReservationAnswerRequestDto(
      reservationId: (json['reservation_id'] as num).toInt(),
      state: json['state'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ReservationAnswerRequestDtoToJson(
        ReservationAnswerRequestDto instance) =>
    <String, dynamic>{
      'reservation_id': instance.reservationId,
      'state': instance.state,
      'message': instance.message,
    };
