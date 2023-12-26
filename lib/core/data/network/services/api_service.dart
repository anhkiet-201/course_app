import 'package:kt_course/core/data/network/model/auth/login_provider.dart';
import 'package:kt_course/core/data/network/model/user/user.dart' as u;
abstract interface class ApiService {
  Future<bool> login(LoginProvider provider);

  u.User getCurrentuser();

  Future<bool> logout();
}