part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => <Object?>[];
}

final class GetAppData extends AppEvent {}
