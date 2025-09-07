import 'package:dartz/dartz.dart';
import '/core/networking/failure.dart';
import '/data/data_source/remote/app_data_source.dart';
import '/domain/entities/app_theme_entity.dart';
import '/domain/repository/app_repository.dart';

/// Implementation of the [AppRepository] interface for managing application data.
///
/// The `AppRepositoryImpl` class acts as a bridge between the application's
/// data sources and the rest of the application. It uses an instance of
/// [AppRemoteDataSource] to fetch remote data related to the application.
/// Creates an instance of `AppRepositoryImpl`.
///
/// Parameters:
/// * [_remoteDataSource]: An instance of [AppRemoteDataSource] used to retrieve data from remote sources.
class AppRepositoryImpl extends AppRepository {
  AppRepositoryImpl(this._remoteDataSource);

  final AppRemoteDataSource _remoteDataSource;

  /// Fetches the application theme data from the remote data source.
  ///
  /// This method retrieves theme-related data by delegating the call to the
  /// [_remoteDataSource]. It returns an [Either<Failure, AppThemeEntity>]
  /// that indicates either the successful retrieval of the theme data or
  /// a failure containing error information.
  ///
  /// Returns:
  /// * An [Either<Failure, AppThemeEntity>] representing the result of the data retrieval operation. On success, it returns the parsed [AppEntity]. On failure, it returns a [Failure] object.
  @override
  Future<Either<Failure, AppEntity>> getAppThemeData() {
    return _remoteDataSource.getAppThemeData();
  }
}
