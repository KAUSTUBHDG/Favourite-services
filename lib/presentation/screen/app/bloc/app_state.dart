part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object?> get props => <Object?>[];
}

final class AppInitial extends AppState {}

final class AppLoadingState extends AppState {}

final class AppSuccessState extends AppState {
  const AppSuccessState({required this.appTheme});
  final AppEntity appTheme;

  @override
  List<Object?> get props => <Object?>[appTheme];
}

final class AppFailureState extends AppState {
  const AppFailureState({required this.failure});
  final Failure failure;
  @override
  List<Object?> get props => <Object?>[failure];
}
