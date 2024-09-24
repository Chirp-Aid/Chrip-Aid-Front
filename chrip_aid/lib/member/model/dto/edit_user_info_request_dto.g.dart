// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_user_info_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditUserInfoRequestDto _$EditUserInfoRequestDtoFromJson(
        Map<String, dynamic> json) =>
    EditUserInfoRequestDto(
      name: json['name'] as String,
      password: json['password'] as String,
      nickName: json['nickname'] as String,
      age: (json['age'] as num).toInt(),
      sex: EditUserInfoRequestDto._sexFromJson(json['sex'] as String),
      region: EditUserInfoRequestDto._regionFromJson(json['region'] as String),
      phone: json['phone_number'] as String,
      profileUrl: json['profile_photo'] as String,
    );

Map<String, dynamic> _$EditUserInfoRequestDtoToJson(
        EditUserInfoRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
      'nickname': instance.nickName,
      'age': instance.age,
      'sex': EditUserInfoRequestDto._sexToJson(instance.sex),
      'region': EditUserInfoRequestDto._regionToJson(instance.region),
      'phone_number': instance.phone,
      'profile_photo': instance.profileUrl,
    };
