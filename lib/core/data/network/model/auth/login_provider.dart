import 'package:firebase_auth/firebase_auth.dart';

abstract interface class LoginProvider {}

class GoogleLoginProvider implements LoginProvider {
  final AuthCredential credential;
  const GoogleLoginProvider(this.credential);
}

class EmailAndPasswordProvider implements LoginProvider {
  final String email;
  final String password;
  const EmailAndPasswordProvider({required this.email, required this.password});
}