import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:favorite_services_app/core/networking/network_constants.dart';
import 'package:flutter/services.dart';
import '/core/constants/strings.dart';
import '/core/di/di.dart';
import '/core/extension/num_extension.dart';
import '/core/extension/string_extension.dart';
import '/core/logger/logger_const.dart';
import '/core/networking/failure.dart';
import '/core/networking/http_method.dart';
import '/core/networking/network_interceptor.dart';
import '/core/shared_prefs/local_storage.dart';
import '/core/shared_prefs/local_storage_keys.dart';
import '/data/models/error_model.dart';

/// A service class for handling network requests using the Dio library.
///
/// This class provides a structured way to make HTTP requests, manage
/// authentication headers, and handle responses with appropriate error
/// handling. It allows for both authenticated and unauthenticated requests
/// based on the `isAuthenticationNeeded` flag.
///
/// The base URL for requests is initialized from the app's configuration.
///
/// ## Usage
/// To make requests, instantiate a subclass of this service (e.g.,
/// `AuthenticatedApiClient`, `UnauthenticatedApiClient`) and call the
/// `request` method with the desired parameters.
///
/// ## Example
/// ```dart
/// final apiClient = AuthenticatedApiClient();
/// final result = await apiClient.request<MyResponseType>(
///   url: '/endpoint',
///   method: Method.get,
///   responseParser: (response) => MyResponseType.fromJson(response.data),
/// );
/// ```
class NetworkService {
  /// Creates an instance of [NetworkService].
  ///
  /// The [isAuthenticationNeeded] parameter determines whether
  /// authentication is required for requests made using this service.
  /// The base URL for requests is set from the application configuration.
  ///
  /// Parameters:
  /// *[isAuthenticationNeeded]: A boolean flag indicating if authentication
  ///   is required for network requests (default is false).
  NetworkService({this.isAuthenticationNeeded = true}) {
    initInterceptors();
  }

  final Dio _dio = locator<Dio>();

  /// A flag indicating whether authentication is needed for requests.
  bool isAuthenticationNeeded;

  /// Initializes network interceptors for the Dio instance.
  ///
  /// This method sets up necessary interceptors such as retry logic for
  /// network requests.
  void initInterceptors() {
    _dio.interceptors.add(NetworkInterceptor(retryAPI: _dio));
  }

