import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/core/logger/logger_const.dart';
import '/core/shared_prefs/local_storage.dart';
import '/core/shared_prefs/local_storage_keys.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<CheckAuthentication>(_checkAuthentication);
  }

  Future<void> _checkAuthentication(
    CheckAuthentication event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeInitial());
    final String? token = await LocalStorage.instance.getString(
      key: LocalStorageKeys.accessToken,
    );
    logger.debug("===========>>>>>>Access token : $token");
    final String? refreshToken = await LocalStorage.instance.getString(
      key: LocalStorageKeys.refreshToken,
    );
    logger.debug("===========>>>>>>refreshToken : $refreshToken");
    final String? instanceURL = await LocalStorage.instance.getString(
      key: LocalStorageKeys.instanceURL,
    );
    logger.debug("===========>>>>>>instanceURL : $instanceURL");
    if (token != null && refreshToken != null && instanceURL != null) {
      emit(HomeToDashboard());
    } else {
      emit(HomeToLogin());
    }
  }
}
