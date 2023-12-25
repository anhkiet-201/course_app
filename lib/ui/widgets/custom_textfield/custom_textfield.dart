import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.hintText, this.maxLines, this.style, this.controller});
  final String? hintText;
  final int? maxLines;
  final TextStyle? style;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      style: style,
      decoration: InputDecoration(
          border: InputBorder.none, hintText: hintText),
    );
  }
}
