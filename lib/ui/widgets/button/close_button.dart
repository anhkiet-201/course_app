import 'package:flutter/material.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/common/color/color.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({super.key, this.result});
  final Object? result;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        nav.pop(result: result);
      },
      child: Icon(
        Icons.close,
        color: context.color.onBackground,
      ),
    );
  }
}
