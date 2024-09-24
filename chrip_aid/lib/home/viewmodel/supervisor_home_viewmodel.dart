import 'package:chrip_aid/supervisor/view/supervisor_accountmanagement_screen.dart';
import 'package:chrip_aid/supervisor/view/supervisor_postmanagement_screen.dart';
import 'package:chrip_aid/supervisor/view/supervisor_reportmanagement_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final supervisorHomeViewModelProvider = Provider((ref) => SupervisorViewModel(ref));

class SupervisorViewModel {
  Ref ref;

  SupervisorViewModel(this.ref);

  // TODO : 아래 세 함수들 수정해야함
  void navigateToAccountManagementScreen(BuildContext context) {
    context.pushNamed(SupervisorAccountmanagementScreen.routeName);
  }

  void navigateToPostsManagementScreen(BuildContext context) {
    context.pushNamed(SupervisorPostManagementScreen.routeName);
  }

  void navigateToReportManagementScreen(BuildContext context) {
    context.pushNamed(SupervisorReportmanagementScreen.routeName);
  }
}
