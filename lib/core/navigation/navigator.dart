import 'package:flutter/material.dart';

enum PushType {
  nomal,
  replace,
  replaceAll;
}

enum NavigatorAnimationType {
  fade,
  slide,
  scale,
  normal,
  rotate;

  Widget builder(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
        
    switch (this) {
      case fade:
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      case slide:
        return SlideTransition(
          position: animation.drive(Tween<Offset>(
              begin: const Offset(1, 0), end: const Offset(0, 0))),
          child: child,
        );
      case scale:
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      case normal:
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      case rotate:
        return RotationTransition(
          turns: animation.drive(Tween<double>(begin: 0, end: 90)),
          child: child,
        );
    }
  }
}

abstract interface class Navigator {
  static final navigationKey = GlobalKey<NavigatorState>();
  static BuildContext? get globalContext => navigationKey.currentContext;

  Future<T?>? push<T>(Widget page,
      {PushType type, NavigatorAnimationType animationType});

  void pop({Object? result});

  void showSnackBar({String? message, dynamic error});

  Future<T?>? showBottomSheet<T>(Widget page,
      {double maxChildSize,
      bool showDragHandle,
      Color? backgroundColor,
      double initialChildSize,
      bool snap,
      String? title,
      List<double>? snapSizes});
}


// Future<T?>? push<T>(Widget page,
//     {PushType pushType = PushType.normal,
//       Transition? transition,
//       String? routeName}) async {
//   switch (pushType) {
//     case PushType.normal:
//       return Get.to(() => page, transition: transition, routeName: routeName);
//     case PushType.replace:
//       return Get.off(() => page,
//           transition: transition, routeName: routeName);
//     case PushType.replaceAll:
//       return Get.offAll(() => page,
//           transition: transition, routeName: routeName);
//   }
// }

// pop<T>({T? result, bool closeOverlays = false}) async {
//   Get.back(result: result, closeOverlays: closeOverlays);
// }
// //
// // Future<T?> bottomSheet<T>(
// //     Widget bottomsheet, {
// //       bool isShowIndicator = true,
// //       bool persistent = true,
// //       bool isDismissible = true,
// //       bool enableDrag = true,
// //       bool isScrollControlled = false,
// //       Color? barrierColor,
// //       Color? backgroundColor,
// //       double initialChildSize = 0.5,
// //       bool shouldCloseWhenDraggedFromTop = true,
// //       List<double>? snapSizes = const [0.5, 0.8],
// //     });
// //
// // Future<T?> dialog<T>(
// //     Widget dialog, {
// //       bool isDismissible = true,
// //       Color? barrierColor,
// //     });

// SnackbarController showSnackBar({
//   String? title,
//   String? message,
//   Widget? titleText,
//   Widget? messageText,
//   Widget? icon,
//   Widget? mainButton,
//   dynamic error,
// }) {
//   final parsedMessage = switch (error) {
//     null => message,
//     _ => 'Something went wrong!'
//   };
//   final controller = Get.showSnackbar(
//     GetSnackBar(
//         margin: const EdgeInsets.all(16),
//         padding: const EdgeInsets.all(16),
//         borderRadius: 16,
//         animationDuration: const Duration(milliseconds: 500),
//         snackPosition: SnackPosition.TOP,
//         snackStyle: SnackStyle.FLOATING,
//         duration: const Duration(seconds: 3),
//         title: title,
//         message: parsedMessage,
//         titleText: titleText,
//         messageText: messageText,
//         backgroundColor: const Color(0x55555555),
//         barBlur: 10,
//         icon: icon,
//         onTap: (_) {
//           Get.closeCurrentSnackbar();
//         },
//         mainButton: mainButton ??
//             const Icon(
//               CupertinoIcons.xmark_circle_fill,
//               size: 16,
//             ).marginOnly(right: 16)),
//   );
//   return controller;
// }

// enum PushType {
//   normal,
//   replace,
//   replaceAll,
// }