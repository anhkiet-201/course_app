import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kt_course/core/navigation/navigator.dart' as nav;
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class NavigatorImpl implements nav.Navigator {
  @override
  void pop({Object? result}) {
    nav.Navigator.navigationKey.currentState?.pop();
  }

  @override
  Future<T?>? push<T>(Widget page,
      {nav.PushType type = nav.PushType.nomal,
      Duration duration = const Duration(milliseconds: 300),
      nav.NavigatorAnimationType animationType =
          nav.NavigatorAnimationType.normal}) {
    final pageRoute = PageRouteBuilder<T>(
        /// [opaque] set false, then the detail page can see the home page screen.
        opaque: false,
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        fullscreenDialog: true,
        pageBuilder: (context, _, __) => page,
        transitionsBuilder: animationType.builder);
    return switch (type) {
      nav.PushType.nomal =>
        nav.Navigator.navigationKey.currentState?.push(pageRoute),
      nav.PushType.replace =>
        nav.Navigator.navigationKey.currentState?.pushReplacement(pageRoute),
      nav.PushType.replaceAll =>
        nav.Navigator.navigationKey.currentState?.pushAndRemoveUntil(pageRoute, (_) => false),
    };
  }

  @override
  void showSnackBar({String? message, error}) {
    final overlay = nav.Navigator.navigationKey.currentState?.overlay;
    if (overlay == null) return;
    final parseMessage = error != null ? 'Something is wrong!' : message;
    showTopSnackBar(
      overlay,
      Material(
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(80, 85, 85, 85),
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      parseMessage ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
