import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Future<T?>? push<T>(Widget page,
    {PushType pushType = PushType.normal,
      Transition? transition,
      String? routeName}) async {
  switch (pushType) {
    case PushType.normal:
      return Get.to(() => page, transition: transition, routeName: routeName);
    case PushType.replace:
      return Get.off(() => page,
          transition: transition, routeName: routeName);
    case PushType.replaceAll:
      return Get.offAll(() => page,
          transition: transition, routeName: routeName);
  }
}

pop<T>({T? result, bool closeOverlays = false}) async {
  Get.back(result: result, closeOverlays: closeOverlays);
}
//
// Future<T?> bottomSheet<T>(
//     Widget bottomsheet, {
//       bool isShowIndicator = true,
//       bool persistent = true,
//       bool isDismissible = true,
//       bool enableDrag = true,
//       bool isScrollControlled = false,
//       Color? barrierColor,
//       Color? backgroundColor,
//       double initialChildSize = 0.5,
//       bool shouldCloseWhenDraggedFromTop = true,
//       List<double>? snapSizes = const [0.5, 0.8],
//     });
//
// Future<T?> dialog<T>(
//     Widget dialog, {
//       bool isDismissible = true,
//       Color? barrierColor,
//     });

SnackbarController showSnackBar({
  String? title,
  String? message,
  Widget? titleText,
  Widget? messageText,
  Widget? icon,
  Widget? mainButton,
  dynamic error,
}) {
  final parsedMessage = switch (error) {
    null => message,
    _ => 'Something went wrong!'
  };
  final controller = Get.showSnackbar(
    GetSnackBar(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        borderRadius: 16,
        animationDuration: const Duration(milliseconds: 500),
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 3),
        title: title,
        message: parsedMessage,
        titleText: titleText,
        messageText: messageText,
        backgroundColor: const Color(0x55555555),
        barBlur: 10,
        icon: icon,
        onTap: (_) {
          Get.closeCurrentSnackbar();
        },
        mainButton: mainButton ??
            const Icon(
              CupertinoIcons.xmark_circle_fill,
              size: 16,
            ).marginOnly(right: 16)),
  );
  return controller;
}

enum PushType {
  normal,
  replace,
  replaceAll,
}