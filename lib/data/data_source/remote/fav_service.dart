import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:favorite_services_app/data/models/service_model.dart';
import 'package:favorite_services_app/domain/entities/service.dart';
import '/core/networking/api_client.dart';
import '/core/networking/failure.dart';
import '/core/networking/http_method.dart';
import '/data/models/login_data_model.dart';
import '/domain/entities/client_details_data_entity.dart';

class FavServiceRemoteDataSource {
  FavServiceRemoteDataSource(this._apiClient);

  final UnauthenticatedApiClient _apiClient;

  Future<Either<Failure, List<ServiceEntity>>> fetchServices({
    int page = 1,
    int limit = 20,
  }) async {
    return await _apiClient.request(
      url: '/posts',
      method: Method.get,
      queryParams: {'_page': page, '_limit': limit},
      responseParser: (Response<dynamic> response) {
        final raw = response.data as List<dynamic>;
        final models =
            raw
                .map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
                .toList();
        // Cast to List<ServiceEntity>
        return models.cast<ServiceEntity>();
      },
    );
  }
}
