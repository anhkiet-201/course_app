import 'package:kt_course/core/base/repository/base_repository.dart';
import 'package:kt_course/core/data/network/model/user/user.dart';

abstract interface class AppRepository extends BaseRepository {
  Future<bool> login();

  User getCurrentUser();

  Future<bool> logout();

  bool get isLogin;
}