import 'package:logger/logger.dart';

final log = _AppLogger();

class _AppLogger {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2, // Number of method calls to be displayed
        errorMethodCount: 8, // Number of method calls if stacktrace is provided
        lineLength: 120, // Width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );

  void d(dynamic message) => _logger.d(message);

  void i(dynamic message) => _logger.i(message);

  void w(dynamic message, {dynamic error, StackTrace? stackTrace}) =>
      _logger.w(message, error: error, stackTrace: stackTrace);

  void e(dynamic error, {Object? message, StackTrace? stackTrace}) =>
      _logger.e(message ?? 'Error', error: error, stackTrace: stackTrace);
  
}
