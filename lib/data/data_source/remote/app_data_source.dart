import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '/core/networking/api_client.dart';
import '/core/networking/failure.dart';
import '/core/networking/http_method.dart';
import '/data/models/app_theme_model.dart';
import '/domain/entities/app_theme_entity.dart';

/// A data source class responsible for fetching remote application data.
///
/// The `AppRemoteDataSource` utilizes an instance of `UnauthenticatedApiClient`
/// to make network requests for retrieving application-related information.
///
/// This class currently supports fetching the application theme data.
/// Creates an instance of `AppRemoteDataSource`.
///
/// Parameters:
/// * [_apiClient]: An instance of [UnauthenticatedApiClient] used for making
///   HTTP requests.
class AppRemoteDataSource {
  AppRemoteDataSource(this._apiClient);
  final UnauthenticatedApiClient _apiClient;

  /// Fetches the application theme data from a remote server.
  ///
  /// Makes a GET request to a specified URL and parses the response into
  /// an [AppEntity].
  ///
  /// Returns:
  /// * An [Either<Failure, AppThemeEntity>] which represents the outcome of the
  ///   request. On success, it returns the parsed [AppEntity]. On failure,
  ///   it returns a [Failure] object containing error information.
  Future<Either<Failure, AppEntity>> getAppThemeData() async {
    return await _apiClient.request(
      //TODO: Change this when actual data or its contract has been provided
      url: 'https://jsonplaceholder.typicode.com/users/1',
      method: Method.get,
      responseParser:
          (final Response<dynamic> response) =>
              AppModel.fromJson(response.data),
    );
  }
}
