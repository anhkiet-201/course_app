import 'package:kt_course/core/base/repository/base_repository.dart';
import 'package:kt_course/core/data/network/model/auth/login_provider.dart';
import 'package:kt_course/core/data/network/model/user/user.dart';

abstract interface class AuthRepository extends BaseRepository {
  Future<bool> login(LoginProvider provider);

  Future<bool> logout();

  bool get isLogin;

  User get user;
}