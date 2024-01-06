import 'package:kt_course/core/base/repository/base_repository.dart';

abstract interface class AuthRepository extends BaseRepository {
  Future<bool> login();

  Future<bool> logout();

  bool get isLogin;

  String get user;
}