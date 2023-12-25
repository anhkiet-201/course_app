import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:kt_course/common/firebase_options.dart';
import 'package:kt_course/core/data/network/impl/srevices/api_service_impl.dart';
import 'package:kt_course/core/data/network/services/api_service.dart';
import 'package:kt_course/core/navigation/navigator.dart';
import 'package:kt_course/app/navigation/navigator_impl.dart';
// import 'package:kt_course/global/note/repository/note_repository.dart';
// import 'package:kt_course/global/note/repository/note_repository_impl.dart';

final injector = Injector();

class Injector {
  final _getIt = GetIt.I;

  initialize() async {
    await _initializeEnv();
    await _initializeFirebase();
    _injectServices();
    _injectRepository();
    _injectNavigator();
  }

  _initializeEnv() async {
    await dotenv.load(fileName: ".env");
  }

  _initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
  }

  _injectServices() {
    _getIt.registerLazySingleton<ApiService>(ApiServiceImpl.new);
  }

  _injectRepository() {
    // _getIt.registerLazySingleton<NoteRepository>(NoteRepositoryImpl.new);
  }

  _injectNavigator() {
    _getIt.registerLazySingleton<Navigator>(NavigatorImpl.new);
  }

  T get<T extends Object>({String? instanceName}) {
    return _getIt.get<T>(instanceName: instanceName);
  }
}
