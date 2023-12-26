import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:kt_course/global/tabbar/tab_bar_controller_provider.dart';

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
                  GButton(
                    gap: gap,
                    iconActiveColor: context.color.primary,
                    iconColor: context.color.primary.withOpacity(.3),
                    textColor: context.color.primary,
                    backgroundColor:
                        context.color.onPrimaryContainer.withOpacity(.2),
                    iconSize: 24,
                    padding: padding,
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    gap: gap,
                    iconActiveColor: context.color.primary,
                    iconColor: context.color.primary.withOpacity(.3),
                    textColor: context.color.primary,
                    backgroundColor:
                        context.color.onPrimaryContainer.withOpacity(.2),
                    iconSize: 24,
                    padding: padding,
                    icon: Icons.headphones,
                    // leading: selectedIndex == 1 || badge == 0
                    //     ? null
                    //     : Badge(
                    //         badgeColor: Colors.red.shade100,
                    //         elevation: 0,
                    //         position: BadgePosition.topEnd(top: -12, end: -12),
                    //         badgeContent: Text(
                    //           badge.toString(),
                    //           style: TextStyle(color: Colors.red.shade900),
                    //         ),
                    //         child: Icon(
                    //           LineIcons.heart,
                    //           color: selectedIndex == 1
                    //               ? Colors.pink
                    //               : Colors.black,
                    //         ),
                    //       ),
                  ),
                  GButton(
                    gap: gap,
                    iconActiveColor: context.color.primary,
                    iconColor: context.color.primary.withOpacity(.3),
                    textColor: context.color.primary,
                    backgroundColor:
                        context.color.onPrimaryContainer.withOpacity(.2),
                    iconSize: 24,
                    padding: padding,
                    icon: Icons.search,
                    text: 'Search',
                  ),
                  GButton(
                    gap: gap,
                    iconActiveColor: context.color.primary,
                    iconColor: context.color.primary.withOpacity(.3),
                    textColor: context.color.primary,
                    backgroundColor:
                        context.color.onPrimaryContainer.withOpacity(.2),
                    iconSize: 24,
                    padding: padding,
                    icon: Icons.percent,
                    leading: CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(
                        authController.user.avatar ?? '',
                      ),
                    ),
                    text: authController.user.displayName ?? '',
                  )
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
