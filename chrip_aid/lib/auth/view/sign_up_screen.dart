import 'package:chrip_aid/auth/util/validators.dart';
import 'package:chrip_aid/auth/viewmodel/sign_up_viewmodel.dart';
import 'package:chrip_aid/common/component/custom_dropdown_button.dart';
import 'package:chrip_aid/common/component/custom_outlined_button.dart';
import 'package:chrip_aid/common/component/custom_text_form_field.dart';
import 'package:chrip_aid/common/layout/default_layout.dart';
import 'package:chrip_aid/common/state/state.dart';
import 'package:chrip_aid/common/styles/colors.dart';
import 'package:chrip_aid/common/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerWidget {
  static String get routeName => 'signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(signUpViewModelProvider);
    return DefaultLayout(
      backgroundColor: CustomColor.mainColor,
      title: "Chirp Aid",
      leading: IconButton(
        onPressed: context.pop,
        icon: const Icon(
          Icons.navigate_before,
          color: CustomColor.backgroundMainColor,
          size: kIconLargeSize,
        ),
      ),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingSmallSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: kPaddingMiddleSize),
              CustomTextFormField(
                labelText: "이메일",
                hintText: "Email",
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => validateEmail(value),
                controller: viewModel.idTextController,
              ),
              const SizedBox(height: kPaddingMiddleSize),
              CustomTextFormField(
                labelText: "비밀번호",
                hintText: "Password",
                prefixIcon: Icons.lock,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => validatePassword(value),
                controller: viewModel.passwordTextController,
              ),
              const SizedBox(height: kPaddingMiddleSize),
              CustomTextFormField(
                labelText: "비밀번호 확인",
                hintText: "Check Password",
                prefixIcon: Icons.password,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => validatePassword(value),
                controller: viewModel.checkPasswordTextController,
              ),
              const SizedBox(height: kPaddingMiddleSize),
              CustomTextFormField(
                labelText: "닉네임",
                hintText: "Nickname",
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
                validator: (value) => validateName(value),
                controller: viewModel.nicknameTextController,
              ),
              const SizedBox(height: kPaddingMiddleSize),
              Row(
                children: [
                  Expanded(
                    child: CustomDropdownButton(
                      viewModel.sexDropdownController,
                      leading: Icons.wc,
                      action: Icons.arrow_drop_down,
                      boarderColor: CustomColor.backgroundMainColor,
                    ),
                  ),
                  const SizedBox(width: kPaddingMiddleSize),
                  Expanded(
                    child: CustomDropdownButton(
                      viewModel.locationDropdownController,
                      leading: Icons.location_on,
                      action: Icons.arrow_drop_down,
                      boarderColor: CustomColor.backgroundMainColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: kPaddingMiddleSize),
              CustomTextFormField(
                labelText: "전화번호",
                hintText: "Phone Number",
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) => validateName(value),
                controller: viewModel.phoneTextController,
              ),
              const SizedBox(height: kPaddingMiddleSize),
              if (viewModel.state is LoadingState)
                const Center(
                  child: CircularProgressIndicator(
                    color: CustomColor.backGroundSubColor,
                  ),
                )
              else
                CustomOutlinedButton(
                  onPressed: () => viewModel.signup(context),
                  text: '회원가입',
                ),
              const SizedBox(height: kPaddingXLargeSize),
            ],
          ),
        ),
      ),
    );
  }
}
