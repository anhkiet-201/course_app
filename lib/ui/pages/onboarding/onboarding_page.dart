import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/hero_animation_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OnboardingPage extends StatelessWidget
    with ControllerProvider<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  Widget get _actionButton => Observer(builder: (context) {
        final ctrl = controller(context);
        return IconButton.outlined(
            onPressed: ctrl.loginWithGoogle,
            icon: ctrl.isLoading
                ? const SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: Center(
                      child: SizedBox.square(
                        dimension: 32,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
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
}
