import 'package:chrip_aid/common/component/custom_outlined_button.dart';
import 'package:chrip_aid/common/component/shadow_image.dart';
import 'package:chrip_aid/common/layout/default_layout.dart';
import 'package:chrip_aid/common/styles/styles.dart';
import 'package:chrip_aid/root_tab/view/tab_screen.dart';
import 'package:chrip_aid/home/component/custom_speech_balloon.dart';
import 'package:chrip_aid/home/viewmodel/user_home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserHomeScreen extends TabScreen {
  @override
  Color get mainColor => CustomColor.mainColor;

  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(userHomeViewModelProvider);
    return DefaultLayout(
      title: "Chirp Aid",
      appbarColor: mainColor,
      backgroundColor: CustomColor.backgroundMainColor,
      child: Padding(
        padding: const EdgeInsets.all(kPaddingSmallSize),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSpeechBalloon(
                child: SizedBox(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(kPaddingMiddleSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "작은 봉사라도 그것이 계속된다면 참다운 봉사이다. 데이지 꽃은 그것이 드리우는 제 그림자에 의하여 아롱지는 이슬방울을 햇빛으로부터 지켜준다.",
                          style: kTextContentStyleMiddle.copyWith(
                            color: CustomColor.mainColor,
                            fontSize: 18,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          "- 윌리엄 워즈워스",
                          textAlign: TextAlign.right,
                          style: kTextContentStyleMiddle.copyWith(
                            color: CustomColor.mainColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      text: "우리동네\n보육원 찾기",
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
                      onPressed: () => viewmodel.navigateToPostScreen(
                        context,
                      ),
                      text: "후원 인증글",
                      elevation: kElevationSize,
                      fixedSize: kOutlinedButtonLargeSize,
                      hasSide: false,
                    ),
                  ),
                  const SizedBox(width: kPaddingMiddleSize),
                  Expanded(
                    child: CustomOutlinedButton(
                      onPressed: () => viewmodel.navigateToReservationScreen(
                        context,
                      ),
                      text: "방문 신청 내역",
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
