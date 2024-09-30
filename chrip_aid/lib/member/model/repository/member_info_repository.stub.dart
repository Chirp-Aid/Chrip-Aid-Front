import 'package:chrip_aid/auth/model/state/authority_state.dart';
import 'package:chrip_aid/auth/model/type/region/gyeonggi.dart';
import 'package:chrip_aid/auth/model/type/sex.dart';
import 'package:chrip_aid/member/model/dto/edit_member_info_request_dto.dart';
import 'package:chrip_aid/member/model/entity/member_entity.dart';
import 'package:chrip_aid/member/model/entity/orphanage_member_entity.dart';
import 'package:chrip_aid/member/model/entity/user_entity.dart';
import 'package:chrip_aid/member/model/repository/member_info_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberInfoRepositoryStub implements MemberInfoRepository {
  Ref ref;

  MemberInfoRepositoryStub(this.ref);

  @override
  Future editUserInfo(EditMemberInfoRequestDto entity) async {}

  @override
  Future<MemberEntity> getUserInfo() async {
    return AuthorityState().value == AuthorityType.user
        ? UserEntity(
            email: "email",
            name: "name",
            nickName: "nickName",
            age: 20,
            sex: Sex.man,
            region: Gyeonggi.pajusi,
            phone: "01000000000",
            profileUrl: "https://picsum.photos/300/300",
          )
        : OrphanageMemberEntity(
            email: 'email',
            name: '윤하경',
            orphanageId: 1,
          );
  }
}
