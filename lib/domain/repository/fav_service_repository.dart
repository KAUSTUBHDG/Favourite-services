import 'package:dartz/dartz.dart';
import 'package:favorite_services_app/domain/entities/service.dart';
import '/core/networking/failure.dart';
import '/domain/entities/client_details_data_entity.dart';

abstract class FavServiceRepository {
  Future<Either<Failure, List<ServiceEntity>>> fetchServices({
    int page = 1,
    int limit = 20,
  });
  Set<int> getFavoriteIds();
  Future<void> toggleFavorite(int serviceId);
}
