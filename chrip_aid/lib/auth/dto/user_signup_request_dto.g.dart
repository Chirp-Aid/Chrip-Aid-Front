// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignupRequestDto _$UserSignupRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UserSignupRequestDto(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      age: (json['age'] as num).toInt(),
      sex: json['sex'] as String,
      nickname: json['nickname'] as String,
      region: json['region'] as String,
      phoneNumber: json['phone_number'] as String,
      profilePhoto: json['profile_photo'] as String,
    );

Map<String, dynamic> _$UserSignupRequestDtoToJson(
        UserSignupRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'age': instance.age,
      'sex': instance.sex,
      'nickname': instance.nickname,
      'region': instance.region,
      'phone_number': instance.phoneNumber,
      'profile_photo': instance.profilePhoto,
    };
