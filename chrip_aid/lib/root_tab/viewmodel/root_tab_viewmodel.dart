import 'package:chrip_aid/alarm/view/alarm_screen.dart';
import 'package:chrip_aid/auth/model/state/authority_state.dart';
import 'package:chrip_aid/common/const/tabs.dart';
import 'package:chrip_aid/home/view/orphanage_home_screen.dart';
import 'package:chrip_aid/home/view/supervisor_home_screen.dart';
import 'package:chrip_aid/home/view/user_home_screen.dart';
import 'package:chrip_aid/member/view/orphanage_member_info_screen.dart';
import 'package:chrip_aid/member/view/user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rootTabViewModelProvider = Provider((ref) => RootTabViewModel());

class RootTabViewModel {
  final authorityState = AuthorityState();
  late TabController rootTabController;

  List<TabInfo> get tabs {
    switch (authorityState.value!) {
      case AuthorityType.user:
        return const [
          TabInfo(AlarmScreen(), icon: Icons.notifications, label: '예약 현황 조회'),
          TabInfo(UserHomeScreen(), icon: Icons.home, label: '예약 설정'),
          TabInfo(UserInfoScreen(), icon: Icons.person, label: "사용자 설정"),
        ];
      case AuthorityType.orphanage:
        return const [
          TabInfo(AlarmScreen(), icon: Icons.notifications, label: '예약 현황 조회'),
          TabInfo(OrphanageHomeScreen(), icon: Icons.home, label: '예약 설정'),
          TabInfo(OrphanageMemberInfoScreen(),
              icon: Icons.person, label: "사용자 설정"),
        ];
      case AuthorityType.supervisor:
        return const [
          TabInfo(AlarmScreen(), icon: Icons.notifications, label: '예약 현황 조회'),
          TabInfo(SupervisorHomeScreen(), icon: Icons.home, label: '예약 설정'),
          // TODO : 사용자 설정 부분 변경해야함
          TabInfo(UserInfoScreen(), icon: Icons.person, label: "사용자 설정"),
        ];
    }
  }

  void getInfo(TickerProvider vsync) => rootTabController = TabController(
        length: tabs.length,
        animationDuration: Duration.zero,
        vsync: vsync,
        initialIndex: 1,
      );
}
