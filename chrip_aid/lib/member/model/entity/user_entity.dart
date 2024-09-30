import 'package:chrip_aid/auth/model/type/region/sub_region.dart';
import 'package:chrip_aid/auth/model/type/sex.dart';
import 'package:chrip_aid/member/model/entity/member_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity implements MemberEntity {
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'nickname')
  final String nickName;
  @JsonKey(name: 'age')
  final int age;
  @JsonKey(name: 'sex', fromJson: _sexFromJson, toJson: _sexToJson)
  final Sex sex;
  @JsonKey(
    name: 'region',
    fromJson: _regionFromJson,
    toJson: _regionToJson,
  )
  final SubRegion region;
  @JsonKey(name: 'phone_number')
  final String phone;
  @JsonKey(name: 'profile_photo')
  final String profileUrl;

  static Sex _sexFromJson(String sex) => Sex.fromString(sex);

  static String _sexToJson(Sex sex) => sex.value;

  static SubRegion _regionFromJson(String region) =>
      SubRegion.fromString(region);

  static String _regionToJson(SubRegion region) => region.toJson();

  UserEntity({
    required this.email,
    required this.name,
    required this.nickName,
    required this.age,
    required this.sex,
    required this.region,
    required this.phone,
    required this.profileUrl,
  });

  @override
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
