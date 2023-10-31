import 'package:chrip_aid/common/component/custom_outlined_button.dart';
import 'package:chrip_aid/common/component/shadow_image.dart';
import 'package:chrip_aid/common/layout/default_layout.dart';
import 'package:chrip_aid/common/styles/colors.dart';
import 'package:chrip_aid/common/styles/sizes.dart';
import 'package:chrip_aid/common/view/tab_screen.dart';
import 'package:chrip_aid/home/component/custom_speech_balloon.dart';
import 'package:chrip_aid/home/viewmodel/orphanage_home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrphanageHomeScreen extends TabScreen {
  const OrphanageHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(orphanageHomeViewModelProvider);
    return DefaultLayout(
      title: "Chirp Aid",
      appbarColor: CustomColor.mainColor,
      backgroundColor: CustomColor.backgroundMainColor,
      child: Padding(
        padding: const EdgeInsets.all(kPaddingSmallSize),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSpeechBalloon(
                child: Container(
                  height: 200,
                ),
              ),
              const SizedBox(height: kPaddingLargeSize),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      onPressed: () =>
                          viewmodel.navigateToSearchScreen(context),
                      text: "보육원 관리",
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
                      onPressed: () => viewmodel.navigateToCertificationScreen(
                        context,
                      ),
                      text: "후원 인증글 관리",
                      elevation: kElevationSize,
                      fixedSize: kOutlinedButtonLargeSize,
                      hasSide: false,
                    ),
                  ),
                  const SizedBox(width: kPaddingMiddleSize),
                  Expanded(
                    child: CustomOutlinedButton(
                      onPressed: () => viewmodel.navigateToFavoriteScreen(
                        context,
                      ),
                      text: "방문 신청 관리",
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