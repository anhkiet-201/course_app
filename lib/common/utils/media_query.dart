import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension MediaQueryHelper on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);  
  TextTheme get textTheme => Theme.of(this).textTheme;
}