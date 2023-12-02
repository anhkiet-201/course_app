import 'package:firebase_auth/firebase_auth.dart';
import 'package:kt_course/core/data/network/model/user/user.dart' as u;
abstract interface class ApiService {
  Future<bool> login(AuthCredential credential);

  u.User getCurrentuser();

  Future<bool> logout();

  bool get isLogin;
}