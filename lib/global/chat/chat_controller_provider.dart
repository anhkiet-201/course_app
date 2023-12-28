import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/chat/controller/chat_controller.dart';

mixin ChatControllerProvider {
  ChatController get chatController => injector.get<ChatController>();
}