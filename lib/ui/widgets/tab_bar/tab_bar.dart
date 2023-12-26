import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:kt_course/global/tabbar/controller/tab_bar_controller.dart';
import 'package:kt_course/global/tabbar/tab_bar_controller_provider.dart';
import 'package:kt_course/ui/widgets/avatar/avatar.dart';

class TabBar extends StatelessWidget
    with TabBarControllerProvider, AuthControllerProvider {
  const TabBar({super.key});
  final double gap = 10;
  final padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 12);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: context.color.background,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
              spreadRadius: -10,
              blurRadius: 60,
              color: Colors.black.withOpacity(.4),
              offset: const Offset(0, 25),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
          child: Observer(
            builder: (context) {
              return GNav(
                tabs: [
                  ...tabbarController.listTab.map((e) {
                    return GButton(
                      gap: gap,
                      iconActiveColor: context.color.primary,
                      iconColor: context.color.primary.withOpacity(.3),
                      textColor: context.color.primary,
                      backgroundColor:
                          context.color.onPrimaryContainer.withOpacity(.2),
                      iconSize: 24,
                      padding: padding,
                      icon: e.icon,
                      leading: e == TabBarPredefine.account ? const Avatar(radius: 12) : null,
                      text: e == TabBarPredefine.account ? authController.user.displayName ?? '' : e.title,
                    );
                  })
                ],
                selectedIndex: tabbarController.currentTab.intValue,
                onTabChange: tabbarController.changeTab,
              );
            }
          ),
        ),
      ),
    );
  }
}
