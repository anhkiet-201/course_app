import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:kt_course/impl/services/api_service_impl.dart';
import 'package:kt_course/impl/services/app_service_impl.dart';

final injector = Injector();

class Injector {
  final _getIt = GetIt.I;

  initialize() async {
    await _initializeEnv();
    _injectServices();
  }

  _initializeEnv() async {
    await dotenv.load(fileName: ".env");
  }

  _injectServices() {
    _getIt.registerLazySingleton(ApiServiceImpl.new);
    _getIt.registerLazySingleton(AppServiceImpl.new);
  }

  T get<T extends Object>({String? instanceName}) {
    return _getIt.get<T>(instanceName: instanceName);
  }
}
