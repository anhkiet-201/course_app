import 'package:kt_course/core/services/model/user/user.dart';
import 'package:kt_course/core/services/services_provider.dart';
import 'package:kt_course/global/auth/repository/auth_repository.dart';
import 'package:kt_course_apis/core/service/model/request/login.dart';
import 'package:kt_course_apis/core/service/model/request/login_with_google.dart';

class AuthRepositoryImpl with ApiServiceProvider implements AuthRepository {

  @override
  Future<bool> login(LoginMethodProvider loginMethodProvider) async {
    if (loginMethodProvider is EmailAndPasswordLoginProvider) {
      await apiService.login(LoginRequest(
          email: loginMethodProvider.email,
          password: loginMethodProvider.password));
    } else if (loginMethodProvider is GoogleLoginProvider) {
      await apiService.loginWithGoogle(LoginWithGoogleRequest(
          idToken: (loginMethodProvider).accessToken));
    }
    return true;
  }

  @override
  Future<bool> logout({bool allDevices = false}) async {
    if (allDevices) {
      await apiService.logoutAll();
    } else {
      await apiService.logoutCurrent();
    }
    return true;
  }

  @override
  Future<User> getProfile() async {
    final data = await apiService.getProfile();
    return User(
      email: data.email,
      name: data.name
    );
  }
}
