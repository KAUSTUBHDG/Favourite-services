import 'package:equatable/equatable.dart';
import '/core/extension/num_extension.dart';

/// Represents a general failure in the application.
///
/// This class serves as a base for different types of failures that can occur
/// throughout the application, providing a structured way to capture error
/// codes and messages.
class Failure extends Equatable {
  /// Creates an instance of [Failure].
  ///
  /// Parameters:
  /// * [errorCode]: A string representing the error code associated with
  ///   the failure.
  /// * [message]: A string containing a descriptive message about the
  ///   failure.
  const Failure(this.errorCode, this.message);

  /// The error code associated with the failure.
  final String errorCode;

  /// A descriptive message about the failure.
  final String message;

  @override
  List<Object?> get props => <Object>[errorCode, message];
}

/// Represents a failure that occurs on the server side.
///
/// This class extends [Failure] to specifically indicate errors that originate
/// from server responses.
class ServerFailure extends Failure {
  /// Creates an instance of [ServerFailure].
  ///
  /// Parameters:
  /// * [errorCode]: The error code returned from the server.
  /// * [message]: A descriptive message about the server failure.
  const ServerFailure(super.errorCode, super.message);
}

/// Represents a failure that occurs on the client side.
///
/// This class extends [Failure] to specifically indicate errors that occur
/// due to client-related issues.
class ClientFailure extends Failure {
  /// Creates an instance of [ClientFailure].
  ///
  /// Parameters:
  /// * [errorCode]: The error code indicating the client failure.
  /// * [message]: A descriptive message about the client failure.
  const ClientFailure(super.errorCode, super.message);
}

/// Represents a failure related to database operations.
///
/// This class extends [Failure] to specifically indicate errors that occur
/// while interacting with the database.
class DatabaseFailure extends Failure {
  /// Creates an instance of [DatabaseFailure].
  ///
  /// Parameters:
  /// * [errorCode]: The error code indicating the database failure.
  /// * [message]: A descriptive message about the database failure.
  const DatabaseFailure(super.errorCode, super.message);
}

/// Represents a failure due to formatting issues.
///
/// This class extends [Failure] to indicate errors that occur during data
/// formatting processes.
class FormatFailure extends Failure {
  /// Creates an instance of [FormatFailure].
  ///
  /// Parameters:
  /// * [errorCode]: The error code indicating the formatting failure.
  /// * [message]: A descriptive message about the format failure.
  const FormatFailure(super.errorCode, super.message);
}

/// Represents a failure due to network socket issues.
///
/// This class extends [Failure] to specifically indicate errors related to
/// socket connections.
class SocketFailure extends Failure {
  /// Creates an instance of [SocketFailure].
  ///
  /// Parameters:
  /// * [errorCode]: The error code indicating the socket failure.
  /// * [message]: A descriptive message about the socket failure.
  const SocketFailure(super.errorCode, super.message);
}

/// Represents a failure due to authentication issues.
///
/// This class extends [Failure] to specifically indicate errors related to
/// authentication.
class AuthFailure extends Failure {
  /// Creates an instance of [AuthFailure].
  ///
  /// Parameters:
  /// * [errorCode]: The error code indicating the authentication failure.
  /// * [message]: A descriptive message about the authentication failure.
  const AuthFailure(super.errorCode, super.message);
}

/// Extension on [Failure?] to add utility methods for handling failure cases.
extension FailureExtension on Failure? {
  /// Determines if a refresh button should be shown based on the failure state.
  ///
  /// Returns:
  /// * `true` if the failure is `null` or if the error code does not fall
  ///   within the 400 to 499 range (indicating client errors),
  ///   suggesting that a refresh action is appropriate.
  /// * `false` if the error code indicates a client error.
  bool isShowRefreshButton() {
    if (this == null) {
      return true;
    }

    if (int.tryParse(this!.errorCode)?.inRange(400, 499) ?? false) {
      return false;
    }
    return true;
  }
}
