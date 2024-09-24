import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/component/custom_post_list.dart';
import '../../common/component/custom_toggle_button.dart';
import '../../common/styles/colors.dart';
import '../../common/styles/sizes.dart';
import '../../common/styles/text_styles.dart';
import '../../common/value_state/component/value_state_listener.dart';
import '../../orphanage/component/custom_text_field.dart';
import '../../orphanage/layout/detail_page_layout.dart';
import '../viewmodel/supervisor_accountmanagement_viewmodel.dart';

class SupervisorPostManagementScreen extends ConsumerWidget {
  static String get routeName => 'postmanagement';

  // 더미 데이터
  static const List<Map<String, dynamic>> dummyData = [
    {
      'title': '초코파이',
      'content': '초코파이 주세요',
      'writtenAt': '2024-01-28',
      'nickname': 'gumiorphanage',
      'type': '물품 요청',
    },
    {
      'title': '우유',
      'content': '서울우유로 주세요',
      'writtenAt': '2024-04-24',
      'nickname': 'gumiorphanage',
      'type': '물품 요청',
    },
    {
      'title': '동그랑땡 잘 받았어요!',
      'content': '명절 느낌 내게해줘서 너무 감사해요 ㅜㅜ',
      'writtenAt': '2024-09-18',
      'nickname': 'pajuorphanage',
      'type': '기부 감사',
    },
    {
      'title': '구미보육원 방문 예약합니다',
      'content': '2024-05-11 구미보육원 방문 희망합니다.',
      'writtenAt': '2024-03-11',
      'nickname': 'babayLion',
      'type': '방문 예약',
    },
    {
      'title': '파주보육원 방문 예약합니다',
      'content': '2024-06-21 파주보육원 방문 희망합니다.',
      'writtenAt': '2024-05-11',
      'nickname': 'juhyeok',
      'type': '방문 예약',
    },
  ];

  // StateProvider로 선택된 토글 값을 관리
  final selectedToggleProvider = StateProvider<int>((ref) => 0);

  SupervisorPostManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(supervisorAccountManagementViewModelProvider)..getInfo();
    final selectedIndex = ref.watch(selectedToggleProvider); // 선택된 토글 인덱스

    // 선택된 인덱스에 따라 데이터 필터링
    List<Map<String, dynamic>> filteredData = dummyData.where((item) {
      if (selectedIndex == 0) {
        return item['type'] == '방문 예약';
      } else if (selectedIndex == 1) {
        return item['type'] == '물품 요청';
      } else {
        return item['type'] == '기부 감사';
      }
    }).toList();

    return DetailPageLayout(
      extendBodyBehindAppBar: false,
      title: '게시글 관리',
      titleColor: Colors.white,
      appBarBackgroundColor: CustomColor.buttonMainColor,
      backgroundColor: CustomColor.backgroundMainColor,
      leadingColor: CustomColor.textReverseColor,
      actions: [],
      child: ValueStateListener(
        state: viewModel.orphanageState,
        defaultBuilder: (_, state) => SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                CustomToggleButton(
                  options: ['방문 예약', '물품 요청', '기부 감사'],
                  onChanged: (index) {
                    ref.read(selectedToggleProvider.notifier).state = index;
                  },
                ),
                SizedBox(height: 6.0),
                Column(
                  children: filteredData.map((user) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: CustomPostList(
                        title: user['title'],
                        content: user['content'],
                        writtenAt: user['writtenAt'],
                        nickname: user['nickname'],
                        onTap: () => _navigateToDetailPage(context, user),
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
      '/supervisor/postmanagement/postdetail',
      extra: userData,
    );
  }
}
