import 'package:kt_course/core/base/repository/base_repository.dart';
import 'package:kt_course/core/data/network/model/auth/login_provider.dart';

abstract interface class AuthRepository extends BaseRepository {
  Future<bool> login(LoginProvider provider);

  Future<bool> logout();

  bool get isLogin;
}