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
  Future<T?>? push<T>(Widget page, {nav.PushType type = nav.PushType.nomal}) {
    final route = MaterialPageRoute<T>(builder: (_) => page);
    return switch (type) {
      nav.PushType.nomal =>
        nav.Navigator.navigationKey.currentState?.push(route),
      nav.PushType.replace =>
        nav.Navigator.navigationKey.currentState?.push(route),
      nav.PushType.replaceAll =>
        nav.Navigator.navigationKey.currentState?.push(route),
    };
  }

  @override
  void showSnackBar({String? message, error}) {
    final context = nav.Navigator.globalContext;
    if (context == null) return;
    final parseMessage = error == null ? 'Something is wrong!' : message;
    showTopSnackBar(
      Overlay.of(context),
      Material(
        child: Container(
          height: 75,
          decoration: BoxDecoration(
              color: const Color.fromARGB(46, 85, 85, 85),
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
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
              Row(
                children: [
                  const Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  Text(
                    parseMessage ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
