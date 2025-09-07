import 'package:dio/dio.dart';
import 'package:favorite_services_app/data/data_source/local/local_db.dart';
import 'package:get_it/get_it.dart';
import '/core/networking/api_client.dart';
import '/data/data_source/remote/app_data_source.dart';
import '../../data/data_source/remote/fav_service.dart';
import '/data/repository/app_repository_impl.dart';
import '../../data/repository/fav_service_repository_impl.dart';
import '/domain/repository/app_repository.dart';
import '../../domain/repository/fav_service_repository.dart';
import '/domain/usecase/app_usecase.dart';
import '../../domain/usecase/fav_service_usecase.dart';
import '/presentation/screen/app/bloc/app_bloc.dart';
import '/presentation/screen/dashboard/bloc/dashboard_bloc.dart';
import '/presentation/screen/home/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

void serviceLocator() {
  locator
    // App
    ..registerFactory(() => Dio())
    ..registerFactory(() => UnauthenticatedApiClient())
    ..registerFactory(() => AuthenticatedApiClient())
    ..registerFactory(() => HomeBloc())
    ..registerFactory(
      () => AppRemoteDataSource(locator<UnauthenticatedApiClient>()),
    )
    ..registerFactory<AppRepository>(
      () => AppRepositoryImpl(locator<AppRemoteDataSource>()),
    )
    ..registerFactory<AppUseCase>(() => AppUseCase(locator<AppRepository>()))
    ..registerFactory<AppBloc>(() => AppBloc(locator<AppUseCase>()))
    // Login
    // Client Details
    ..registerFactory<FavServiceRemoteDataSource>(
      () => FavServiceRemoteDataSource(locator<UnauthenticatedApiClient>()),
    )
    ..registerFactory<ServicesLocalDataSource>(() => ServicesLocalDataSource())
    ..registerFactory<FavServiceRepository>(
      () => FavServiceRepositoryImpl(
        locator<FavServiceRemoteDataSource>(),
        locator<ServicesLocalDataSource>(),
      ),
    )
    ..registerFactory<FavServiceUseCase>(
      () => FavServiceUseCase(locator<FavServiceRepository>()),
    )
    ..registerFactory<DashboardBloc>(
      () => DashboardBloc(locator<FavServiceUseCase>()),
    );
}
