import 'package:kt_course/core/base/repository/base_repository.dart';
import 'package:kt_course/core/services/model/user/user.dart';

abstract class LoginMethodProvider {}

class EmailAndPasswordLoginProvider extends LoginMethodProvider {
  EmailAndPasswordLoginProvider({required this.email, required this.password});

  final String email;
  final String password;
}

class GoogleLoginProvider extends LoginMethodProvider {
  GoogleLoginProvider({required this.accessToken});
  final String accessToken;
}

abstract interface class AuthRepository extends BaseRepository {
  Future<bool> login(LoginMethodProvider loginMethodProvider);

  Future<bool> logout({bool allDevices});

  Future<User> getProfile();
}