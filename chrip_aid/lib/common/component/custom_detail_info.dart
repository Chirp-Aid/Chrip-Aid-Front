import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chrip_aid/orphanage/layout/detail_page_layout.dart';
import '../../supervisor/viewmodel/supervisor_accountmanagement_viewmodel.dart';
import '../styles/colors.dart';
import '../styles/sizes.dart';
import 'custom_user_list.dart';

class CustomDetailInfo extends ConsumerWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String nickname;
  final String age;
  final String sex;
  final String region;

  const CustomDetailInfo({
    super.key,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.nickname,
    required this.age,
    required this.sex,
    required this.region,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(supervisorAccountManagementViewModelProvider)..getInfo();

    return DetailPageLayout(
      extendBodyBehindAppBar: false,
      title: '계정 관리',
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
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage('assets/image/logo.png'),
                          height: 100,
                          width: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '이름',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(width: 10.0,),
                                Text('${name}'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '아이디',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(width: 10.0,),
                                Text('${email}'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '별명',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(width: 10.0,),
                                Text('${nickname}'),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Column(
                  children: [
                    Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Row(
                              children: [
                                Text(
                                  '나이',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(width: 10.0,),
                                Text('${age}'),
                              ],
                            ),
                          ),
                          SizedBox(width: 100,),
                          Row(
                            children: [
                              Text(
                                '성별',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(width: 10.0,),
                              Text('${sex}'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        children: [
                          Text(
                            '전화번호',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text('${phoneNumber}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        children: [
                          Text(
                            '지역',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text('${region}'),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '활동 내역',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    Container(
                      height: 300,
                      child: ListView(
                        children: [
                          CustomUserList(
                            name: '미누',
                            email: 'email',
                            phoneNumber: '010-0000-0000',
                            nickname: 'nickname',
                          ),
                          CustomUserList(
                            name: '미누',
                            email: 'email',
                            phoneNumber: '010-0000-0000',
                            nickname: 'nickname',
                          ),
                          CustomUserList(
                            name: '미누',
                            email: 'email',
                            phoneNumber: '010-0000-0000',
                            nickname: 'nickname',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print('ElevatedButton pressed');
                      },
                      child: Row(
                        children: [
                          Icon(Icons.edit),
                          Text('수정'),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    ElevatedButton(
                      onPressed: () {
                        print('ElevatedButton pressed');
                      },
                      child: Row(
                        children: [
                          Icon(Icons.delete),
                          Text('삭제'),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
