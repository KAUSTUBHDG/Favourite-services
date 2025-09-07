import 'package:dartz/dartz.dart';
import '/core/networking/failure.dart';
import '/domain/entities/app_theme_entity.dart';

// An abstract repository interface for managing application data.
///
/// The [AppRepository] serves as a contract for any implementation that
/// provides access to application-related data, such as theme settings.
/// It defines the necessary methods that concrete classes must implement
/// to retrieve data.
abstract class AppRepository {
  Future<Either<Failure, AppEntity>> getAppThemeData();
}
