import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favorite_services_app/domain/entities/service.dart';
import 'package:favorite_services_app/domain/usecase/fav_service_usecase.dart';
import '/core/constants/strings.dart';
import '/core/logger/logger_const.dart';
import '/core/networking/failure.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._favServiceUseCase) : super(DashboardInitial()) {
    on<DashboardFetchedEvent>(_onFetched);
    on<FavoritesToggled>(_onToggled);
    on<FavoritesReloaded>(_onReloaded);
  }

  final FavServiceUseCase _favServiceUseCase;
  int _page = 1;
  final int _limit = 20;
  bool _isFetching = false;

  Future<void> _onFetched(
    DashboardFetchedEvent event,
    Emitter<DashboardState> emit,
  ) async {
    _isFetching = true;
    try {
      final _response = await _favServiceUseCase.fetchServices(
        page: _page,
        limit: _limit,
      );

      _response.fold((l) => emit(DashboardFailed(failure: l)), (r) {
        final hasReached = r.length < _limit;
        final List<ServiceEntity>? services =
            state is DashboardInitial
                  ? List.of([]..addAll(r))
                  : List.of((state as DashboardSuccess).services)
              ..addAll(r);
        final favs = _favServiceUseCase.getFavoriteIds();
        if (state is DashboardSuccess) {
          emit(
            (state as DashboardSuccess).copyWith(
              status:
                  _page == 1 ? ServicesStatus.initial : ServicesStatus.success,
              services: services,
              hasReachedMax: hasReached,
              favoriteIds: favs,
            ),
          );
        } else {
          emit(
            DashboardSuccess(
              status:
                  _page == 1 ? ServicesStatus.initial : ServicesStatus.success,
              services: services ?? [],
              hasReachedMax: hasReached,
              favoriteIds: favs,
            ),
          );
        }
      });
      _page++;
    } catch (_) {
      emit(
        (state as DashboardSuccess).copyWith(status: ServicesStatus.failure),
      );
    } finally {
      _isFetching = false;
    }
    // }
  }

  Future<void> _onToggled(
    FavoritesToggled event,
    Emitter<DashboardState> emit,
  ) async {
    await _favServiceUseCase.toggleFavorite(event.serviceId);
    final Set<int> favs = _favServiceUseCase.getFavoriteIds();
    if (state is DashboardSuccess) {
      emit((state as DashboardSuccess).copyWith(favoriteIds: favs));
    }
  }

  Future<void> _onReloaded(
    FavoritesReloaded event,
    Emitter<DashboardState> emit,
  ) async {
    final favs = _favServiceUseCase.getFavoriteIds();
    emit((state as DashboardSuccess).copyWith(favoriteIds: favs));
  }

  Future<void> _emitFailure(
    DashboardState? previousState, {
    required Emitter<DashboardState> emit,
    Failure? failure,
  }) async {
    logger.error(failure?.message);

    emit(
      DashboardFailed(
        failure: failure ?? const Failure('-1', AppStrings.defaultErrorMessage),
      ),
    );
  }
}
