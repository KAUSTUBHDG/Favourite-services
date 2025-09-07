part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardFetchedEvent extends DashboardEvent {
  final int page;
  final int limit;
  const DashboardFetchedEvent({this.page = 1, this.limit = 20});
  @override
  List<Object> get props => [page, limit];
}

class FavoritesToggled extends DashboardEvent {
  final int serviceId;
  const FavoritesToggled({required this.serviceId});

  @override
  List<Object> get props => [serviceId];
}

class FavoritesReloaded extends DashboardEvent {}
