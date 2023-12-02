import 'package:firebase_auth/firebase_auth.dart';

mixin FirebaseAuthProvider on Object {
  FirebaseAuth get auth => FirebaseAuth.instance;
}