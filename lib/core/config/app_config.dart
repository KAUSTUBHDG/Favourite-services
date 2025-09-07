// import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/core/di/di.dart';
import '/core/enums/environment_enum.dart';
import '/core/firebase/firebase_remote_config.dart';
import '/core/logger/logger_const.dart';
import '/core/shared_prefs/local_storage.dart';
import '/core/typedef/typedef.dart';

class AppConfig {
  //* MARK: - Constructors
  //? =========================================================
  AppConfig({required this.apiBaseUrl});
  //* MARK: - Public Variables
  //? =========================================================
  // Environment flavor;
  final String apiBaseUrl;
  bool get isInitialized => _isInitialized;

  static AppConfig? getInstance() => _instance;

  //* MARK: - Private Variables
  //? =========================================================
  static AppConfig? _instance;
  static bool _isInitialized = false;

  /// Configures the application by initializing necessary services and settings.
  ///
  /// This method should be called at the start of the application to set up
  /// Firebase and other services based on the specified environment. It checks
  /// if the configuration has already been initialized to avoid redundant
  /// initializations. If the initialization is successful, it creates an
  /// instance of `AppConfig` with the specified environment and base URL.
  ///
  /// Parameters:
  /// * [completer]: A callback function that accepts a boolean value indicating
  ///   whether the configuration was successful or not. This allows the caller
  ///   to handle the result of the configuration process appropriately.
  ///
  /// Throws:
  /// * Throws an exception if there is an error during the initialization process,
  ///   which will be caught and logged.
  ///
  /// Usage:
  /// ```dart
  /// await AppConfig.configure(completer: (success) {
  ///   if (success) {
  ///      Initialization succeeded
  ///   } else {
  ///      Handle initialization failure
  ///   }
  /// });
  /// ```
  ///
  /// Note: Ensure that this method is called before using any Firebase services
  /// or configurations that depend on it.
  static Future<void> configure({required MethodResponse completer}) async {
    try {
      if (_isInitialized) {
        completer(true);

        return;
      }

      //TODO: Change it when flavors are added

      //await AppMethodChannel.app().flavor;

      // late final String _baseURL;

      //TODO: Uncomment this when actual data has been provided
      // if (_flavor == null) {
      //   logger.log(
      //     Level.error,
      //     AppStrings.flavorNotReturned,
      //     // Level.error,
      //     // AppStrings.log.flavorNotReturned,
      //   );
      //   completer(false);

      //   return;
      // }

      // switch (_flavor ?? Environment.dev) {
      //   case Environment.dev:
      //     _baseURL = UrlConstants.devBaseUrl;
      //     break;

      //   case Environment.uat:
      //     _baseURL = UrlConstants.uatBaseUrl;
      //     break;
      //   case Environment.prod:
      //     _baseURL = UrlConstants.prodBaseUrl;
      //     break;
      // }

      // serviceLocator();
      await LocalStorage.instance.init();

      // await Firebase.initializeApp();

      serviceLocator();

      await Hive.initFlutter();
      // Open a box for favorites
      await Hive.openBox('favorites_box');

      // await FirebaseHelper.cloudMessaging.configure();

      // await localNotificationHelper.init();

      // await AppRemoteConfigHelper.instance.initialize(
      //   firebaseApp: getFirebaseApp(
      //       // env: _flavor,
      //       ),
      // );

      _isInitialized = true;
      _instance = AppConfig(
        // flavor: _flavor,
        apiBaseUrl: '',
      );
      // logger.debug(
      //   'App Launched with flavor: $_flavor',
      // );

      completer(true);
    } catch (e, trace) {
      logger.error("Error in AppConfig.configure: $e", stackTrace: trace);
      completer(false);
    }
  }

  /// Returns the Firebase app based on the specified environment.
  ///
  /// The [env] parameter represents the environment for which the Firebase app is needed.
  /// It can be one of the following values: [Environment.dev], [Environment.stage],
  /// [Environment.uat], [Environment.sandbox], or [Environment.prod].
  ///
  /// If the environment is [Environment.dev], [Environment.stage], [Environment.uat],
  /// or [Environment.sandbox], the secondary Firebase app is returned.
  /// If the environment is [Environment.prod], the default Firebase app is returned.
  ///
  /// Returns the Firebase app based on the specified environment.
  // static FirebaseApp getFirebaseApp() {
  //   final List<FirebaseApp> _apps = Firebase.apps;
  //   final FirebaseApp _default = _apps.first;
  //   final FirebaseApp _secondary = _apps.last;
  //   // switch (env) {
  //   // case Environment.dev:
  //   // case Environment.uat:
  //   //   return _secondary;
  //   // case Environment.prod:
  //   return _default;
  //   // }
  // }
}
