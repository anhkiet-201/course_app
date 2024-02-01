import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'login_sheet_controller.g.dart';

class LoginSheetController = _LoginSheetControllerBase
    with _$LoginSheetController;

abstract class _LoginSheetControllerBase extends BaseController
    with Store {
  
  @readonly
  bool _isValid = false;
  
  final _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  String get email => _emailController.text;
  String get password => _passwordController.text;

  @action
  void onTextChange() {
    // TODO: Need implement email and password validation
    if(_emailController.text.trim().isEmpty || _passwordController.text.isEmpty) {
      _isValid = false;
    } else {
      _isValid = true;
    }
  }

  // Disposes of the video controller to release resources:
  @override
  FutureOr onDispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }
}
