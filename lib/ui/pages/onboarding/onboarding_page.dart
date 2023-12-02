import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_animated_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/onboarding/controller/onboarding_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OnBoardingPage extends StatelessWidget
    with ControllerProvider<OnBoardingController> {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = controller(context);
    ctrl.initialize();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Observer(
                builder: (_) => AnimatedOpacity(
                      opacity: ctrl.isLoading ? 1 : 0,
                      duration: const Duration(milliseconds: 2000),
                      child: LoadingAnimationWidget.twistingDots(
                          leftDotColor: context.color.primary,
                          rightDotColor: context.color.secondary,
                          size: 50),
                    )),
            Observer(
                builder: (_) => Visibility(
                      visible: !ctrl.isLoading && !ctrl.isLogin,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Get Started'),
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}

class KTButton extends StatefulWidget {
  const KTButton({super.key});

  @override
  State<KTButton> createState() => _KTButtonState();
}

class _KTButtonState extends State<KTButton> with TickerProviderStateMixin {
  late final AnimationController _animateController;
  @override
  void initState() {
    _animateController = AnimationController(
        vsync: this,
        upperBound: 20,
        lowerBound: 10,
        value: 20,
        duration: const Duration(milliseconds: 100),
        reverseDuration: const Duration(milliseconds: 100));
    super.initState();
  }

  @override
  void dispose() {
    _animateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {

        },
        onTapCancel: () {
          _animateController.reverse();
        },
        onTapUp: (_) {
          _animateController.forward();
        },
        onTapDown: (_) {
          _animateController.reverse();
        },
        child: AnimatedBuilder(
            animation: _animateController.view,
            builder: (_, __) {
              print(_animateController.value);
              return Container(
                constraints: const BoxConstraints(
                  minHeight: 50,
                  minWidth: 100
                ),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: context.color.primaryContainer,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(-3, -3),
                      color: context.color.primaryContainer.withOpacity(0.2),
                      blurRadius: 3
                    ),
                    BoxShadow(
                      offset: const Offset(3, 3),
                      color: context.color.outline,
                      blurRadius: 3
                    ),
                  ]
                ),
              );
            }));
  }
}
