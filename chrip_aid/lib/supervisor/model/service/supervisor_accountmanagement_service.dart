import 'package:chrip_aid/common/entity/response_entity.dart';
import 'package:chrip_aid/management/model/dto/add_orphanage_product_request_dto.dart';
import 'package:chrip_aid/management/model/dto/edit_orphanage_info_request_dto.dart';
import 'package:chrip_aid/member/model/entity/member_entity.dart';
import 'package:chrip_aid/member/model/entity/orphanage_member_entity.dart';
import 'package:chrip_aid/member/model/state/member_info_state.dart';
import 'package:chrip_aid/orphanage/model/entity/orphanage_detail_entity.dart';
import 'package:chrip_aid/orphanage/model/entity/product_entity.dart';
import 'package:chrip_aid/supervisor/model/repository/supervisor_accountmanager_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final supervisorAccountManagementServiceProvider = Provider((ref) {
  final repository = ref.read(supervisorAccountManagementRepositoryProvider);
  return SupervisorAccountManagementService(repository, ref);
});

class SupervisorAccountManagementService {
  final Ref ref;
  late final SupervisorAccountManagementRepository repository;

  SupervisorAccountManagementService(this.repository, this.ref);

  // TODO : 아래 함수 필요한걸로 바꿔야할듯
  Future<ResponseEntity<OrphanageDetailEntity>> getOrphanageInfo() async {
    try {
      MemberEntity? member = MemberInfoState().value;
      if (member is! OrphanageMemberEntity) {
        return ResponseEntity.error(message: "알 수 없는 에러가 발생했습니다.");
      }
      int id = member.orphanageId;
      OrphanageDetailEntity data = await repository.getOrphanageData(id);
      return ResponseEntity.success(entity: data);
    } catch (e) {
      return ResponseEntity.error(message: e.toString());
    }
  }

  Future<ResponseEntity<List<ProductEntity>>> getProductList() async {
    try {
      List<ProductEntity> data = await repository.getProducts();
      return ResponseEntity.success(entity: data);
    } catch (e) {
      return ResponseEntity.error(message: e.toString());
    }
  }

  Future<ResponseEntity<OrphanageDetailEntity>> editOrphanageProduct(
      AddOrphanageProductRequestDTO dto,
      ) async {
    try {
      await repository.editOrphanageProduct(dto);
      return getOrphanageInfo();
    } catch (e) {
      return ResponseEntity.error(message: e.toString());
    }
  }

  Future<ResponseEntity> editOrphanageInfo(
      EditOrphanageInfoRequestDTO dto,
      ) async {
    try {
      await repository.editOrphanageInfo(dto);
      return ResponseEntity.success();
    } catch (e) {
      return ResponseEntity.error(message: e.toString());
    }
  }
}
