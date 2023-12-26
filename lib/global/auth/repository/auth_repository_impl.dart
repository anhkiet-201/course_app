import 'package:google_sign_in/google_sign_in.dart';
import 'package:kt_course/core/data/network/firebase/firebase_provider.dart';
import 'package:kt_course/core/data/network/model/auth/login_provider.dart';
import 'package:kt_course/core/services/services_provider.dart';
import 'package:kt_course/global/auth/repository/auth_repository.dart';

class AuthRepositoryImpl with ApiServiceProvider, FirebaseAuthProvider implements AuthRepository {
  @override
  Future<bool> login(LoginProvider provider) async {
    return apiService.login(provider);
  }

  @override
  Future<bool> logout() async {
    GoogleSignIn().disconnect();
    return apiService.logout();
  }
  
  @override
  bool get isLogin => auth.currentUser != null;
}