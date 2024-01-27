import 'package:flutter/material.dart';
import 'package:kt_course/ui/widgets/custom_textfield/custom_textfield.dart';

class LoginSheet extends StatelessWidget {
  const LoginSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _emailField,
          const SizedBox(height: 10,),
         _passwordField,
         
         ],
      ),
    );
  }

  Widget get _emailField => const CustomTextField(
        hintText: 'Email',
        prefixIcon: Icon(Icons.email_outlined),
      );

  Widget get _passwordField => const CustomTextField(
    hintText: 'Password',
    prefixIcon: Icon(Icons.password_rounded),
  );
}
