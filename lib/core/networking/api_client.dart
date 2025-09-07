import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '/core/networking/failure.dart';
import '/core/networking/http_method.dart';
import '/core/networking/network_service.dart';

/// A client for making unauthenticated API requests.
///
/// This class extends [NetworkService] and indicates that authentication
/// is not required for the requests made using this client.
///
/// Sends an HTTP request and returns the response parsed as type [T].
///
/// Creates an instance of [UnauthenticatedApiClient].
///
/// The [isAuthenticationNeeded] flag is set to false, indicating
/// that this client does not require authentication for requests.
/// This method overrides the [request] method from [NetworkService] to
/// provide an implementation for unauthenticated requests.
///
/// Parameters:
/// * [url]: The URL to which the request is sent.
/// * [method]: The HTTP method (e.g., GET, POST).
/// * [responseParser]: A function that parses the response into type [T].
/// * [baseUrl]: An optional base URL to prepend to the request URL.
/// * [params]: Optional parameters to include in the request body.
/// * [options]: Optional options for the request.
/// * [queryParams]: Optional query parameters to include in the URL.
///
/// Returns:
/// A [Future] that resolves to either a [Failure] or the parsed response
/// of type [T].
class UnauthenticatedApiClient extends NetworkService {
  UnauthenticatedApiClient() : super(isAuthenticationNeeded: false);

  @override
  Future<Either<Failure, T>> request<T>({
    required String url,
    required Method method,
    required T Function(Response<dynamic> p1) responseParser,
    String? baseUrl,
    Map<String, dynamic>? params,
    Option<dynamic>? options,
    final Map<String, dynamic>? queryParams,
  }) async {
    return super.request(
      url: url,
      method: method,
      params: params,
      options: options,
      responseParser: responseParser,
      queryParams: queryParams,
    );
  }
}

/// A client for making authenticated API requests.
///
/// This class extends [NetworkService] and indicates that authentication
/// is required for the requests made using this client.
/// Creates an instance of [AuthenticatedApiClient].
///
/// The constructor does not require additional parameters, as it
/// uses the default behavior from [NetworkService].
/// Sends an HTTP request and returns the response parsed as type [T].
///
/// This method overrides the [request] method from [NetworkService] to
/// provide an implementation for authenticated requests.
///
/// Parameters:
/// * [url]: The URL to which the request is sent.
/// * [method]: The HTTP method (e.g., GET, POST).
/// * [responseParser]: A function that parses the response into type [T].
/// * [baseUrl]: An optional base URL to prepend to the request URL.
/// * [params]: Optional parameters to include in the request body.
/// * [options]: Optional options for the request.
/// * [queryParams]: Optional query parameters to include in the URL.
///
/// Returns:
/// A [Future] that resolves to either a [Failure] or the parsed response
/// of type [T].
class AuthenticatedApiClient extends NetworkService {
  @override
  Future<Either<Failure, T>> request<T>({
    required String url,
    required Method method,
    required T Function(Response<dynamic> p1) responseParser,
    String? baseUrl,
    Map<String, dynamic>? params,
    Option<dynamic>? options,
    final Map<String, dynamic>? queryParams,
  }) async {
    return super.request(
      url: url,
      method: method,
      params: params,
      options: options,
      responseParser: responseParser,
      queryParams: queryParams,
    );
  }
}
