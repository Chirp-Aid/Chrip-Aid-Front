// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      email: json['email'] as String,
      name: json['name'] as String,
      nickName: json['nickname'] as String,
      age: json['age'] as int,
      sex: UserEntity._sexFromJson(json['sex'] as String),
      region: UserEntity._regionFromJson(json['region'] as String),
      phone: json['phone_number'] as String,
      profileUrl: json['profile_photo'] as String,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'nickname': instance.nickName,
      'age': instance.age,
      'sex': UserEntity._sexToJson(instance.sex),
      'region': UserEntity._regionToJson(instance.region),
      'phone_number': instance.phone,
      'profile_photo': instance.profileUrl,
    };
