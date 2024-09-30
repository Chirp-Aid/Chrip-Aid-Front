import 'package:chrip_aid/common/entity/response_entity.dart';
import 'package:chrip_aid/member/model/entity/member_entity.dart';
import 'package:chrip_aid/member/model/entity/orphanage_member_entity.dart';
import 'package:chrip_aid/member/model/state/member_info_state.dart';
import 'package:chrip_aid/orphanage/model/entity/orphanage_detail_entity.dart';
import 'package:chrip_aid/orphanage/model/entity/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/admin_accountmanager_repository.dart';

final adminReportManagementServiceProvider = Provider<AdminReportmanagementService>((ref) {
  final repository = ref.read(adminAccountManagementRepositoryProvider);
  return AdminReportmanagementService(repository, ref);
});

class AdminReportmanagementService {
  final Ref ref;
  late final AdminAccountManagementRepository repository;

  AdminReportmanagementService(this.repository, this.ref);

  // TODO : 아래 함수 필요한걸로 바꿔야할듯
  // Future<ResponseEntity<OrphanageDetailEntity>> getReportList() async {
  //   try {
  //     MemberEntity? member = MemberInfoState().value;
  //     if (member is! OrphanageMemberEntity) {
  //       return ResponseEntity.error(message: "알 수 없는 에러가 발생했습니다.");
  //     }
  //     int id = member.orphanageId;
  //     OrphanageDetailEntity data = await repository.getOrphanageData(id);
  //     return ResponseEntity.success(entity: data);
  //   } catch (e) {
  //     return ResponseEntity.error(message: e.toString());
  //   }
  // }
  //
  // Future<ResponseEntity<List<ProductEntity>>> getReportDetailList() async {
  //   try {
  //     List<ProductEntity> data = await repository.getProducts();
  //     return ResponseEntity.success(entity: data);
  //   } catch (e) {
  //     return ResponseEntity.error(message: e.toString());
  //   }
  // }


}
