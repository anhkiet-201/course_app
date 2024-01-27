import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/hero_animation_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class OnboardingPage extends StatelessWidget
    with ControllerProvider<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset('assets/images/splash_logo.png')
                  .heroTag('splash_logo'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: _actionButton,
          )
        ],
      ),
    );
  }

  Widget get _actionButton => Column(
    children: [
      _googleLoginButton,
      const SizedBox(height: 10,),
      _emailAndPasswordLoginButton
    ],
  );

  Widget get _emailAndPasswordLoginButton => Observer(builder: (context) {
    final ctrl = controller(context);
    return IconButton.filledTonal(onPressed: () {
      ctrl.showLoginSheet();
    },
    icon: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/login.png',
          width: 32,
          height: 32,
          )
      ],
    ));
  });

  Widget get _googleLoginButton => Observer(builder: (context) {
        final ctrl = controller(context);
        return IconButton.filledTonal(
            onPressed: ctrl.isLoading ? null : ctrl.loginWithGoogle,
            icon: ctrl.isLoginWithGoogle
                ? _loadingIndicator
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/google-icon.svg',
                        width: 32,
                        height: 32,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Tiếp tục với google',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: context.color.onBackground
                        ),
                      )
                    ],
                  ));
      });

  Widget get _loadingIndicator => SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: Center(
                      child: SizedBox.square(
                        dimension: 32,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
}
