import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chrip_aid/orphanage/layout/detail_page_layout.dart';
import '../../admin/viewmodel/admin_accountmanagement_viewmodel.dart';
import '../styles/colors.dart';
import '../styles/sizes.dart';
import 'custom_user_list.dart';

class CustomDetailPostInfo extends ConsumerWidget {
  final String title;
  final String content;
  final String writtenAt;
  final String nickname;

  const CustomDetailPostInfo({
    super.key,
    required this.title,
    required this.content,
    required this.writtenAt,
    required this.nickname,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(adminAccountManagementViewModelProvider)..getInfo();

    return DetailPageLayout(
      extendBodyBehindAppBar: false,
      title: '게시글 관리',
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
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Container(
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.green,
                width: 2.0,
              ),
            ),
            child:Column(
              children: [
                Text('Fuck You '),
              ],
            )
          ),
        ),
      ),
    );
  }
}
