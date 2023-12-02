import 'package:kt_course/core/base/repository/base_repository.dart';
import 'package:kt_course/core/di/Injector.dart';

mixin RepositoryProvider<T extends BaseRepository> {
  T get repository => injector.get<T>();
}