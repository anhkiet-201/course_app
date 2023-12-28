import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/chat/repository/chat_repository.dart';

mixin ChatRepositoryProvider {
  ChatRepository get chatRepository => injector.get<ChatRepository>();
}