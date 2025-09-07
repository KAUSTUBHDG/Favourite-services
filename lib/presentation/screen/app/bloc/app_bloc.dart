import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '/core/constants/strings.dart';
import '/core/logger/logger_const.dart';
import '/core/networking/failure.dart';
import '/domain/entities/app_theme_entity.dart';

import '/domain/usecase/app_usecase.dart';

part 'app_event.dart';
part 'app_state.dart';

/// A Bloc for managing application state related to theme data.
///
/// The [AppBloc] class extends [Bloc] and is responsible for handling
/// events related to application theme data. It listens for
/// [AppEvent] events and emits [AppState] states based on the results
/// of the operations performed.
///
/// This Bloc interacts with an instance of [AppUseCase] to retrieve
/// the app theme data and manage the loading, success, and failure
/// states accordingly.
class AppBloc extends Bloc<AppEvent, AppState> {
  /// Creates an instance of [AppBloc] with the specified [AppUseCase].
  ///
  /// This constructor initializes the Bloc with an [AppInitial] state
  /// and sets up the event handler for [GetAppData] events.
  ///
  /// [_useCase] is the instance of [AppUseCase] used to fetch the
  /// application theme data.
  AppBloc(this._useCase) : super(AppInitial()) {
    on<GetAppData>(_getAppThemeData);
  }
  final AppUseCase _useCase;

  /// Handles the [GetAppData] event to fetch application theme data.
  ///
  /// This method is invoked when a [GetAppData] event is added to
  /// the Bloc. It emits an [AppLoadingState] while the data is being
  /// fetched. Upon receiving a response, it either emits an
  /// [AppFailureState] if there was an error or an
  /// [AppSuccessState] if the data retrieval was successful.
  ///
  /// Parameters:
  /// * [event]: The [GetAppData] event that triggered this method.
  /// * [emit]: An [Emitter] function to emit new states to the Bloc.
  Future<void> _getAppThemeData(
    GetAppData event,
    Emitter<AppState> emit,
  ) async {
    final AppState _previousState = state;
    emit(AppLoadingState());
    try {
      final Either<Failure, AppEntity> response =
          await _useCase.getAppThemeData();

      response.fold(
        (Failure failure) =>
            _emitFailure(_previousState, emit: emit, failure: failure),
        (AppEntity right) => emit(AppSuccessState(appTheme: right)),
      );
    } on Failure catch (error) {
      await _emitFailure(_previousState, emit: emit, failure: error);
    }
  }

  Future<void> _emitFailure(
    AppState? previousState, {
    required Emitter<AppState> emit,
    Failure? failure,
  }) async {
    logger.error(failure?.message);
    emit(
      AppFailureState(
        failure: failure ?? const Failure('-1', AppStrings.defaultErrorMessage),
      ),
    );
    emit(previousState ?? AppInitial());
  }
}
