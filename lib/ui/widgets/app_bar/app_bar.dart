import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  
  final String titleText;

  CustomAppBar({super.key, required this.titleText, super.elevation, super.actions}) : super(
    title: Text(
      titleText,
      style: const TextStyle(
        fontWeight: FontWeight.bold
      ),
    ),
    centerTitle: true,
    leading: const CloseButton()
  );
}