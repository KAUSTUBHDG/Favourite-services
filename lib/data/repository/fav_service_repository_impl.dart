import 'package:dartz/dartz.dart';
import 'package:favorite_services_app/data/data_source/local/local_db.dart';
import 'package:favorite_services_app/domain/entities/service.dart';
import '/core/networking/failure.dart';
import '../data_source/remote/fav_service.dart';
import '../../domain/repository/fav_service_repository.dart';

class FavServiceRepositoryImpl extends FavServiceRepository {
  FavServiceRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final FavServiceRemoteDataSource _remoteDataSource;
  final ServicesLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<ServiceEntity>>> fetchServices({
    int page = 1,
    int limit = 20,
  }) async {
    return await _remoteDataSource.fetchServices(page: page, limit: limit);
  }

  @override
  Set<int> getFavoriteIds() {
    return _localDataSource.getFavoriteIds();
  }

  @override
  Future<void> toggleFavorite(int serviceId) async {
    await _localDataSource.toggleFavorite(serviceId);
  }
}
