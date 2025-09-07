import 'package:dartz/dartz.dart';
import 'package:favorite_services_app/domain/entities/service.dart';
import '/core/networking/failure.dart';
import '../repository/fav_service_repository.dart';

class FavServiceUseCase {
  FavServiceUseCase(this._repository);
  final FavServiceRepository _repository;

  Future<Either<Failure, List<ServiceEntity>>> fetchServices({
    int page = 1,
    int limit = 20,
  }) async {
    return await _repository.fetchServices(page: page, limit: limit);
  }

  Set<int> getFavoriteIds() {
    return _repository.getFavoriteIds();
  }

  Future<void> toggleFavorite(int serviceId) async {
    await _repository.toggleFavorite(serviceId);
  }
}
