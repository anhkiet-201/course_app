import 'package:kt_course/core/base/repository/base_repository.dart';

abstract interface class ChatRepository extends BaseRepository {
  connect();

  disconnect();
}