import 'package:kt_course/global/auth/auth_repository_provider.dart';
import 'package:kt_course/global/chat/repository/chat_repository.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class ChatRepositoryImpl with AuthRepositoryProvider implements ChatRepository {
  @override
  connect() async {
    await SendbirdChat.connect(
      authRepository.user.uid,
      nickname: authRepository.user.displayName
    );
  }
  
  @override
  disconnect() async {
    await SendbirdChat.disconnect();
  }
}