import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kt_course/core/data/network/firebase/firebase_provider.dart';
import 'package:kt_course/core/data/network/model/user/user.dart' as u;
import 'package:kt_course/core/data/network/services/api_service.dart';


class ApiServiceImpl with FirebaseAuthProvider implements ApiService {
  @override
  Future<bool> login(AuthCredential credential) async {
    final userCredential = await auth.signInWithCredential(credential);
    return userCredential.user != null;
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
      await GoogleSignIn().disconnect();
      await auth.signOut();
    } catch(_) {
      return false;
    }
    return true;
  }
  
  @override
  bool get isLogin => auth.currentUser != null;
}