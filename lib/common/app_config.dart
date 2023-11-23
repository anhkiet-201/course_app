import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  AppConfig._();
  static final firebaseApiKeyAndroid = dotenv.get('FIREBASE_API_KEY_ANDROID');
  static final firebaseApiKeyIos = dotenv.get('FIREBASE_API_KEY_IOS');
  static final firebaseAppId = dotenv.get('FIREBASE_APP_ID');
  static final firebaseMessagingSenderId = dotenv.get('FIREBASE_MESSAGING_SENDER_ID');
  static final firebaseProjectId = dotenv.get('FIREBASE_PROJECT_ID');
  static final firebaseStorageBucket = dotenv.get('FIREBASE_STORAGE_BUCKET');
}
