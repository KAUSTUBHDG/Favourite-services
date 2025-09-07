import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '/core/logger/logger_const.dart';
import '/core/routes/routes.dart';
import '/core/routes/routes_constants.dart';
import '/core/shared_prefs/local_storage.dart';
import '/core/shared_prefs/local_storage_keys.dart';

/// An interceptor for managing network requests and responses using the Dio library.
///
/// This class handles logging of requests and responses, error handling,
/// and the management of access and refresh tokens. It is particularly
/// useful for automatically refreshing access tokens when they expire or
/// when the server responds with a 401 or 403 status code.
///
/// ## Usage
/// Create an instance of [NetworkInterceptor] and add it to the Dio
/// instance to utilize its functionality. The interceptor will log
/// all requests and responses and handle token refreshing as needed.
///
/// ## Example
/// ```dart
/// final dio = Dio();
// Add the interceptor
/// dio.interceptors.add(NetworkInterceptor(retryAPI: dio));
/// ```
class NetworkInterceptor implements Interceptor {
  /// Creates an instance of [NetworkInterceptor].
  ///
  /// The [retryAPI] parameter is the Dio instance used to retry requests
  /// after refreshing the access token.
  ///
  /// Parameters:
  /// * [retryAPI]: The Dio instance used for retrying requests after token
  ///   refresh.
  NetworkInterceptor({required this.retryAPI});

  final Dio retryAPI;

  /// Handles errors that occur during a request.
  ///
  /// This method logs the error details and checks if the error is due to
  /// authentication issues (401 or 403). If so, it calls [checkResponseStatus]
  /// to attempt refreshing the token.
  ///
  /// Parameters:
  /// * [err]: The DioException representing the error that occurred.
  /// * [handler]: The handler to pass the error to the next interceptor.
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    logger.error(
      '<====== Error  [${err.response?.requestOptions.method}]\n '
      'BASEURL        : ${err.response?.requestOptions.baseUrl}\n'
      'PATH           : ${err.response?.requestOptions.path}\n'
      'Status Code    : [${err.response?.statusCode}]\n'
      'MESSAGE        : ${err.response}\n'
      'HEADERS        : ${err.response?.requestOptions.headers}\n'
      'DATA           : ${err.response?.data}',
    );
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      await checkResponseStatus(err, handler);
      return handler.resolve(err.response!);
    }

    return handler.next(err);
  }

  /// Checks the response status and attempts to refresh the access token.
  ///
  /// If the response status is 401 or 403, this method sends a request
  /// to refresh the token and retries the original request with the new
  /// access token.
  ///
  /// Parameters:
  /// * [err]: The DioException representing the error that occurred.
  /// * [handler]: The handler to pass the request to the next interceptor.
  Future<void> checkResponseStatus(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      logger.error('Authentication error: Refreshing token...');
      await _refreshAccessToken();
      final String? newToken = await _getAccessToken();
      err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
      final Response<dynamic> newRequest = await retryAPI.request(
        err.requestOptions.path,
        options: Options(
          headers: err.requestOptions.headers,
          method: err.requestOptions.method,
          responseType: err.requestOptions.responseType,
          followRedirects: err.requestOptions.followRedirects,
          maxRedirects: err.requestOptions.maxRedirects,
        ),
        data: err.requestOptions.data,
      );
      return handler.resolve(newRequest);
    }
    return handler.next(err);
  }

  Future<void> _refreshAccessToken() async {
    final String? refreshToken = await _getRefreshToken();
    if (refreshToken == null) {
      logger.error('No refresh token found.');
      return;
    }
    final Dio dio = Dio();
    dio.options.headers = <String, dynamic>{
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    try {
      final Response<dynamic> response = await dio.post(
        '',
        data: FormData.fromMap(<String, dynamic>{}),
      );
      final String _newAccessToken = response.data['access_token'];
      await _setAccessToken(_newAccessToken);
      logger.info('Token refreshed successfully.');
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
          logger.error('Refresh token expired or invalid: ${e.response?.data}');
          await _handleRefreshTokenExpiry();
        } else {
          logger.error(
            'Failed to refresh token with status code: ${e.response?.statusCode}, data: ${e.response?.data}',
          );
        }
      } else {
        logger.error('Failed to refresh token: $e');
      }
    }
  }

  Future<void> _handleRefreshTokenExpiry() async {
    await _reset();
    logger.info('User logged out due to expired refresh token.');
    final BuildContext? _context = appNavigatorKey.currentState?.context;
    if (_context != null) {
      await Navigator.of(_context).pushNamedAndRemoveUntil(
        RoutesConstants.login,
        (Route<dynamic> route) => false,
        arguments: 1,
      );
    }
  }

  /// Logs the details of outgoing requests.
  ///
  /// This method logs the request method, URL, headers, and any data
  /// associated with the request.
  ///
  /// Parameters:
  /// * [requestOptions]: The request options for the outgoing request.
  /// * [handler]: The handler to pass the request to the next interceptor.
  @override
  Future<void> onRequest(
    RequestOptions requestOptions,
    RequestInterceptorHandler handler,
  ) async {
    logger.info(
      '======> REQUEST   [${requestOptions.method}]\n'
      'BASEURL         : ${requestOptions.baseUrl}\n'
      'PATH            : ${requestOptions.path}\n'
      'REQUEST VALUES  : ${requestOptions.queryParameters}\n'
      'HEADERS         : ${requestOptions.headers}\n'
      'DATA            : ${requestOptions.data.toString()}',
    );

    return handler.next(requestOptions);
  }

  /// Logs the details of incoming responses.
  ///
  /// This method logs the response method, URL, headers, status code,
  /// and any data associated with the response.
  ///
  /// Parameters:
  /// * [response]: The incoming response.
  /// * [handler]: The handler to pass the response to the next interceptor.
  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    logger.info(
      '<====== RESPONSE  [${response.requestOptions.method}] \n'
      'BASEURL          : ${response.requestOptions.baseUrl}\n'
      'PATH             : ${response.requestOptions.path}\n'
      'Header           : {${response.headers}}\n'
      'Status Code      : [${response.statusCode}]\n'
      'DATA             : ${response.data}',
    );

    return handler.next(response);
  }

  /// Retrieves the refresh token from local storage.
  ///
  /// This method is used to obtain the current user's refresh token.
  ///
  /// Returns:
  /// A [String] representing the refresh token, or null if no token
  /// is found.
  Future<String?> _getRefreshToken() async =>
      await LocalStorage.instance.getString(key: LocalStorageKeys.refreshToken);

  /// Saves the new access token to local storage.
  ///
  /// Parameters:
  /// * [token]: The new access token to save.
  Future<void> _setAccessToken(String token) async => await LocalStorage
      .instance
      .setString(key: LocalStorageKeys.accessToken, value: token);

  /// Retrieves the current access token from local storage.
  ///
  /// This method is used to get the access token needed for
  /// authenticated requests.
  ///
  /// Returns:
  /// A [String] representing the access token, or null if no token
  /// is found.
  Future<String?> _getAccessToken() async =>
      await LocalStorage.instance.getString(key: LocalStorageKeys.accessToken);

  /// Resets the local storage by clearing all stored data.
  ///
  /// This method is used to clear the stored access and refresh tokens,
  /// typically when authentication fails.
  Future<void> _reset() async => LocalStorage.instance.clear();
}
