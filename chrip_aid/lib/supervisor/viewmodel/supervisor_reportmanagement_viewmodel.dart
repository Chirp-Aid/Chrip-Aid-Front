import 'package:chrip_aid/common/value_state/util/value_state_util.dart';
import 'package:chrip_aid/management/model/dto/add_orphanage_product_request_dto.dart';
import 'package:chrip_aid/management/model/service/orphanage_management_service.dart';
import 'package:chrip_aid/management/view/orphanage_edit_info_screen.dart';
import 'package:chrip_aid/management/view/orphanage_edit_product_screen.dart';
import 'package:chrip_aid/orphanage/model/state/orphanage_detail_state.dart';
import 'package:chrip_aid/supervisor/model/service/supervisor_accountmanagement_service.dart';
import 'package:chrip_aid/supervisor/model/service/supervisor_reportmanagement_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final supervisorReportManagementViewModelProvider =
Provider((ref) => SupervisorReportmanagementViewmodel(ref));

class SupervisorReportmanagementViewmodel {
  Ref ref;
  late final SupervisorReportmanagementService _supervisorReportManagementServiceManagementService;

  OrphanageDetailState orphanageState = OrphanageDetailState();

  SupervisorReportmanagementViewmodel(this.ref) {
    _supervisorReportManagementServiceManagementService = ref.read(supervisorReportManagementServiceProvider);
  }

  void getInfo() => orphanageState
      .withResponse(_supervisorReportManagementServiceManagementService.getOrphanageInfo());

  void navigateToAddProductScreen(
      BuildContext context, {
        AddOrphanageProductRequestDTO? entity,
      }) {
    context.pushNamed(OrphanageEditProductScreen.routeName, extra: entity).then(
          (value) => orphanageState
          .withResponse(_supervisorReportManagementServiceManagementService.getOrphanageInfo()),
    );
  }

  void navigateToEditOrphanageScreen(BuildContext context) {
    context.pushNamed(OrphanageEditInfoScreen.routeName).then(
          (value) => orphanageState
          .withResponse(_supervisorReportManagementServiceManagementService.getOrphanageInfo()),
    );
  }
}
