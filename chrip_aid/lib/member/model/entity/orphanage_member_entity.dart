import 'package:chrip_aid/member/model/entity/member_entity.dart';
import 'package:chrip_aid/orphanage/model/entity/orphanage_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orphanage_member_entity.g.dart';

@JsonSerializable()
class OrphanageMemberEntity implements MemberEntity {
  @override
  @JsonKey(name: 'email')
  String email;
  @override
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'orphanage_id')
  int orphanageId;

  OrphanageMemberEntity({
    required this.email,
    required this.name,
    required this.orphanageId,
  });

  @override
  Map<String, dynamic> toJson() => _$OrphanageMemberEntityToJson(this);

  factory OrphanageMemberEntity.fromJson(Map<String, dynamic> json) =>
      _$OrphanageMemberEntityFromJson(json);
}
