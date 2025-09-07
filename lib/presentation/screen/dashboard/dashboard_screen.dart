import 'package:favorite_services_app/domain/entities/service.dart';
import 'package:favorite_services_app/presentation/screen/dashboard/widgets/fav_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/di/di.dart';
import '/presentation/screen/dashboard/bloc/dashboard_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create:
            (context) => locator<DashboardBloc>()..add(DashboardFetchedEvent()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Services'),
            bottom: const TabBar(
              tabs: [Tab(text: 'All Services'), Tab(text: 'Favorites')],
            ),
          ),
          body: SafeArea(
            child: const TabBarView(
              children: [_AllServicesTab(), _FavoritesTab()],
            ),
          ),
        ),
      ),
    );
  }
}

class _AllServicesTab extends StatelessWidget {
  const _AllServicesTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        // If initial, schedule first fetch after build

        if (state is DashboardLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DashboardFailed) {
          final message = state.failure.message;
          return Center(
            child: Text(
              message.isNotEmpty ? message : 'Failed to load services',
            ),
          );
        }

        if (state is DashboardSuccess) {
          final services = state.services;
          final favoriteIds = state.favoriteIds;
          final hasReachedMax = state.hasReachedMax;

          if (services.isEmpty) {
            // Could be empty because none returned
            return const Center(child: Text('No services available'));
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent - 200 &&
                  !hasReachedMax) {
                // only fetch when in success state and not reached max
                context.read<DashboardBloc>().add(
                  const DashboardFetchedEvent(),
                );
              }
              return false;
            },
            child: ListView.builder(
              key: const Key('all_services_list'),
              itemCount: services.length + (hasReachedMax ? 0 : 1),
              itemBuilder: (context, index) {
                if (index >= services.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final service = services[index];
                final isFav = favoriteIds.contains(service.id);
                return FavListItem(
                  key: Key('service_item_${service.id}'),
                  service: service,
                  isFavorite: isFav,
                  onFavoriteTap:
                      () => context.read<DashboardBloc>().add(
                        FavoritesToggled(serviceId: service.id),
                      ),
                );
              },
            ),
          );
        }

        // Fallback (shouldn't get here but keeps widget robust)
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class _FavoritesTab extends StatelessWidget {
  const _FavoritesTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardInitial || state is DashboardLoading) {
          // show loader while data loads
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DashboardFailed) {
          final message = state.failure.message;
          return Center(
            child: Text(
              message.isNotEmpty ? message : 'Failed to load favorites',
            ),
          );
        }

        if (state is DashboardSuccess) {
          // final favs =
          //     state.services
          //         .where((s) => state.favoriteIds.contains(s.id))
          //         .toList();
          // inside build where `state` is DashboardSuccess
          final favs = <ServiceEntity>[];
          final seen = <int>{};
          for (final s in state.services) {
            if (state.favoriteIds.contains(s.id) && seen.add(s.id)) {
              favs.add(s);
            }
          }

          if (favs.isEmpty) {
            return const Center(child: Text('No favorites yet'));
          }

          return ListView.builder(
            key: const Key('favorites_list'),
            itemCount: favs.length,
            itemBuilder: (context, index) {
              final service = favs[index];
              return FavListItem(
                key: Key('fav_item_${service.id}'),
                service: service,
                isFavorite: true,
                onFavoriteTap:
                    () => context.read<DashboardBloc>().add(
                      FavoritesToggled(serviceId: service.id),
                    ),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
