import 'package:flutter/material.dart';

extension DynamicColor on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
}