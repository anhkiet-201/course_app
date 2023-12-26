import 'package:kt_course/core/data/network/model/auth/login_provider.dart';

import '../../firebase/firebase_provider.dart';
import '../../model/user/user.dart' as u;
import '../../services/api_service.dart';


class ApiServiceImpl with FirebaseAuthProvider implements ApiService {
  @override
  Future<bool> login(LoginProvider provider) async {
    switch(provider) {
      case GoogleLoginProvider _:
        final userCredential = await auth.signInWithCredential(provider.credential);
        return userCredential.user != null;
      default:
        return false;
    }
  }

  @override
  u.User getCurrentuser() {
    final loginUser = auth.currentUser;
    return u.User(
      uid: loginUser?.uid ?? '',
      displayName: loginUser?.displayName,
      email: loginUser?.email,
      phoneNumber: loginUser?.phoneNumber,
      avatar: loginUser?.photoURL
    );
  }
  
  @override
  Future<bool> logout() async {
    try {
      // await GoogleSignIn().disconnect();
      await auth.signOut();
    } catch(_) {
      return false;
    }
    return true;
  }
}