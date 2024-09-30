import 'package:chrip_aid/common/component/custom_outlined_button.dart';
import 'package:chrip_aid/common/component/shadow_image.dart';
import 'package:chrip_aid/common/layout/default_layout.dart';
import 'package:chrip_aid/common/styles/styles.dart';
import 'package:chrip_aid/home/viewmodel/supervisor_home_viewmodel.dart';
import 'package:chrip_aid/root_tab/view/tab_screen.dart';
import 'package:chrip_aid/home/component/custom_speech_balloon.dart';
import 'package:chrip_aid/home/viewmodel/user_home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SupervisorHomeScreen extends TabScreen {
  @override
  Color get mainColor => CustomColor.mainColor;

  const SupervisorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(supervisorHomeViewModelProvider);
    return DefaultLayout(
      title: "Chirp Aid",
      appbarColor: mainColor,
      backgroundColor: CustomColor.backgroundMainColor,
      child: Padding(
        padding: const EdgeInsets.all(kPaddingSmallSize),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              const SizedBox(height: kPaddingLargeSize),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      onPressed: () =>
                          viewmodel.navigateToAccountManagementScreen(context),
                      icon: Icon(
                        Icons.account_circle,
                        size:60,color: Colors.white,
                      ),
                      text: "계정 관리",
                      elevation: kElevationSize,
                      fixedSize: kOutlinedButtonLargeSize,
                      hasSide: false,
                    ),
                  ),
                  const SizedBox(width: kPaddingMiddleSize),
                  Expanded(
                    child: ImageShadow(
                      child: Image(
                        image: const AssetImage("assets/image/logo.png"),
                        height: kOutlinedButtonLargeSize.height -
                            kPaddingMiddleSize,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: kPaddingMiddleSize),
              Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      onPressed: () => viewmodel.navigateToPostsManagementScreen(
                        context,
                      ),
                      icon: Icon(
                        Icons.description,
                        size:60,color: Colors.white,
                      ),
                      text: "게시글 관리",
                      elevation: kElevationSize,
                      fixedSize: kOutlinedButtonLargeSize,
                      hasSide: false,
                    ),
                  ),
                  const SizedBox(width: kPaddingMiddleSize),
                  Expanded(
                    child: CustomOutlinedButton(
                      onPressed: () => viewmodel.navigateToReportManagementScreen(
                        context,
                      ),
                      icon: Icon(
                        Icons.warning_amber_rounded,
                        size:60,color: Colors.white,
                      ),                      text: "신고 관리",
                      elevation: kElevationSize,
                      fixedSize: kOutlinedButtonLargeSize,
                      hasSide: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
