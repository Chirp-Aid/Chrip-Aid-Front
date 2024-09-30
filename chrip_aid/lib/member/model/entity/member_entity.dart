import 'package:chrip_aid/member/model/entity/orphanage_member_entity.dart';
import 'package:chrip_aid/member/model/entity/user_entity.dart';

abstract class MemberEntity {
  final String email;
  final String name;

  MemberEntity({
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toJson();

  factory MemberEntity.fromJson(Map<String, dynamic> json) {
    // TODO : MemberEntity factory need dependency with authority type
    if(json["orphanage_id"] == null) {
      return UserEntity.fromJson(json);
    } else {
      return OrphanageMemberEntity.fromJson(json);
    }
  }
}