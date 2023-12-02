import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kt_course/core/services/services_provider.dart';
import 'package:kt_course/global/app/repository/app_repository.dart';
import 'package:kt_course/core/data/network/model/user/user.dart' as u;

class AppRepositoryImpl with ApiServiceProvider implements AppRepository {
  @override
  Future<bool> login() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await apiService.login(credential);
  }

  @override
  u.User getCurrentUser() => apiService.getCurrentuser();
  
  @override
  Future<bool> logout() async {
    return await apiService.logout();
  }

  @override
  bool get isLogin => apiService.isLogin;
}