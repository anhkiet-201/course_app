import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/widgets/custom_textfield/custom_textfield.dart';
import 'package:kt_course/ui/widgets/login/controller/login_sheet_controller.dart';

class LoginSheet extends StatelessWidget
    with ControllerProvider<LoginSheetController> {
  const LoginSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Login',
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.color.onBackground,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Don\'t miss out! Login and unlock exclusive content',
              style: context.textTheme.bodySmall
                  ?.copyWith(color: context.color.onBackground),
            ),
            const SizedBox(
              height: 70,
            ),
            _emailField,
            const SizedBox(
              height: 10,
            ),
            _passwordField,
            const SizedBox(
              height: 10,
            ),
            _loginButton
          ],
        ),
      ),
    );
  }

  Widget get _emailField => Builder(builder: (context) {
        return CustomTextField(
          controller: controller(context).emailController,
          onChanged: (_) => controller(context).onTextChange(),
          hintText: 'Email',
          prefixIcon: const Icon(Icons.email_outlined),
        );
      });

  Widget get _passwordField => Builder(builder: (context) {
        return CustomTextField(
          controller: controller(context).passwordController,
          onChanged: (_) => controller(context).onTextChange(),
          hintText: 'Password',
          prefixIcon: const Icon(Icons.password_rounded),
        );
      });

  Widget get _loginButton => Observer(builder: (context) {
        final ctrl = controller(context);
        return IconButton.filled(
          onPressed: ctrl.isValid ? () => nav.pop(result: (ctrl.email, ctrl.password)) : null,
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Continue',
                  style: TextStyle(color: context.color.background))
            ],
          ),
          style: IconButton.styleFrom(
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              backgroundColor: context.color.onBackground),
        );
      });
}
