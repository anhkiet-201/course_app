import 'package:flutter/material.dart';
import 'package:kt_course/common/extensions/hero_animation_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/splash/controller/splash_controller.dart';

class SplashPage extends StatelessWidget
  with ControllerProvider<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller(context).initialize();
    },);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Transform.scale(
              scale: 0.7,
              child: Image.asset(
                'assets/images/splash_logo.png'
              ).heroTag('splash_logo'),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CircularProgressIndicator(),
            ),
          )
        ],
      )
    );
  }
}
