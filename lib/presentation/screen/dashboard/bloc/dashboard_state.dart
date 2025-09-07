part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

final class DashboardSuccess extends DashboardState {
  final ServicesStatus status;
  final List<ServiceEntity> services;
  final bool hasReachedMax;
  final Set<int> favoriteIds;

  const DashboardSuccess({
    this.status = ServicesStatus.initial,
    this.services = const <ServiceEntity>[],
    this.hasReachedMax = false,
    this.favoriteIds = const <int>{},
  });

  DashboardSuccess copyWith({
    ServicesStatus? status,
    List<ServiceEntity>? services,
    bool? hasReachedMax,
    Set<int>? favoriteIds,
  }) {
    return DashboardSuccess(
      status: status ?? this.status,
      services: services ?? this.services,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      favoriteIds: favoriteIds ?? this.favoriteIds,
    );
  }

  @override
  List<Object> get props => [status, services, hasReachedMax, favoriteIds];
}

final class DashboardFailed extends DashboardState {
  const DashboardFailed({required this.failure});
  final Failure failure;

  @override
  List<Object> get props => [failure];
}

enum ServicesStatus { initial, success, failure }
