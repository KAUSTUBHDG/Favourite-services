import 'package:dartz/dartz.dart';
import '/core/networking/failure.dart';
import '/domain/entities/app_theme_entity.dart';
import '/domain/repository/app_repository.dart';

/// A use case class for managing application-specific operations.
///
/// The [AppUseCase] class acts as an intermediary between the presentation
/// layer and the repository layer. It encapsulates the business logic required
/// to retrieve application-related data, specifically the app theme data.
///
/// This class relies on an implementation of [AppRepository] to fetch
/// the required data, allowing for separation of concerns and easier
/// testing.
/// Creates an instance of [AppUseCase] with the specified [AppRepository].
///
/// This constructor initializes the use case with a concrete repository
/// implementation that handles data retrieval operations.
///
/// [_repository] is the instance of [AppRepository] used to access
/// application data.
class AppUseCase {
  AppUseCase(this._repository);
  final AppRepository _repository;

  /// Retrieves the temporary application theme data.
  ///
  /// This method delegates the data retrieval task to the repository layer,
  /// allowing for a consistent interface for fetching app-related data.
  ///
  /// Returns:
  /// * An [Either<Failure, AppThemeEntity>] representing the result of the data retrieval operation. On success, it returns an instance of [AppEntity]. On failure, it returns a [Failure] object indicating the error.
  Future<Either<Failure, AppEntity>> getAppThemeData() {
    return _repository.getAppThemeData();
  }
}