  /// Sends an HTTP request and processes the response.
  ///
  /// This method is responsible for constructing and sending the HTTP
  /// request using the Dio client, handling authentication, and parsing
  /// the response.
  ///
  /// Parameters:
  /// *[url]: The endpoint URL for the request.
  /// *[method]: The HTTP method to be used for the request (e.g., GET, POST).
  /// *[responseParser]: A function that parses the response into a type [T].
  /// *[baseUrl]: An optional base URL to prepend to the request URL.
  /// *[params]: Optional parameters to include in the request body.
  /// *[options]: Optional options for the request.
  /// *[queryParams]: Optional query parameters to include in the URL.
  ///
  /// Returns:
  /// A [Future] that resolves to either a [Failure] or the parsed response
  /// of type [T].
  ///
  /// Throws:
  /// *[SocketException]: If there is no internet connection.
  /// *[FormatException]: If the response format is invalid.
  /// *[DioException]: For HTTP errors or request failures.
  ///
  Future<Either<Failure, T>> request<T>({
    required final String url,
    required final Method method,
    required final T Function(Response<dynamic>) responseParser,
    final String? baseUrl,
    final Map<String, dynamic>? params,
    final Option<dynamic>? options,
    final Map<String, dynamic>? queryParams,
  }) async {
    _dio.options.baseUrl = NetworkConstants.baseUrl;

    Response<dynamic> response;
    final String? accessToken = await _getAccessToken();

    if (isAuthenticationNeeded) {
      _dio.options.headers = <String, dynamic>{
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      }..removeWhere((String key, dynamic value) => value == null);
    } else if (!_dio.options.headers.containsKey('AUTHTOKEN')) {
      _dio.options.headers = <String, dynamic>{
        'Content-Type': 'application/json',
      }..removeWhere((String key, dynamic value) => value == null);
    }
    if (url.isEmpty) {
      return Left<Failure, T>(const Failure('-1', 'URL is required'));
    }
    try {
      switch (method) {
        case Method.post:
          response = await _dio.post(
            url,
            data: params,
            queryParameters: queryParams,
          );
          break;
        case Method.delete:
          response = await _dio.delete(url, queryParameters: queryParams);
          break;
        case Method.patch:
          response = await _dio.patch(
            url,
            data: params,
            queryParameters: queryParams,
          );
          break;
        case Method.get:
          response = await _dio.get(url, queryParameters: queryParams);
          break;
        case Method.put:
          response = await _dio.put(
            url,
            data: params,
            queryParameters: queryParams,
          );
          break;
      }

      if (response.statusCode != null) {
        if (response.statusCode!.inRange(200, 299)) {
          logger
            ..info(
              '======> REQUEST [$method]\n'
              'BASEURL         : ${_dio.options.baseUrl}\n'
              'PATH            : $url\n'
              'REQUEST VALUES  : $queryParams\n'
              'HEADERS         : ${_dio.options.headers}\n'
              'DATA            : ${params.toString()}\n',
            )
            ..info(
              '<====== RESPONSE [${response.requestOptions.method}]\n'
              'BASEURL         : ${response.requestOptions.baseUrl}\n'
              'PATH            : ${response.requestOptions.path}\n'
              'HEADER          : ${response.headers}\n'
              'STATUS CODE     : [${response.statusCode}]\n'
              'DATA            : ${response.data}\n',
            );
          try {
            return Right<Failure, T>(responseParser(response));
          } catch (e) {
            logger
              ..error(
                '======> REQUEST [$method]\n'
                'BASEURL       : ${_dio.options.baseUrl}\n'
                'PATH          : $url\n'
                'REQUEST VALUES: $queryParams\n'
                'HEADERS       : ${_dio.options.headers}\n'
                'DATA          :${params.toString()}\n',
              )
              ..error(
                '<====== RESPONSE [${response.requestOptions.method}]\n'
                'BASEURL         : ${response.requestOptions.baseUrl}\n'
                'PATH            : ${response.requestOptions.path}\n'
                'HEADER          : ${response.headers}\n'
                'STATUS CODE     : [${response.statusCode}]\n'
                'DATA            : ${response.data}\n',
              )
              ..error(e);
            return const Left<Failure, Never>(
              Failure('-1', AppStrings.jsonFormatErrorMessage),
            );
          }
        }
        if (response.statusCode!.inRange(400, 499)) {
          logger
            ..error(
              '======> REQUEST [$method]\n'
              'BASEURL        : ${_dio.options.baseUrl}\n'
              'PATH           : $url\n'
              'REQUEST VALUES : $queryParams\n'
              'HEADERS        : ${_dio.options.headers}\n'
              'DATA           : ${params.toString()}\n',
            )
            ..error(
              '<====== RESPONSE [${response.requestOptions.method}]\n'
              'BASEURL      : ${response.requestOptions.baseUrl}\n'
              'PATH         : ${response.requestOptions.path}\n'
              'HEADERS      : ${response.headers}\n'
              'STATUS CODE  : [${response.statusCode}]\n'
              'DATA         : ${response.data}\n',
            );
          if (response.statusCode == 422) {
            final ErrorModel error = ErrorModel.fromJson(
              response.data['errors'],
            );
            return Left<Failure, T>(
              Failure(error.errorCode.toString(), error.errorMessage),
            );
          }
          return Left<Failure, T>(
            Failure(
              response.statusCode.toString(),
              response.statusMessage ?? '',
            ),
          );
        }
        if (response.statusCode!.inRange(500, 599)) {
          logger
            ..error(
              '======> REQUEST [$method]\n'
              'BASEURL        : ${_dio.options.baseUrl}\n'
              'PATH           : $url\n'
              'REQUEST VALUES : $queryParams\n'
              'HEADERS        : ${_dio.options.headers}\n'
              'DATA           : ${params.toString()}\n',
            )
            ..error(
              '<====== RESPONSE [${response.requestOptions.method}]\n'
              'BASEURL      : ${response.requestOptions.baseUrl}\n'
              'PATH         : ${response.requestOptions.path}\n'
              'HEADERS      : ${response.headers}\n'
              'STATUS CODE  : [${response.statusCode}]\n'
              'DATA         : ${response.data}\n',
            );
          return Left<Failure, T>(
            ServerFailure(
              response.statusCode!.toString(),
              response.statusMessage?.orEmpty() ?? '',
            ),
          );
        }
        logger
          ..error(
            '======> REQUEST [$method]\n'
            'BASEURL        : ${_dio.options.baseUrl}\n'
            'PATH           : $url\n'
            'REQUEST VALUES : $queryParams\n'
            'HEADERS        : ${_dio.options.headers}\n'
            'DATA           : ${params.toString()}\n',
          )
          ..error(
            '<====== RESPONSE [${response.requestOptions.method}]\n'
            'BASEURL      : ${response.requestOptions.baseUrl}\n'
            'PATH         : ${response.requestOptions.path}\n'
            'HEADERS      : ${response.headers}\n'
            'STATUS CODE  : [${response.statusCode}]\n'
            'DATA         : ${response.data}\n',
          );
        return const Left<Failure, Never>(
          Failure('-1', AppStrings.defaultErrorMessage),
        );
      } else {
        logger
          ..error(
            '======> REQUEST [$method]\n'
            'BASEURL        : ${_dio.options.baseUrl}\n'
            'PATH           : $url\n'
            'REQUEST VALUES : $queryParams\n'
            'HEADERS        : ${_dio.options.headers}\n'
            'DATA           : ${params.toString()}\n',
          )
          ..error(
            '<====== RESPONSE [${response.requestOptions.method}]\n'
            'BASEURL      : ${response.requestOptions.baseUrl}\n'
            'PATH         : ${response.requestOptions.path}\n'
            'HEADERS      : ${response.headers}\n'
            'STATUS CODE  : [${response.statusCode}]\n'
            'DATA         : ${response.data}\n',
          );
        return const Left<Failure, Never>(
          Failure('-1', AppStrings.defaultErrorMessage),
        );
      }
    } on SocketException catch (e) {
      logger
        ..error(
          '======> REQUEST [$method]\n'
          'BASEURL        : ${_dio.options.baseUrl}\n'
          'PATH           : $url\n'
          'REQUEST VALUES : $queryParams\n'
          'HEADERS        : ${_dio.options.headers}\n'
          'DATA           : ${params.toString()}\n',
        )
        ..error(e);
      return const Left<Failure, Never>(
        SocketFailure('-1', AppStrings.noInternetErrorMessage),
      );
    } on FormatException catch (e) {
      logger
        ..error(
          '======> REQUEST [$method]\n'
          'BASEURL        : ${_dio.options.baseUrl}\n'
          'PATH           : $url\n'
          'REQUEST VALUES : $queryParams\n'
          'HEADERS        : ${_dio.options.headers}\n'
          'DATA           : ${params.toString()}\n',
        )
        ..error(e);
      return const Left<Failure, Never>(
        FormatFailure('-1', AppStrings.formatErrorMessage),
      );
    } on DioException catch (e) {
      if (e.error.runtimeType == SocketException) {
        return const Left<Failure, Never>(
          SocketFailure('-1', AppStrings.noInternetErrorMessage),
        );
      }
      if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
        logger
          ..error(
            '======> REQUEST [$method]\n'
            'BASEURL        : ${_dio.options.baseUrl}\n'
            'PATH           : $url\n'
            'REQUEST VALUES : $queryParams\n'
            'HEADERS        : ${_dio.options.headers}\n'
            'DATA           : ${params.toString()}\n',
          )
          ..error(
            '<====== RESPONSE [${e.response?.requestOptions.method}]\n'
            'BASEURL      : ${e.response?.requestOptions.baseUrl}\n'
            'PATH         : ${e.response?.requestOptions.path}\n'
            'HEADERS      : ${e.response?.headers}\n'
            'STATUS CODE  : [${e.response?.statusCode}]\n'
            'DATA         : ${e.response?.data}\n',
          );
      }
      if ((e.response?.statusCode ?? 0) >= 400 &&
          (e.response?.statusCode ?? 0) < 499) {
        logger.error(
          '======> REQUEST [$method]\n'
          'BASEURL        : ${_dio.options.baseUrl}\n'
          'PATH           : $url\n'
          'REQUEST VALUES : $queryParams\n'
          'HEADERS        : ${_dio.options.headers}\n'
          'DATA           : ${params.toString()}\n',
        );
        return Left<Failure, T>(
          Failure(
            '${e.response?.statusCode ?? '-1'}',
            e.response?.statusMessage ?? AppStrings.defaultErrorMessage,
          ),
        );
      }
      logger
        ..error(
          '======> REQUEST [$method]\n'
          'BASEURL        : ${_dio.options.baseUrl}\n'
          'PATH           : $url\n'
          'REQUEST VALUES : $queryParams\n'
          'HEADERS        : ${_dio.options.headers}\n'
          'DATA           : ${params.toString()}\n',
        )
        ..error('********************** $e');
      return Left<Failure, T>(
        Failure(e.response?.statusCode?.toString() ?? '-1', e.message ?? ''),
      );
    } on PlatformException catch (e) {
      logger
        ..error(
          '======> REQUEST [$method]\n'
          'BASEURL        : ${_dio.options.baseUrl}\n'
          'PATH           : $url\n'
          'REQUEST VALUES : $queryParams\n'
          'HEADERS        : ${_dio.options.headers}\n'
          'DATA           : ${params.toString()}\n',
        )
        ..error(e);
      return Left<Failure, T>(Failure('-1', e.message!));
    } catch (e) {
      logger
        ..error(
          '======> REQUEST [$method]\n'
          'BASEURL        : ${_dio.options.baseUrl}\n'
          'PATH           : $url\n'
          'REQUEST VALUES : $queryParams\n'
          'HEADERS        : ${_dio.options.headers}\n'
          'DATA           : ${params.toString()}\n',
        )
        ..error(e);
      return Left<Failure, T>(Failure('-1', e.toString()));
    }
  }

  /// Retrieves the access token from local storage.
  ///
  /// This method is used to get the current user's access token, which is
  /// required for authenticated requests.
  ///
  /// Returns:
  /// A [Future] that resolves to the access token as a [String], or null
  /// if no token is found.
  Future<String?> _getAccessToken() async =>
      LocalStorage.instance.getString(key: LocalStorageKeys.accessToken);
}
