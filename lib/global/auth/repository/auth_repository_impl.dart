import 'package:kt_course/core/services/services_provider.dart';
import 'package:kt_course/global/auth/repository/auth_repository.dart';

class AuthRepositoryImpl with ApiServiceProvider implements AuthRepository {
  @override
  Future<bool> login() async {
    return true;
  }

  @override
  Future<bool> logout() async {
    return true;
  }
  
  @override
  bool get isLogin => true;

  @override
  String get user => 'Anh Kiet';
}