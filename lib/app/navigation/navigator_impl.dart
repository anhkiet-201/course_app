import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/navigation/navigator.dart' as nav;
import 'package:kt_course_apis/core/base/api_error.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
          nav.NavigatorAnimationType.fade}) {
           final pageRoute = MaterialWithModalsPageRoute<T>(builder: (_) {
              return page;
            });
    // final pageRoute = PageRouteBuilder<T>(

    //     /// [opaque] set false, then the detail page can see the home page screen.
    //     opaque: false,
    //     transitionDuration: duration,
    //     reverseTransitionDuration: duration,
    //     fullscreenDialog: true,
    //     pageBuilder: (context, _, __) => page,
    //     transitionsBuilder: animationType.builder);
    return switch (type) {
      nav.PushType.nomal =>
        nav.Navigator.navigationKey.currentState?.push(pageRoute),
      nav.PushType.replace =>
        nav.Navigator.navigationKey.currentState?.pushReplacement(pageRoute),
      nav.PushType.replaceAll => nav.Navigator.navigationKey.currentState
          ?.pushAndRemoveUntil(pageRoute, (_) => false),
    };
  }

  @override
  void showSnackBar({String? message, error}) {
    final overlay = nav.Navigator.navigationKey.currentState?.overlay;
    if (overlay == null) return;
    final parseMessage = error != null
        ? error is APIError
            ? error.messages.join('\n')
            : 'Something is wrong!'
        : message;
    showTopSnackBar(
      overlay,
      Material(
        color: Colors.transparent,
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

  @override
  Future<T?>? showBottomSheet<T>(Widget page,
      {double maxChildSize = 0.9,
      bool showDragHandle = true,
      Color? backgroundColor,
      double initialChildSize = 0.5,
      bool snap = true,
      String? title,
      List<double>? snapSizes}) {
    final context = nav.Navigator.globalContext;
    if (context == null) return null;
    return showCupertinoModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        elevation: 0,
        duration: const Duration(milliseconds: 300),
        // isScrollControlled: true,
        // useRootNavigator: true,
        // useSafeArea: true,
        isDismissible: true,
        expand: true,
        // shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        builder: (ctx) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Container(
              color: backgroundColor ?? context.color.background,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: Builder(builder: (titleContext) {
                    return Text(
                      title?.tr(context: titleContext) ?? '',
                      style: context.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    );
                  }),
                  centerTitle: true,
                  leading: const CloseButton(),
                ),
                body: page,
              ),
            ),
          );
        });
  }
}
