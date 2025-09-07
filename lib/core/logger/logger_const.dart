import 'package:logger/logger.dart';
import '/core/logger/logger_util.dart';

/// Creates an instance of `LoggerUtil` for structured logging with a
/// custom printer configuration.
///
/// This example demonstrates how to initialize a `LoggerUtil` instance
/// using the `PrettyPrinter` to format log messages. The `PrettyPrinter`
/// is configured with specific settings to control the output format,
/// including the number of method calls to display, line length, and
/// the format of the timestamp.
///
/// ### Example:
/// ```dart
/// LoggerUtil logger = LoggerUtil(
///   printer: PrettyPrinter(
///     methodCount: 0, // No method calls will be included in the log output.
///     lineLength: 150, // Sets the maximum line length for log messages.
///     dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart, // Displays only the time since the start of the application.
///     printEmojis: false, // Disables emoji printing in log messages.
///   ),
///   level: LoggerUtil.logLevel(), // Sets the log level, defaulting to debug.
/// );
/// ```
///
/// ### Parameters:
/// - `printer`: An instance of `PrettyPrinter`, which formats the log output
///   with options for method count, line length, timestamp format, and emoji display.
/// - `level`: The logging level, determined by calling `LoggerUtil.logLevel()`.
///   This specifies the minimum severity of log messages that will be recorded.
///
/// This setup is particularly useful for development environments where
/// clear and concise log output is crucial for debugging and monitoring.
///
LoggerUtil logger = LoggerUtil(
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 150,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    printEmojis: false,
  ),
  level: LoggerUtil.logLevel(),
);
