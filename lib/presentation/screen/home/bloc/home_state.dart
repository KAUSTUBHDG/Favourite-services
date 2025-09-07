part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => <Object?>[];
}

final class HomeInitial extends HomeState {}

final class HomeToDashboard extends HomeState {}

final class HomeToLogin extends HomeState {}
