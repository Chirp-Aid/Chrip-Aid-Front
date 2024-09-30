import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/component/custom_report_list.dart';
import '../../common/component/custom_toggle_button.dart';
import '../../common/styles/colors.dart';
import '../../common/styles/sizes.dart';
import '../../common/styles/text_styles.dart';
import '../../common/value_state/component/value_state_listener.dart';
import '../../orphanage/component/custom_text_field.dart';
import '../../orphanage/layout/detail_page_layout.dart';
import '../viewmodel/admin_accountmanagement_viewmodel.dart';

class AdminReportmanagementScreen extends ConsumerWidget {
  static String get routeName => "reportmanagement";
  static const List<Map<String, dynamic>> dummyData = [
    {
      'title': '4시간 연강이 말입니까 ?',
      'content' : '진짜 이건 너무하잖아요',
      'target': '구미보육원',
      'writtenAt': '2024-09-25',
      'nickname': 'minwoo',
      'email' : 'minwoo1119@naver.com',
      'isUser': 'false',
    },
    {
      'title': '성윤이형이 수업갔어요',
      'content' : '진짜 이건 너무하잖아요',
      'target': 'seongyoon',
      'writtenAt': '2024-09-22',
      'nickname': 'minwoo',
      'email' : 'minwoo1119@naver.com',
      'isUser': 'true',
    },
    {
      'title': '흰 셔츠가 없는데 사오래요',
      'content' : '진짜 이건 너무하잖아요',
      'target': 'D138',
      'writtenAt': '2024-09-21',
      'nickname': 'juhyeok',
      'email' : 'example@naver.com',
      'isUser': 'true',
    },
    {
      'title': '수업 재미없어요',
      'content' : '진짜 이건 너무하잖아요',
      'target': '컴퓨터공학과',
      'writtenAt': '2024-09-17',
      'nickname': 'youngjin',
      'email' : 'example@naver.com',
      'isUser': 'false',
    },
    {
      'title': '라즈베리파이가 욕했어요',
      'content' : '진짜 이건 너무하잖아요',
      'target': 'razp',
      'writtenAt': '2024-04-29',
      'nickname': 'seongyoon',
      'email' : 'example@naver.com',
      'isUser': 'true',
    },
  ];

  const AdminReportmanagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(adminAccountManagementViewModelProvider)..getInfo();
    final isUserState = ref.watch(isUserFilterProvider);

    // 필터링된 데이터
    final filteredData = dummyData
        .where((user) => isUserState ? user['isUser'] == 'true' : user['isUser'] == 'false')
        .toList();

    return DetailPageLayout(
      extendBodyBehindAppBar: false,
      title: '신고 관리',
      titleColor: Colors.white,
      appBarBackgroundColor: CustomColor.buttonMainColor,
      backgroundColor: CustomColor.backgroundMainColor,
      leadingColor: CustomColor.textReverseColor,
      actions: [
        IconButton(
          onPressed: () => viewModel.navigateToEditOrphanageScreen(context),
          icon: const Icon(Icons.search, size: kIconSmallSize),
          color: CustomColor.textReverseColor,
          splashRadius: kIconSmallSize,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(width: kPaddingMiddleSize),
      ],
      child: ValueStateListener(
        state: viewModel.orphanageState,
        defaultBuilder: (_, state) => SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                CustomToggleButton(
                  options: ['사용자', '게시글'],
                  onChanged: (index) {
                    // isUser 상태 변경 (사용자가 클릭한 토글에 따라 상태 변경)
                    ref.read(isUserFilterProvider.notifier).state = index == 0;
                  },
                ),
                SizedBox(height: 10.0),
                Column(
                  children: filteredData.map((user) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: CustomReportList(
                        title: user['title'],
                        target: user['target'],
                        writtenAt: user['writtenAt'],
                        user: user['nickname'],
                        isUser: user['isUser'] == 'true',
                        onTap: ()=>_navigateToDetailPage(context, user),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        successBuilder: (_, state) => SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Text('User'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kPaddingMiddleSize,
                      vertical: kPaddingMiniSize,
                    ),
                    child: Column(
                      children: [
                        CustomTextField(
                          text: 'User1',
                          textSize: kTextMediumSize,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 5.0,
                color: CustomColor.disabledColor.withOpacity(0.5),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: kPaddingMiddleSize,
                  right: kPaddingMiddleSize,
                  top: kPaddingMiniSize,
                  bottom: kPaddingSmallSize,
                ),
                child: Column(
                  children: [
                    const CustomTextField(
                      iconData: Icons.description,
                      text: "소개글",
                    ),
                    Text(
                      '소개글 내용',
                      style: kTextContentStyleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetailPage(BuildContext context, Map<String, dynamic> userData) {
    context.push(
      '/supervisor/reportmanagement/detail',
      extra: userData,
    );
  }
}

// isUser 필터 상태 관리
final isUserFilterProvider = StateProvider<bool>((ref) => true);
