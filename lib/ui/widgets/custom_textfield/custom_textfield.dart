import 'package:flutter/material.dart';
import 'package:kt_course/common/color/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      this.maxLines,
      this.style,
      this.controller,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon});

  final String? hintText;
  final int? maxLines;
  final TextStyle? style;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.primaryContainer,
      child: TextFormField(
          maxLines: maxLines,
          controller: controller,
          style: style ?? TextStyle(color: context.color.onPrimaryContainer),
          obscureText: obscureText,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon)),
    );
  }
}
