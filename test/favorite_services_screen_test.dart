// This test is a minimal smoke test that the screen builds
import 'package:favorite_services_app/core/di/di.dart';
import 'package:favorite_services_app/data/data_source/remote/fav_service.dart';
import 'package:favorite_services_app/data/repository/fav_service_repository_impl.dart';
import 'package:favorite_services_app/domain/repository/fav_service_repository.dart';
import 'package:favorite_services_app/presentation/screen/dashboard/bloc/dashboard_bloc.dart';
import 'package:favorite_services_app/presentation/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  testWidgets('FavoriteServicesScreen builds', (tester) async {
    await tester.pumpWidget(
      RepositoryProvider.value(
        value: locator<FavServiceRemoteDataSource>(),
        child: BlocProvider(
          create: (_) => locator<DashboardBloc>()..add(DashboardFetchedEvent()),
          child: const MaterialApp(home: DashboardScreen()),
        ),
      ),
    );

    expect(find.text('Services'), findsOneWidget);
  });
}
