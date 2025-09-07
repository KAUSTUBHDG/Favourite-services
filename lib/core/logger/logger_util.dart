import 'package:logger/logger.dart';

/// A utility class for logging messages with different severity levels.
///
/// The `LoggerUtil` class extends the `Logger` class to provide
/// structured logging capabilities. It offers methods to log messages
/// with various severity levels: error, warning, info, debug, and trace.
/// Each method prefixes the message with its corresponding level for clarity.
///
/// Example usage:
/// ```dart
/// final logger = LoggerUtil(printer: ConsolePrinter(), level: Level.debug);
/// logger.info('This is an informational message.');
/// logger.error('An error occurred', error: someError);
/// ```
///
/// ### Parameters:
/// - `printer`: An instance of a class implementing `LogPrinter`, used
///   to determine how logs are output.
/// - `level`: An instance of `Level` that defines the minimum severity
///   of messages that will be logged.
///
/// ### Methods:
/// - `error(dynamic message, {dynamic error, StackTrace? stackTrace})`:
///   Logs an error message with the `[ERROR]` prefix.
///
/// - `warn(dynamic message, {dynamic error, StackTrace? stackTrace})`:
///   Logs a warning message with the `[WARNING]` prefix.
///
/// - `info(dynamic message, {dynamic error, StackTrace? stackTrace})`:
///   Logs an informational message with the `[INFO]` prefix.
///
/// - `debug(dynamic message, {dynamic error, StackTrace? stackTrace})`:
///   Logs a debug message with the `[DEBUG]` prefix.
///
/// - `trace(dynamic message, {dynamic error, StackTrace? stackTrace})`:
///   Logs a trace message with the `[TRACE]` prefix.
///
/// ### Static Methods:
/// - `static Level logLevel({bool replicateNonTestEnv = false})`:
///   Returns the log level to be used, defaulting to `Level.debug`.
///
/// This class is designed to enhance logging capabilities and improve
/// the readability of log outputs.

class LoggerUtil extends Logger {
  LoggerUtil({
    required this.printer,
    required this.level,
  }) : super(printer: printer, level: level);

  LogPrinter printer;
  Level level;

  void error(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    e(
      _createBox('[ERROR]', '$message'),
      error: error,
      stackTrace: stackTrace,
    );
  }

  void warn(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    w(
      _createBox('[WARNING]', '$message'),
      error: error,
      stackTrace: stackTrace,
    );
  }

  void info(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    i(
      _createBox('[INFO]', '$message'),
      error: error,
      stackTrace: stackTrace,
    );
  }

  void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    d(
      _createBox('[DEBUG]', '$message'),
      error: error,
      stackTrace: stackTrace,
    );
  }

  void trace(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    t(
      _createBox('[TRACE]', '$message'),
      error: error,
      stackTrace: stackTrace,
    );
  }

  static Level logLevel({
    bool replicateNonTestEnv = false,
  }) =>
      Level.debug;

  String _createBox(String label, String message) {
    const int lineLength = 100; // Adjust this for longer/shorter lines
    final String border = '═' * lineLength;

    final String _processedMessage = _processMessage(message);

    // Format the label
    final String formattedLabel = label.padRight(lineLength - 2);

    // Wrap the message with line truncation
    final String formattedMessage = _wrapMessage(_processedMessage, lineLength);

    return '''
╔$border╗
║ $formattedLabel ║
╠$border╣
$formattedMessage
╚$border╝
''';
  }

  String _wrapMessage(String message, int maxLength) {
    final List<String> lines = <String>[];

    message.split('\n').forEach((String line) {
      // If the line is too long, break it into smaller segments
      while (line.length > maxLength - 4) {
        lines.add('║ ${line.substring(0, maxLength - 4).trimRight()} ║');
        line = line.substring(maxLength - 4);
      }
      lines.add('║ ${line.trimRight().padRight(maxLength - 4)} ║');
    });

    return lines.join('\n');
  }

  String _processMessage(String message) {
    // Replace Base64-like strings for specific keys
    final RegExp base64Pattern =
        RegExp(r'"(imageUrl|profileImage|icon)"\s*:\s*"[^"]+"');
    return message.replaceAllMapped(base64Pattern, (Match match) {
      return '"${match.group(1)}": "[Base64 content truncated]"';
    });
  }
}
